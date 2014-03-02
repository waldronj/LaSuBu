<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModifyStore.aspx.cs" Inherits="LuSuBu.AddItemToStore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span12 content">
    
            <asp:EntityDataSource ID="dsModifyStore" runat="server" 
                ConnectionString="name=LaSuBuContainer" DefaultContainerName="LaSuBuContainer" 
                EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EnableDelete="True"
                EntitySetName="StoreItems"></asp:EntityDataSource>
            <asp:ListView ID="lvModify" runat="server" DataKeyNames="Id" OnItemInserting="on_item_inserting" OnItemUpdating="on_item_updating"
                DataSourceID="dsModifyStore" InsertItemPosition="FirstItem">
        
                <EditItemTemplate>
                    <tr>
                        <td>
                            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" OnPreRender="AdminControl_PreRender"
                                Text="Update" CssClass="btn btn-primary"/>
                        </td>
                        <td>
                            <asp:TextBox ID="ItemNameTextBox" runat="server" 
                                Text='<%# Bind("ItemName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CostTextBox" runat="server" Text='<%# Bind("Cost") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="DescriptionTextBox" runat="server" 
                                Text='<%# Bind("Description") %>' />
                        </td>
                        <td>
                            <asp:FileUpload runat="server" ID="fupload"/>
                        </td>
                        <td>
                             <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" OnPreRender="AdminControl_PreRender"
                                Text="Cancel" CssClass="btn btn-danger"/>
                        </td>
                    </tr>
                </EditItemTemplate>
                <EmptyDataTemplate>
                    <table runat="server" style="">
                        <tr>
                            <td>No data was returned.</td>
                        </tr>
                    </table>
                </EmptyDataTemplate>
                <InsertItemTemplate>
                    <tr>
                        <td>
                            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" OnPreRender="AdminControl_PreRender"
                                Text="Insert" CssClass="btn btn-primary"/>
                        </td>
                       
                        <td>
                            <asp:TextBox ID="ItemNameTextBox" runat="server"  placeholder="Item Name"
                                Text='<%# Bind("ItemName") %>' />
                        </td>
                        <td>
                            <asp:TextBox ID="CostTextBox" runat="server" Text='<%# Bind("Cost") %>' placeholder="Cost" />
                        </td>
                        <td>
                            <asp:TextBox ID="DescriptionTextBox" runat="server" placeholder="Description"
                                Text='<%# Bind("Description") %>' />
                        </td>
                        <td style="text-align:left">
                            <asp:FileUpload runat="server" ID="fupload"/>
                        </td>
                        <td>
                             <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" OnPreRender="AdminControl_PreRender"
                                Text="Clear" CssClass="btn btn-danger"/>
                        </td>
                    </tr>
                </InsertItemTemplate>
                <ItemTemplate>
                    <tr>
                        <td>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" OnPreRender="AdminControl_PreRender" CssClass="btn btn-primary"/>
                        </td>
                        <td style="padding-left:1em">
                             <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CostLabel" runat="server" Text='<%# Eval("Cost", "{0:C}") %>'  />
                        </td>
                        <td>
                            <asp:Label ID="DescriptionLabel" runat="server" 
                                Text='<%# Eval("Description") %>' />
                        </td>
                        <td style="text-align:left">
                            <asp:Label ID="ImageURLLabel" runat="server" Text='<%# Eval("ImageURL") %>'  />
                        </td>
                        <td>
                             <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" Text="Delete" OnPreRender="AdminControl_PreRender" CssClass="btn btn-inverse"/>
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <table runat="server">
                        <tr runat="server">
                            <td runat="server">
                                <table id="itemPlaceholderContainer" runat="server" class="table table-hover">
                                    <tr runat="server" style="">
                                        <th runat="server"></th>
                                        <th runat="server">ItemName</th>
                                        <th runat="server">Cost</th>
                                        <th runat="server">Description</th>
                                        <th runat="server"  style="text-align:left">ImageURL</th>
                                    </tr>
                                    <tr id="itemPlaceholder" runat="server">
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr runat="server">
                            <td runat="server" style=""></td>
                        </tr>
                    </table>
                </LayoutTemplate>
                <SelectedItemTemplate>
                    <tr style="">
                        <td>
                            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
                        </td>
                        <td>
                            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                        </td>
                        <td>
                            <asp:Label ID="CostLabel" runat="server" Text='<%# Eval("Cost") %>' />
                        </td>
                        <td>
                            <asp:Label ID="DescriptionLabel" runat="server" 
                                Text='<%# Eval("Description") %>' />
                        </td>
                        <td>
                            <asp:Label ID="ImageURLLabel" runat="server" Text='<%# Eval("ImageURL") %>' />
                        </td>
                    </tr>
                </SelectedItemTemplate>
            </asp:ListView>
    </div>
        </div>
</asp:Content>
