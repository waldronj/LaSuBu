<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="LuSuBu.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:EntityDataSource ID="dsCMS" runat="server" 
        ConnectionString="name=LaSuBuContainer" DefaultContainerName="LaSuBuContainer" AutoGenerateWhereClause="true"
        EnableFlattening="False" EnableUpdate="True" EntitySetName="ContentManagements">
        <WhereParameters>
            <asp:Parameter DefaultValue="AboutUs" Type="String" Name="PageName" />
        </WhereParameters>

    </asp:EntityDataSource>

    <asp:ListView ID="lvAbout" runat="server" DataKeyNames="Id" 
        DataSourceID="dsCMS">       
        <EditItemTemplate>
            <span style="">Id:
            <asp:Label ID="IdLabel1" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            PageName:
            <asp:TextBox ID="PageNameTextBox" runat="server" 
                Text='<%# Bind("PageName") %>' />
            <br />
            Content:
            <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>' />
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <ItemTemplate>
            <span style="">Id:
            <asp:Label ID="IdLabel" runat="server" Text='<%# Eval("Id") %>' />
            <br />
            PageName:
            <asp:Label ID="PageNameLabel" runat="server" Text='<%# Eval("PageName") %>' />
            <br />
            Content:
            <asp:Label ID="ContentLabel" runat="server" Text='<%# Eval("Content") %>' />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" />
<br /><br /></span>
        </ItemTemplate>
       
    </asp:ListView>
</asp:Content>
