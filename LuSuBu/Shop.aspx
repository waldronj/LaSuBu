<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Shop.aspx.cs" Inherits="LuSuBu.Shop" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:MultiView ID="mvShop" runat="server" ActiveViewIndex="0">
        <asp:View ID="vwShop" runat="server">

        
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

        </asp:View>
        <asp:View ID="vwProduct" runat="server">

      

    <p><asp:LinkButton ID="btnBackToShop" runat="server" Text="Back To Shop" OnClick="btnBackToShop_Click" /></p>
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
                        <asp:ListItem Value="-1">[- Select a Size -]</asp:ListItem>
                        <asp:ListItem>S</asp:ListItem>
                        <asp:ListItem>M</asp:ListItem>
                        <asp:ListItem>L</asp:ListItem>
                        <asp:ListItem>XL</asp:ListItem>
                        <asp:ListItem>XXL</asp:ListItem>
                    </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvSize" ControlToValidate="ddlSize" runat="server" Text="Size Required" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
            <br />
            Quantity: <asp:DropDownList ID="ddlQty" runat="server">
                       <asp:listitem Value="-1">[- select a quantity -]</asp:listitem>
                        <asp:listitem>1</asp:listitem>
                        <asp:listitem>2</asp:listitem>
                        <asp:listitem>3</asp:listitem>
                        <asp:listitem>4</asp:listitem>
                        <asp:listitem>5</asp:listitem>
                        <asp:listitem>6</asp:listitem>
                        <asp:listitem>7</asp:listitem>
                        <asp:listitem>8</asp:listitem>
                        <asp:listitem>9</asp:listitem>
                        <asp:listitem>10</asp:listitem>
                        <asp:listitem>11</asp:listitem>
                        <asp:listitem>12</asp:listitem>
                        <asp:listitem>13</asp:listitem>
                        <asp:listitem>14</asp:listitem>
                        <asp:listitem>15</asp:listitem>
                        <asp:listitem>16</asp:listitem>
                        <asp:listitem>17</asp:listitem>
                        <asp:listitem>18</asp:listitem>
                        <asp:listitem>19</asp:listitem>
                        <asp:listitem>20</asp:listitem>
                      </asp:DropDownList>
            <asp:RequiredFieldValidator ID="rfvQty" ControlToValidate="ddlQty" runat="server" Text="Quantity Required" ForeColor="Red" InitialValue="-1"></asp:RequiredFieldValidator>
            <br />
            <p><asp:LinkButton ID="btnAddToCart" Text="Add To Cart" runat="server" OnClick="btnAddToCart_Click"></asp:LinkButton></p>
        </ItemTemplate>
    </asp:ListView>
              </asp:View>
        <asp:View ID="vwConfirm" runat="server">
            
                
            <asp:Label ID="lblConfirm" runat="server"></asp:Label>
            
                        <p><a id="A1" href="Shop.aspx" runat="server">Continue Shopping</a>
                        <a href="ViewCart.aspx" runat="server" style="padding: 0 0 0 5em;">Checkout</a>
            
            
            
        </asp:View>
    </asp:MultiView>
</asp:Content>
