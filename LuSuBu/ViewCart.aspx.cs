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
            ShowCart();
        }

        protected void gvCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            List<CartItem> cart = (List<CartItem>)Session["cart"];

            cart.RemoveAt(e.RowIndex);
            ShowCart();                       
        }

        protected void ShowCart()
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
                                        ItemTotal = ci.Qty * decimal.Parse(ci.Product.Cost)
                                    };

                decimal total = (decimal)cart.Sum(ci => ci.Qty * decimal.Parse(ci.Product.Cost));
                lblTotal.Text = string.Format("Total Amount: {0:c}", total);
                Session["totalAmount"] = total;
            }
            else
            {
                gvCart.EmptyDataText = "Your cart is Empty.";
            }
            gvCart.DataBind();
        }
    }
}