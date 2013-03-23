<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageSite.aspx.cs" Inherits="LuSuBu.AddNews" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span5 offset2 content">
            <strong>Page:</strong> <br />  
            <asp:DropDownList ID="ddlPage" runat="server">
                <asp:ListItem Value="AboutUs">About Us</asp:ListItem>
                <asp:ListItem Value="Default">Home Page</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <strong>Headline:</strong><br />
             <asp:TextBox ID="tbHeadline" runat="server" Width="400px"></asp:TextBox>
            <br />
            <br />
            <strong>Content:</strong> <br />
            <asp:TextBox ID="tbContent" runat="server" TextMode="MultiLine" Height="400px" Width="400px" ></asp:TextBox>
            <br />
            <br />
            <asp:LinkButton ID="btnAddContent" runat="server" Text="AddContent" OnClick="btnAddContent_Click" OnPreRender="AdminControl_PreRender"></asp:LinkButton>
        </div>
    </div>
</asp:Content>
