using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LuSuBu
{
    public partial class ViewCart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cart"] != null)
            {
                List<CartItem> cart = (List<CartItem>)Session["cart"];
                gvCart.DataSource = from ci in cart 
                                    select new  
                                        {
                                            ci.Product.Id,
                                            ci.Product.ItemName,
                                            ci.Product.Cost,
                                            ci.Qty,
                                            ci.Size,
                                            ItemTotal = ci.Qty * ci.Product.Cost
                                        };
                decimal total = cart.Sum(ci => ci.Qty * ci.Product.Cost);
                lblTotal.Text = string.Format("Total Amount: {0:c}", total);
            }
            else
            {
                gvCart.EmptyDataText = "Your cart is Empty.";
            }
            gvCart.DataBind();
        }

        protected void gvCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {

        }
    }
}