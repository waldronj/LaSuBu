<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LuSuBu.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:EntityDataSource ID="dsCMS" runat="server" 
        ConnectionString="name=LaSuBuContainer" DefaultContainerName="LaSuBuContainer" 
        EnableDelete="True" EnableFlattening="False" 
        EnableUpdate="True" EntitySetName="ContentManagements"></asp:EntityDataSource>
    <asp:ListView ID="lvMainPage" runat="server" DataKeyNames="Id" 
        DataSourceID="dsCMS" >
       
        <EditItemTemplate>
             
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
             <br />
             <br />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
       
      
       
       <ItemTemplate>
            <h3><asp:Label ID="Label1" runat="server" Text='<%# Eval("PageName") %>' /></h3>
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Content") %>' />
            <br />
            <asp:Button ID="Button1" runat="server" CommandName="Edit" Text="Edit" OnPreRender="AdminControl_PreRender" />
<br /><br /></span>
        </ItemTemplate>
           <LayoutTemplate>
            <div style="" id="itemPlaceholderContainer" runat="server">
                <span runat="server" id="itemPlaceholder" />
            </div>
            <div style="">
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
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
            <asp:Button ID="DeleteButton" runat="server" CommandName="Delete" 
                Text="Delete" />
<br /><br /></span>
        </SelectedItemTemplate>
    </asp:ListView>
</asp:Content>
