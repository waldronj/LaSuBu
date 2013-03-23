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
            CustomerInfo ci = new CustomerInfo{Address = tbName.Text, Phone = tbPhoneNumber.Text, City = tbCity.Text, Name = tbName.Text, State = ddlState.SelectedValue, Zip = tbZip.Text};
            //
            GeneratePayPalToken();
            StoreCustomerInfo(ci);
            
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

        public void GeneratePayPalToken()
        {
            
        }

        public class CustomerInfo
        {
            public string Name { get; set; }
            public string Phone { get; set; }
            public string Address { get; set; }
            public string City { get; set; }
            public string Zip { get; set; }
            public string State { get; set; }
            public string Email { get; set; }
        }


    }
}