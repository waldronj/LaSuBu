using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Moolah;

namespace LuSuBu
{
    public partial class Checkout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected void MakeToken()
        //{
        //    Session["name"] = tbName.Text;
        //    Session["phone"] = tbPhoneNumber.Text;
        //    Session["address"] = tbAddress.Text;
        //    var configuration = new Moolah.PayPal.PayPalConfiguration(PaymentEnvironment.Test, "joshwa_1343690783_biz_api1.wildgooselabs.com", "1343690806", "AR8qif2G1INk9vT3GdRW2yZLaSiZAcwuVSqBW76956rFiq4M4l9DBqIX");
        //    var gateway = new Moolah.PayPal.PayPalExpressCheckout(configuration);

        //    var cancelURL = "http://www.thejwal.com";
        //    var confirmationUrl = "http://localhost:63723/default.aspx";

        //    var response = gateway.SetExpressCheckout(new Moolah.PayPal.OrderDetails
        //    {
        //        OrderTotal = decimal.Parse(tbAmount.Text),
        //        Items = new[]
        //                {
        //                new Moolah.PayPal.OrderDetailsItem{UnitPrice = decimal.Parse(tbAmount.Text), Description = "Extermination services provided to: " + tbName.Text}
        //                },
        //        CurrencyCodeType = Moolah.PayPal.CurrencyCodeType.USD
        //    }, cancelURL, confirmationUrl);
        //    if (response.Status == PaymentStatus.Failed)
        //    {
        //        throw new Exception(response.FailureMessage);
        //    }
        //    else
        //    {
        //        Response.Redirect(response.RedirectUrl);

        //    }
        //}

        //protected void MakePayment()
        //{
        //    decimal amount = decimal.Parse(Session["amount"].ToString());
        //    var configuration = new Moolah.PayPal.PayPalConfiguration(PaymentEnvironment.Test, "joshwa_1343690783_biz_api1.wildgooselabs.com", "1343690806", "AR8qif2G1INk9vT3GdRW2yZLaSiZAcwuVSqBW76956rFiq4M4l9DBqIX");
        //    var gateway = new Moolah.PayPal.PayPalExpressCheckout(configuration);
        //    lblSuccess.Text = Request.QueryString["token"] + " Was successfully placed";
        //    var checkoutDetails = gateway.GetExpressCheckoutDetails(Request["token"]);
        //    var response = gateway.DoExpressCheckoutPayment(amount, Moolah.PayPal.CurrencyCodeType.USD, Request["token"], Request["PayerID"]);
        //    if (response.Status == PaymentStatus.Failed)
        //    {
        //        if (response.IsSystemFailure)
        //            // System failures can indicate issues like a configuration problem
        //            throw new Exception(response.FailureMessage);
        //        else
        //            // Non-system failure messages can be shown directly to the customer
        //            lblSuccess.Text = response.FailureMessage.ToString();
        //    }
        //    else
        //    {
        //        lblSuccess.Text = string.Format("Transaction successful! PayPal Reference: {0}", response.TransactionReference);
        //    }

        //}

        //protected void SavePaymentInformation()
        //{
        //    PaymentEntityContainer db = new PaymentEntityContainer();
        //    db.Transactions.Add(new Transactions
        //    {
        //        Amount = Session["amount"].ToString(),
        //        CustomerName = Session["name"].ToString(),
        //        PayPalId = Request.QueryString["PayerID"].ToString(),
        //        PayPalToken = Request.QueryString["token"].ToString(),
        //        Status = Response.Status
        //    });
        //    db.SaveChanges();

        //}

        //protected void btnMakePayment_Click(object sender, EventArgs e)
        //{
        //    MakePayment();
        //    SavePaymentInformation();
        //}
    }
}