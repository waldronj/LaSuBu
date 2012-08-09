<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="LuSuBu.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table>
        <tr>
            <td>
   <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="Id" OnRowDeleting="gvCart_RowDeleting" Width="600px" RowStyle-HorizontalAlign="Center" HeaderStyle-ForeColor="#f6008a">
         <Columns>
            <asp:BoundField DataField="ItemName" HeaderText="Product" />
            <asp:BoundField DataField="Cost" HeaderText="Cost Per Item" />
            <asp:BoundField DataField="Qty"     HeaderText="Quantity"/>
            <asp:BoundField DataField="Size" HeaderText="Size" />
            <asp:BoundField DataField="ItemTotal" DataFormatString="{0:c}" 
                 HeaderText="Item Total" >
             <ItemStyle HorizontalAlign="Center" />
             </asp:BoundField>
            <asp:ButtonField CommandName="Delete" CausesValidation="false" ButtonType="Link" Text="Remove from Cart" />
        </Columns>
    </asp:GridView>
            </td>
        </tr>
    <tr>
        <td>
                 <asp:Label ID="lblTotal" runat="server" Font-Bold="true"></asp:Label>
        </td>
    </tr>
    
    </table>
</asp:Content>
