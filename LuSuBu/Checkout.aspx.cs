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
            
        }
        
        public void Make_Payment(object sender, EventArgs e)
        {
            CustomerInfo ci = new CustomerInfo{Address = tbAddress.Text, Phone = tbPhoneNumber.Text, City = tbCity.Text, Name = tbName.Text, State = ddlState.SelectedValue, Zip = tbZip.Text};

            if (Session["cart"] != null)
            {
                StoreCustomerInfo(ci);
                StoreTransactionItems();
                GeneratePayPalToken();    
            }
            else
            {
                lblWarning.Text = "No items in your shopping cart";
                lblWarning.ForeColor = System.Drawing.Color.Red;
            }
            
        }

        public void StoreCustomerInfo(CustomerInfo ci)
        {
            var db = new LaSuBuContainer();

            var currentDate = DateTime.Now;
            Transaction currentTrans = new Transaction
                {
                    Address = ci.Address,
                    Amount = Session["totalAmount"].ToString(),
                    City = ci.City,
                    CustomerName = ci.Name,
                    Date = currentDate,
                    Email = ci.Email,
                    Phone = ci.Phone,
                    Zip = ci.Zip,
                    State = ci.State, 
                    Status = "Failed"
                };
            
            db.Transactions.Add(currentTrans);
            db.SaveChanges();
            //setUsername / id of transaction in session to persist PayPal Info
            Session["customerName"] = ci.Name;
            Session["transId"] = currentTrans.Id;
        }

        public void StoreTransactionItems()
        {
            LaSuBuContainer DB = new LaSuBuContainer();
            var getTransId = Session["transId"].ToString();
            var transId = int.Parse(getTransId);
            foreach (var item in (List<CartItem>)Session["cart"])
            {
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
            DB.SaveChanges();
        }

        public void GeneratePayPalToken()
        {
            List<CartItem> cart = (List<CartItem>)Session["cart"];
            
            string userId = System.Configuration.ConfigurationManager.AppSettings["userId"].ToString();
            string password = System.Configuration.ConfigurationManager.AppSettings["password"].ToString();
            string signature = System.Configuration.ConfigurationManager.AppSettings["signature"].ToString();
            
            decimal amount = (decimal)cart.Sum(ci => ci.Qty * decimal.Parse(ci.Product.Cost));
            var configuration = new Moolah.PayPal.PayPalConfiguration(PaymentEnvironment.Test, userId, password, signature);
            var gateway = new Moolah.PayPal.PayPalExpressCheckout(configuration);
            var cancelURL = "http://www.lasubu.com";
            var confirmationUrl = "http://localhost:9999/confirmation.aspx";
            
            var request = gateway.SetExpressCheckout(new Moolah.PayPal.OrderDetails
            {
                OrderTotal = amount,
                Items = new[]
                    {
                    new Moolah.PayPal.OrderDetailsItem{UnitPrice = decimal.Parse(Session["totalAmount"].ToString()), Description = "Goods from LaSuBu.com"}
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