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
    public partial class Confirmation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString["token"]==null)
            {
                lblConfirm.Text = "No Payment information, no charges have been made.";
            }
            else
            {
                MakePayment();
                StorePaymentInfo();
            }
        }

        protected void MakePayment()
        {
            string userId = System.Configuration.ConfigurationManager.AppSettings["userId"].ToString();
            string password = System.Configuration.ConfigurationManager.AppSettings["password"].ToString();
            string signature = System.Configuration.ConfigurationManager.AppSettings["signature"].ToString();
            decimal amount = decimal.Parse(Session["totalamount"].ToString());
            var configuration = new Moolah.PayPal.PayPalConfiguration(PaymentEnvironment.Test, userId, password, signature);
            var gateway = new Moolah.PayPal.PayPalExpressCheckout(configuration);
            lblConfirm.Text = Request.QueryString["token"] + " Was successfully placed";
            var checkoutDetails = gateway.GetExpressCheckoutDetails(Request["token"]);
            var response = gateway.DoExpressCheckoutPayment(amount, Moolah.PayPal.CurrencyCodeType.USD, Request["token"], Request["PayerID"]);
            if (response.Status == PaymentStatus.Failed)
            {
                if (response.IsSystemFailure)
                    // System failures can indicate issues like a configuration problem
                    throw new Exception(response.FailureMessage);
                else
                    // Non-system failure messages can be shown directly to the customer
                    lblConfirm.Text = response.FailureMessage.ToString();
            }
            else
            {
                lblConfirm.Text = string.Format("Transaction successful! <br />PayPal Reference: <strong>{0}</strong> <br /><br />Thank you {1} for paying online.", response.TransactionReference, Session["name"]);
            }
        }

        protected void StorePaymentInfo()
        {
            int transId = int.Parse(Session["transId"].ToString());
            LaSuBuContainer DB  = new LaSuBuContainer();
            var storeTrans = (from x in DB.Transactions
                                     where x.Id == transId 
                                     select x).FirstOrDefault();
            storeTrans.Token = Request.QueryString["token"];
            storeTrans.PayerID = Request.QueryString["PayerId"];
            DB.SaveChanges();
        }
    }
}