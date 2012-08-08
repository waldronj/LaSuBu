<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddNews.aspx.cs" Inherits="LuSuBu.AddNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:EntityDataSource ID="dsAddNews" runat="server" 
        ConnectionString="name=LaSuBuContainer" DefaultContainerName="LaSuBuContainer" 
        EnableFlattening="False" EnableInsert="True" EntitySetName="ContentManagements"></asp:EntityDataSource>
    <asp:ListView ID="lvAddNews" runat="server" DataSourceID="dsAddNews" 
        DataKeyNames="Id" InsertItemPosition="LastItem">
          <InsertItemTemplate>
           
            <br />
            PageName:
            <asp:TextBox ID="PageNameTextBox" runat="server" Width="400px"
                Text='<%# Bind("PageName") %>' />
            <br />
            Content:
            <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>' TextMode="MultiLine" Width="600" Height="400px"/>
            <br />
            <asp:Button ID="InsertButton" runat="server" CommandName="Insert" OnPreRender="AdminControl_PreRender"
                Text="Insert" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" OnPreRender="AdminControl_PreRender"
                Text="Clear" />
            <br />
            <br />
            </span>
        </InsertItemTemplate>
        <ItemTemplate>
            </ItemTemplate>
          <LayoutTemplate>
              <div id="itemPlaceholderContainer" runat="server" style="">
                  <span runat="server" id="itemPlaceholder" />
              </div>
              <div style="">
              </div>
          </LayoutTemplate>

    </asp:ListView>

</asp:Content>
