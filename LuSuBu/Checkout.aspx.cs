using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Moolah;
using System.Data.Entity;

namespace LuSuBu
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblTest.Text = System.Configuration.ConfigurationManager.AppSettings["Test"].ToString();
        }
        
        public void Make_Payment(object sender, EventArgs e)
        {
            CustomerInfo ci = new CustomerInfo{Address = tbName.Text, Phone = tbPhoneNumber.Text, City = tbCity.Text, Name = tbName.Text, State = ddlState.SelectedValue, Zip = tbZip.Text};
            
            GeneratePayPalToken();
            StoreCustomerInfo(ci);
            StoreTransactionItems();

        }

        public void StoreCustomerInfo(CustomerInfo ci)
        {
            var db = new LaSuBuContainer();
            
            Transaction currentTrans = new Transaction
                {
                    Address = ci.Address,
                    Amount = decimal.Parse((Session["totalAmount"].ToString())),
                    City = ci.City,
                    CustomerName = ci.Name,
                    Date = DateTime.Now,
                    Email = ci.Email,
                    Phone = ci.Phone,
                    Zip = ci.Zip
                };
            
            db.Transactions.Add(currentTrans);
            db.SaveChanges();
             
            
        }

        public void StoreTransactionItems()
        {
            foreach (var item in (List<CartItem>)Session["cart"])
            {
                LaSuBuContainer DB = new LaSuBuContainer();
                var transId = (from x in DB.Transactions
                                  where x.CustomerName == tbName.Text
                                  select x.Id).FirstOrDefault();
                TransItem ti = new TransItem
                    {
                        Name = item.Product.ItemName,
                        Qty = item.Qty,
                        Size = item.Size,
                        Price = item.Product.Cost.ToString(),
                        TransactionId = transId
                        
                    };

                DB.TransItems.Add(ti);
            }
        }

        public void GeneratePayPalToken()
        {
            List<CartItem> cart = (List<CartItem>)Session["cart"];
            string userId = System.Configuration.ConfigurationManager.AppSettings["userId"].ToString();
            string password = System.Configuration.ConfigurationManager.AppSettings["password"].ToString();
            string signature = System.Configuration.ConfigurationManager.AppSettings["signature"].ToString();
            
            decimal amount = cart.Sum(ci => ci.Qty * ci.Product.Cost);
            var configuration = new Moolah.PayPal.PayPalConfiguration(PaymentEnvironment.Test, userId, password,
                                                                      signature);
            var gateway = new Moolah.PayPal.PayPalExpressCheckout(configuration);
            var cancelURL = "http://www.lasubu.com";
            var confirmationUrl = "http://www.lasubu.com/Confirmation.aspx";
            
            var request = gateway.SetExpressCheckout(new Moolah.PayPal.OrderDetails
            {
                OrderTotal = amount,
                Items = new[]
                    {
                    new Moolah.PayPal.OrderDetailsItem{UnitPrice = decimal.Parse(Session["amount"].ToString()), Description = "Ordering of goods from LaSuBu.com"}
                    },
                CurrencyCodeType = Moolah.PayPal.CurrencyCodeType.USD
            }, cancelURL, confirmationUrl);
            if (request.Status == PaymentStatus.Failed)
            {
                throw new Exception(request.FailureMessage);
            }
            else
            {
                // MakePayment();
                Response.Redirect(request.RedirectUrl);
            } 
        }
    }
}