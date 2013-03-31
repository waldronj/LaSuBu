<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Orders.aspx.cs" Inherits="LuSuBu.Orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span6 offset3 content">
            <asp:EntityDataSource ID="dsTransactions" runat="server" ConnectionString="name=LaSuBuContainer" DefaultContainerName="LaSuBuContainer" EnableFlattening="False" EntitySetName="Transactions">
            </asp:EntityDataSource>
            <asp:GridView ID="gvOrders" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsTransactions" CellPadding="8" CssClass="table-striped table-hover" AllowSorting="True">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Id" HeaderText="Order Id" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="CustomerName" HeaderText="Customer Name" SortExpression="CustomerName" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" SortExpression="Amount" />
                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />
                </Columns>
            </asp:GridView>
            
            <asp:ListView ID="lvDetails" runat="server" DataKeyNames="Id" DataSourceID="dsDetails" GroupItemCount="3">
               
               
                <EditItemTemplate>
                    <div class="span4">
                        <h3>Order Info</h3>
                        <strong>Order Id:</strong> <asp:Label ID="IdLabel" runat="server" Text='<%# Bind("Id") %>' />
                        <br />
                        <strong>Status:</strong>
                        <asp:TextBox ID="StatusLabel" runat="server" Text='<%# Bind("Status") %>' />
                        <br />
                        <strong>Amount:</strong> <asp:Label ID="AmountLabel" runat="server" Text='<%# Bind("Amount") %>' />
                        <br />
                        <strong>Date:</strong> <asp:Label ID="DateLabel" runat="server" Text='<%# Bind("Date") %>' />
                    </div>    
                    <div class="span4">
                        <h3>PayPal Info</h3>
                        <strong>ReferenceId:</strong> <asp:Label ID="ReferenceIdLabel" runat="server" Text='<%# Bind("ReferenceId") %>' />
                        <br />
                        <strong>Token:</strong> <asp:Label ID="TokenLabel" runat="server" Text='<%# Bind("Token") %>' />
                        <br />
                        <strong>PayerID:</strong>
                        <asp:Label ID="PayerIDLabel" runat="server" Text='<%# Bind("PayerID") %>' />
                        <br />
                    </div>
                    <div class="span4">
                    <h3>Customer Info</h3>
                        <strong>CustomerName:</strong> 
                        <asp:TextBox ID="CustomerNameLabel" runat="server" Text='<%# Bind("CustomerName") %>' />
                        <br />
                        <strong>Phone: </strong>
                        <asp:TextBox ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
                        <br />
                        <strong>Address:</strong> <asp:TextBox ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                        <br />
                        <strong>City:</strong> <asp:TextBox ID="CityLabel" runat="server" Text='<%# Bind("City") %>' />
                        <br />
                        <strong>Zip:</strong> <asp:TextBox ID="ZipLabel" runat="server" Text='<%# Bind("Zip") %>' />
                        <br />
                        <strong>State:</strong> <asp:TextBox ID="StateLabel" runat="server" Text='<%# Bind("State") %>' />
                        <br />
                        <strong>Email:</strong> <asp:TextBox ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                        <br />
                    </div>
                        <br />
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" /> | 
                        
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                    <br /><br />
                   
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
               
                <EmptyItemTemplate>
                    <td runat="server" />
                </EmptyItemTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer" runat="server">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
               
               
                <ItemTemplate>
                    <div class="span4">
                        <h3>Order Info</h3>
                        <strong>Order Id:</strong> <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        <br />
                        <strong>Status:</strong>
                        <asp:Label ID="StatusLabel" runat="server" Text='<%# Eval("Status") %>' />
                        <br />
                        <strong>Amount:</strong> <asp:Label ID="AmountLabel" runat="server" Text='<%# Eval("Amount") %>' />
                        <br />
                        <strong>Date:</strong> <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                    </div>    
                    <div class="span4">
                        <h3>PayPal Info</h3>
                        <strong>ReferenceId:</strong> <asp:Label ID="ReferenceIdLabel" runat="server" Text='<%# Eval("ReferenceId") %>' />
                        <br />
                        <strong>Token:</strong> <asp:Label ID="TokenLabel" runat="server" Text='<%# Eval("Token") %>' />
                        <br />
                        <strong>PayerID:</strong>
                        <asp:Label ID="PayerIDLabel" runat="server" Text='<%# Eval("PayerID") %>' />
                        <br />
                    </div>
                    <div class="span4">
                    <h3>Customer Info</h3>
                        <strong>CustomerName:</strong> 
                        <asp:Label ID="CustomerNameLabel" runat="server" Text='<%# Eval("CustomerName") %>' />
                        <br />
                        <strong>Phone: </strong>
                        <asp:Label ID="PhoneLabel" runat="server" Text='<%# Eval("Phone") %>' />
                        <br />
                        <strong>Address:</strong> <asp:Label ID="AddressLabel" runat="server" Text='<%# Eval("Address") %>' />
                        <br />
                        <strong>City:</strong> <asp:Label ID="CityLabel" runat="server" Text='<%# Eval("City") %>' />
                        <br />
                        <strong>Zip:</strong> <asp:Label ID="ZipLabel" runat="server" Text='<%# Eval("Zip") %>' />
                        <br />
                        <strong>State:</strong> <asp:Label ID="StateLabel" runat="server" Text='<%# Eval("State") %>' />
                        <br />
                        <strong>Email:</strong> <asp:Label ID="EmailLabel" runat="server" Text='<%# Eval("Email") %>' />
                        <br />
                    </div>
                    <div>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Edit" Text="Edit" />
                        <br /><br />
                    </div>
                        
                        
                        
                   
                </ItemTemplate>
                <LayoutTemplate>
                   <div id="groupPlaceholderContainer" runat="server" class="row-fluid">
                                <div id="groupPlaceholder" runat="server">
                                    
                                </div>
                       </div>
                            
                        
                </LayoutTemplate>
            </asp:ListView>

            <asp:SqlDataSource ID="dsDetails" runat="server" ConnectionString="<%$ ConnectionStrings:LaSuBuConnectionString %>" SelectCommand="SELECT * FROM [Transactions] WHERE ([Id] = @Id)" DeleteCommand="DELETE FROM [Transactions] WHERE [Id] = @Id" InsertCommand="INSERT INTO [Transactions] ([CustomerName], [Amount], [Token], [PayerID], [Date], [Phone], [Address], [City], [Zip], [State], [Email], [ReferenceId], [Status]) VALUES (@CustomerName, @Amount, @Token, @PayerID, @Date, @Phone, @Address, @City, @Zip, @State, @Email, @ReferenceId, @Status)" UpdateCommand="UPDATE [Transactions] SET [CustomerName] = @CustomerName, [Amount] = @Amount, [Token] = @Token, [PayerID] = @PayerID, [Date] = @Date, [Phone] = @Phone, [Address] = @Address, [City] = @City, [Zip] = @Zip, [State] = @State, [Email] = @Email, [ReferenceId] = @ReferenceId, [Status] = @Status WHERE [Id] = @Id" OnUpdated="dsDetails_Updated">
                <DeleteParameters>
                    <asp:Parameter Name="Id" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="CustomerName" Type="String" />
                    <asp:Parameter Name="Amount" Type="String" />
                    <asp:Parameter Name="Token" Type="String" />
                    <asp:Parameter Name="PayerID" Type="String" />
                    <asp:Parameter Name="Date" Type="DateTime" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Zip" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="ReferenceId" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                </InsertParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvOrders" Name="Id" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="CustomerName" Type="String" />
                    <asp:Parameter Name="Amount" Type="String" />
                    <asp:Parameter Name="Token" Type="String" />
                    <asp:Parameter Name="PayerID" Type="String" />
                    <asp:Parameter Name="Date" Type="DateTime" />
                    <asp:Parameter Name="Phone" Type="String" />
                    <asp:Parameter Name="Address" Type="String" />
                    <asp:Parameter Name="City" Type="String" />
                    <asp:Parameter Name="Zip" Type="String" />
                    <asp:Parameter Name="State" Type="String" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="ReferenceId" Type="String" />
                    <asp:Parameter Name="Status" Type="String" />
                    <asp:Parameter Name="Id" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <div class="row-fluid">
                <div class="span12">
            <asp:GridView ID="gvItems" runat="server" AutoGenerateColumns="False" DataKeyNames="Id" DataSourceID="dsOrderDetails" CssClass="table-hover table-striped" CellPadding="8">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="Id" InsertVisible="False" ReadOnly="True" SortExpression="Id" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Size" HeaderText="Size" SortExpression="Size" />
                    <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    <asp:BoundField DataField="TransactionId" HeaderText="TransactionId" SortExpression="TransactionId" />
                    <asp:BoundField DataField="Qty" HeaderText="Qty" SortExpression="Qty" />
                </Columns>
            </asp:GridView>
                </div>
                </div>
            <asp:SqlDataSource ID="dsOrderDetails" runat="server" ConnectionString="<%$ ConnectionStrings:LaSuBuConnectionString %>" SelectCommand="SELECT * FROM [TransItems] WHERE ([TransactionId] = @TransactionId)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="gvOrders" Name="TransactionId" PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
   
    
    <script>
        $("#MainContent_lvDetails_ctrl0_UpdateButton_0").addClass("btn btn-primary");
        $("#MainContent_lvDetails_ctrl0_CancelButton_0").addClass("btn btn-inverse");
    </script>
</asp:Content>
