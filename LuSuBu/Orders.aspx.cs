using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LuSuBu
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.IsInRole("admin"))
            {
                Response.Redirect("http://localhost:9999/");
                gvOrders.DataSourceID = "dsTransactions";
                gvOrders.DataBind();
            }
            
        }

        protected void dsOrderDetails_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            gvOrders.DataSource = dsTransactions;
            gvOrders.DataBind();

        }
    }
}