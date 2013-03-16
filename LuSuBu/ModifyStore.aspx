<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ModifyStore.aspx.cs" Inherits="LuSuBu.AddItemToStore" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:EntityDataSource ID="dsModifyStore" runat="server" 
        ConnectionString="name=LaSuBuContainer" DefaultContainerName="LaSuBuContainer" 
        EnableFlattening="False" EnableInsert="True" EnableUpdate="True" 
        EntitySetName="StoreItems"></asp:EntityDataSource>
    <asp:ListView ID="lvModify" runat="server" DataKeyNames="Id" 
        DataSourceID="dsModifyStore" InsertItemPosition="LastItem">
        
        <EditItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" OnPreRender="AdminControl_PreRender"
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" OnPreRender="AdminControl_PreRender"
                        Text="Cancel" />
                </td>
                <td>
                    <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
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
                    <asp:TextBox ID="ImageURLTextBox" runat="server" 
                        Text='<%# Bind("ImageURL") %>' />
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
            <tr style="">
                <td>
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" OnPreRender="AdminControl_PreRender"
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" OnPreRender="AdminControl_PreRender"
                        Text="Clear" />
                </td>
                <td>
                   
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
                <td style="text-align:left">
                    <asp:TextBox ID="ImageURLTextBox" runat="server" 
                        Text='<%# Bind("ImageURL") %>' />
                </td>
            </tr>
        </InsertItemTemplate>
        <ItemTemplate>
            <tr style="">
                <td>
                    <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" OnPreRender="AdminControl_PreRender"/>
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
                <td style="text-align:left">
                    <asp:Label ID="ImageURLLabel" runat="server" Text='<%# Eval("ImageURL") %>'  />
                </td>
            </tr>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="itemPlaceholderContainer" runat="server" border="0" style="">
                            <tr runat="server" style="">
                                <th runat="server"></th>
                                <th runat="server">Id</th>
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
</asp:Content>
