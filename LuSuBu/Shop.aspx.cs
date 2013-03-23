using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using LuSuBu;
using System.Web.UI.HtmlControls;

namespace LuSuBu
{
    public partial class Shop : System.Web.UI.Page
    {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlGenericControl li = (HtmlGenericControl)Master.FindControl("b3");
            li.Attributes["class"] = "selected";
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
           
            LaSuBuContainer db = new LaSuBuContainer();
            //1) the product to be added
            StoreItem theproduct = (from p in db.StoreItems
                                     where p.Id == (int)lvShop.SelectedValue
                                     select p).Single();

            //2) the qty

            //get the tbbox
            //textbox tbqty = (textbox)dvselectedproduct.findcontrol("tbqty");
            //int qty = int.parse(tbqty.text);

           // TextBox ddlQty = (TextBox).FindControl("ddlQty");
            DropDownList ddlQty = (DropDownList)lvSelectedItem.Items[0].FindControl("ddlQty");
            DropDownList ddlSize = (DropDownList)lvSelectedItem.Items[0].FindControl("ddlSize");
            Label lblTest = new Label();
            // lblTest.Text = ddlQty.Text;
            //or
            int qty = int.Parse(ddlQty.SelectedValue.ToString());
            string size = ddlSize.SelectedValue.ToString();
           
            //cart item
            CartItem item = new CartItem(theproduct, qty, size);

            //cart logic
            List<CartItem> cart = null;

            //is the cart already in the session
            if (Session["cart"] != null)
            {
                //cart is already in the session
                cart = (List<CartItem>)Session["cart"];
            }
            else
            {
                //no cart in the session create a new one
                cart = new List<CartItem>();
            }

            //add the item to the cart
            cart.Add(item);

            //put the cart back in the session
            Session["cart"] = cart;
            //mvShop.SetActiveView(vwConfirm);
            mvShop.SetActiveView(vwConfirm);
            lblConfirm.Text = "Item has been added to your cart";
            
        }

        protected void ShoppingCart()
        {
           
        }

        protected void lvShop_SelectedIndexChanging(object sender, ListViewSelectEventArgs e)
        {
            this.lvShop.SelectedIndex = e.NewSelectedIndex;
            LaSuBuContainer db = new LaSuBuContainer();
            var selectedItem = int.Parse(lvShop.SelectedValue.ToString());
            var dsSelectedItem = db.StoreItems.Where(n => n.Id == selectedItem).ToArray();
            lvSelectedItem.DataSource = dsSelectedItem;
            lvSelectedItem.DataBind();
            mvShop.SetActiveView(vwProduct);

            
        }

        protected void btnBackToShop_Click(object sender, EventArgs e)
        {
            mvShop.SetActiveView(vwShop);
            lvShop.SelectedIndex = -1;
        }

      
    }
}