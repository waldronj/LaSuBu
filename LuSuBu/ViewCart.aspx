<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="LuSuBu.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row-fluid">
        <div class="span6 offset3">
    
   <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" OnRowDeleting="gvCart_RowDeleting" CssClass="table" GridLines="None" >
         <Columns>
            <asp:BoundField DataField="ItemName" HeaderText="Product" />
            <asp:BoundField DataField="Cost" HeaderText="Cost Per Item" />
            <asp:BoundField DataField="Qty"     HeaderText="Quantity"/>
            <asp:BoundField DataField="Size" HeaderText="Size" />
            <asp:BoundField DataField="ItemTotal" DataFormatString="{0:c}" 
                 HeaderText="Item Total" >
             <ItemStyle HorizontalAlign="Center" />
             </asp:BoundField>
            <asp:ButtonField CommandName="Delete" CausesValidation="false" ButtonType="Button" Text="Remove from Cart" />
        </Columns>
    </asp:GridView>
        <div>
            <asp:Label ID="lblTotal" runat="server" Font-Bold="true"></asp:Label>
        </div> 
        <div>
            <a href="Checkout.aspx" runat="server">Checkout</a>
        </div> 
            </div>
        </div>
    <script type="text/javascript">
        $("#MainContent_gvCart").removeAttr("style");
        $("#MainContent_gvCart").addClass("table");
        $(":button").addClass("btn btn-inverse");
        
    </script>
</asp:Content>
