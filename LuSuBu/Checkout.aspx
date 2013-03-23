<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Checkout.aspx.cs" Inherits="LuSuBu.Checkout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
      <div class="row-fluid">
        <div class="span4 offset3 content">
    <table class="table">
        <tr>
            <td>
                <h4>Name:</h4>
            </td>
            <td>
                <asp:TextBox ID="tbName" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <h4>Phone:</h4>
            </td>
            <td>
                <asp:TextBox ID="tbPhoneNumber" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <h4>Address:</h4>
            </td>
            <td>
                <asp:TextBox ID="tbAddress" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <h4>City:</h4>
            </td>
            <td>
                <asp:TextBox ID="tbCity" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <h4>Zip:</h4>
            </td>
            <td>
                <asp:TextBox ID="tbZip" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                <h4>State:</h4>
            </td>
            <td>
                <asp:DropDownList ID="ddlState" runat="server"  >
                    <asp:ListItem>[- Select a State -]</asp:ListItem>
                    <asp:ListItem>Alabama</asp:ListItem>
                    <asp:ListItem>Alaska</asp:ListItem>
                    <asp:ListItem>Arizona</asp:ListItem>
                    <asp:ListItem>Arkansas</asp:ListItem>
                    <asp:ListItem>California</asp:ListItem>
                    <asp:ListItem>Colorado</asp:ListItem>
                    <asp:ListItem>Connecticut</asp:ListItem>
                    <asp:ListItem>Delaware</asp:ListItem>
                    <asp:ListItem>Florida</asp:ListItem>
                    <asp:ListItem>Georgia</asp:ListItem>
                    <asp:ListItem>Hawaii</asp:ListItem>
                    <asp:ListItem>Idaho</asp:ListItem>
                    <asp:ListItem>Illinois</asp:ListItem>
                    <asp:ListItem>Indiana</asp:ListItem>
                    <asp:ListItem>Iowa</asp:ListItem>
                    <asp:ListItem>Kansas</asp:ListItem>
                    <asp:ListItem>Kentucky</asp:ListItem>
                    <asp:ListItem>Louisiana</asp:ListItem>
                    <asp:ListItem>Maine</asp:ListItem>
                    <asp:ListItem>Maryland</asp:ListItem>
                    <asp:ListItem>Massachuesetts</asp:ListItem>
                    <asp:ListItem>Michigan</asp:ListItem>
                    <asp:ListItem>Minnesota</asp:ListItem>
                    <asp:ListItem>Mississippi</asp:ListItem>
                    <asp:ListItem>Missouri</asp:ListItem>
                    <asp:ListItem>Montana</asp:ListItem>
                    <asp:ListItem>Nebraska</asp:ListItem>
                    <asp:ListItem>Nevada</asp:ListItem>
                    <asp:ListItem>New Hampshire</asp:ListItem>
                    <asp:ListItem>New Jersey</asp:ListItem>
                    <asp:ListItem>New Mexico</asp:ListItem>
                    <asp:ListItem>New York</asp:ListItem>
                    <asp:ListItem>North Carolina</asp:ListItem>
                    <asp:ListItem>North Dakota</asp:ListItem>
                    <asp:ListItem>Ohio</asp:ListItem>
                    <asp:ListItem>Oklahoma</asp:ListItem>
                    <asp:ListItem>Oregon</asp:ListItem>
                    <asp:ListItem>Pennsylvania</asp:ListItem>
                    <asp:ListItem>Rhode Island</asp:ListItem>
                    <asp:ListItem>South Carolina</asp:ListItem>
                    <asp:ListItem>South Dakota</asp:ListItem>
                    <asp:ListItem>Tennessee</asp:ListItem>
                    <asp:ListItem>Texas</asp:ListItem>
                    <asp:ListItem>Utah</asp:ListItem>
                    <asp:ListItem>Vermont</asp:ListItem>
                    <asp:ListItem>Virginia</asp:ListItem>
                    <asp:ListItem>Washington</asp:ListItem>
                    <asp:ListItem>West Virginia</asp:ListItem>
                    <asp:ListItem>Wisconsin</asp:ListItem>
                    <asp:ListItem>Wyoming</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td><h4>Email Address:</h4></td>
            <td><asp:TextBox runat="server" ID="tbEmail"></asp:TextBox></td>
        </tr>
         <tr>
             <td></td>
        <td><asp:ImageButton ID="btnCheckout" runat="server" ImageUrl="~/Images/paypal.jpg" OnClick="Make_Payment"/></td>
    </tr>
    </table>
</div>
          </div>
</asp:Content>
