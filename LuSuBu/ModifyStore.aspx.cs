﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

namespace LuSuBu
{
    public partial class AddItemToStore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //LoginView lvView = (LoginView)Master.FindControl("logview");
            //HtmlGenericControl li = (HtmlGenericControl)lvView.FindControl("b4");
            //li.Attributes["class"] = "selected";
            if (!User.IsInRole("admin"))
            {
                lvModify.Visible=false;
            }
           
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