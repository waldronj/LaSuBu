<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="LuSuBu.Shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:EntityDataSource ID="dsStore" runat="server" 
        ConnectionString="name=LaSuBuContainer" DefaultContainerName="LaSuBuContainer" 
        EnableFlattening="False" EnableUpdate="True" 
        EntitySetName="StoreItems"></asp:EntityDataSource>
    <asp:ListView ID="lvShop" runat="server" DataKeyNames="Id" 
        DataSourceID="dsStore" GroupItemCount="5">
        <AlternatingItemTemplate>
            <td id="Td1" runat="server" style="">
                <asp:Image ID="ImageURLLabel" runat="server" ImageUrl='<%# Eval("ImageURL") %>' />
                <br />
                <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                <br />Cost:
                <asp:Label ID="CostLabel" runat="server" Text='<%# Eval("Cost") %>'  />
                
                <br />
                </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="">Id:
                <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
                <br />ItemName:
                <asp:TextBox ID="ItemNameTextBox" runat="server" 
                    Text='<%# Bind("ItemName") %>' />
                <br />Cost:
                <asp:TextBox ID="CostTextBox" runat="server" Text='<%# Bind("Cost") %>' />
                <br />Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />ImageURL:
                <asp:TextBox ID="ImageURLTextBox" runat="server" 
                    Text='<%# Bind("ImageURL") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                    Text="Update" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Cancel" />
                <br /></td>
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
      
        <InsertItemTemplate>
            <td runat="server" style="">Id:
                <asp:TextBox ID="IdTextBox" runat="server" Text='<%# Bind("Id") %>' />
                <br />
                ItemName:
                <asp:TextBox ID="ItemNameTextBox" runat="server" 
                    Text='<%# Bind("ItemName") %>' />
                <br />
                Cost:
                <asp:TextBox ID="CostTextBox" runat="server" Text='<%# Bind("Cost") %>' />
                <br />
                Description:
                <asp:TextBox ID="DescriptionTextBox" runat="server" 
                    Text='<%# Bind("Description") %>' />
                <br />
                ImageURL:
                <asp:TextBox ID="ImageURLTextBox" runat="server" 
                    Text='<%# Bind("ImageURL") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                    Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Clear" />
                <br />
            </td>
        </InsertItemTemplate>
      
        <ItemTemplate>
            <td runat="server" style="">
                <asp:Image ID="ImageURLLabel" runat="server" ImageUrl='<%# Eval("ImageURL") %>' />
                <br />
                <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                <br />Cost:
                <asp:Label ID="CostLabel" runat="server" Text='<%# Eval("Cost") %>'  />
                
                <br />
                </td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" >
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12" >
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowLastPageButton="True" />
                            </Fields>
                        </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="">Id:
                <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
                <br />ItemName:
                <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                <br />Cost:
                <asp:Label ID="CostLabel" runat="server" Text='<%# Eval("Cost") %>' />
                <br />Description:
                <asp:Label ID="DescriptionLabel" runat="server" 
                    Text='<%# Eval("Description") %>' />
                <br />ImageURL:
                <asp:Label ID="ImageURLLabel" runat="server" Text='<%# Eval("ImageURL") %>' />
                <br />
                </td>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
