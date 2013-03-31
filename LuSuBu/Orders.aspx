<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="LuSuBu.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span6 offset3 content">
            <asp:EntityDataSource ID="dsTransactions" runat="server" ConnectionString="name=LaSuBuContainer" DefaultContainerName="LaSuBuContainer" EnableFlattening="False" EntitySetName="Transactions">
            </asp:EntityDataSource>
            <asp:GridView ID="gvOrders" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsTransactions" CellPadding="8" CssClass="table-striped table-hover">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Order Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" SortExpression="CustomerName" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
            </asp:GridView>

        </div>
    </div>
    <script>
   
    </script>
</asp:Content>
