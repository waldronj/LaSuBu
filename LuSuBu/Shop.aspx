<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="LuSuBu.Shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:EntityDataSource ID="dsStore" runat="server" 
        ConnectionString="name=LaSuBuContainer" DefaultContainerName="LaSuBuContainer" 
        EnableFlattening="False" EnableUpdate="True" 
        EntitySetName="StoreItems"></asp:EntityDataSource>
    <asp:ListView ID="lvShop" runat="server" DataKeyNames="Id" 
        DataSourceID="dsStore" GroupItemCount="5" 
        OnSelectedIndexChanging="lvShop_SelectedIndexChanging">
        <AlternatingItemTemplate>
            <td id="Td1" runat="server" style="">
                <asp:ImageButton ID="ImageURLLabel" runat="server" ImageUrl='<%# Eval("ImageURL") %>'   CommandName="Select" Width="100px" Height="100px" />
                <br />
                <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                <br />
                <asp:Label ID="CostLabel" runat="server" Text='<%# Eval("Cost", "{0:C}") %>'  />
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
                <asp:ImageButton ID="ImageURLLabel" runat="server" ImageUrl='<%# Eval("ImageURL") %>'  CommandName="Select" Width="100px" Height="100px"/>
                <br />
                <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                <br />
                <asp:Label ID="CostLabel" runat="server" Text='<%# Eval("Cost", "{0:C}") %>'  />                
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

    <asp:LinkButton ID="btnBackToShop" runat="server" Text="Back To Shop" OnClick="btnBackToShop_Click" />
    <br />
    <br />
    <asp:ListView ID="lvSelectedItem" runat="server">
        <ItemTemplate>
            <asp:Image ID="ImageURLLabel" runat="server" ImageUrl='<%# Eval("ImageURL") %>' />
                <br />
                <asp:Label ID="ItemNameLabel" runat="server" Text='<%# Eval("ItemName") %>' />
                <br />
                <asp:Label ID="CostLabel" runat="server" Text='<%# Eval("Cost", "{0:C}") %>'  />                
                <br />
                
            <br />
            Size:   <asp:DropDownList ID="ddlSize" runat="server">
                        <asp:ListItem>[- Select a Size -]</asp:ListItem>
                        <asp:ListItem>S</asp:ListItem>
                        <asp:ListItem>M</asp:ListItem>
                        <asp:ListItem>L</asp:ListItem>
                        <asp:ListItem>XL</asp:ListItem>
                        <asp:ListItem>XXL</asp:ListItem>
                    </asp:DropDownList>
            <br />
            Quantity: <asp:DropDownList ID="ddlQty" runat="server">
                        <asp:ListItem>[- Select a Quantity -]</asp:ListItem>
                        <asp:ListItem Value="1">1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                        <asp:ListItem>13</asp:ListItem>
                        <asp:ListItem>14</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>16</asp:ListItem>
                        <asp:ListItem>17</asp:ListItem>
                        <asp:ListItem>18</asp:ListItem>
                        <asp:ListItem>19</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                      </asp:DropDownList>
            <br />
            <asp:LinkButton ID="btnAddToCart" Text="Add To Cart" runat="server" OnClick="btnAddToCart_Click"></asp:LinkButton>
        </ItemTemplate>
    </asp:ListView>
</asp:Content>
