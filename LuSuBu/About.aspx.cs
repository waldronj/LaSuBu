using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace LuSuBu
{
    public partial class About : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlGenericControl li = (HtmlGenericControl)Master.FindControl("b2");
            li.Attributes["class"] = "selected";
        }

        protected void AdminControl_PreRender(object sender, EventArgs e)
        {
            if (!User.IsInRole("admin"))
            {
                //grab the control held in the sender object), cast it to a generic control so that we can hide ANY control.
                ((Control)sender).Visible = false;
            }
        }
    }
}