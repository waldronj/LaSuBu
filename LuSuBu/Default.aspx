<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LuSuBu.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span6 offset3">

    <asp:EntityDataSource ID="dsCMS" runat="server" 
        ConnectionString="name=LaSuBuContainer" DefaultContainerName="LaSuBuContainer" 
        EnableDelete="True" EnableFlattening="False" AutoGenerateWhereClause="true"
        EnableUpdate="True" EntitySetName="ContentManagements">
        <WhereParameters>
            <asp:Parameter DefaultValue="Default" Type="String" Name="PageName" />
        </WhereParameters>
    </asp:EntityDataSource>

    <asp:ListView ID="lvMainPage" runat="server" DataKeyNames="Id" DataSourceID="dsCMS" >
       
        <EditItemTemplate>
             
             Headline:
             <asp:TextBox ID="PageNameTextBox" runat="server" 
                 Text='<%# Bind("Headline") %>' />
             <br />
             Content: 
            <br />
             <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>' TextMode="MultiLine" Width="400px" Height="400px" />
             <br />
             <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                 Text="Update" CssClass="btn btn-primary"/>
             <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                 Text="Cancel" CssClass="btn btn-danger"/>
             <br />
             <br />
        </EditItemTemplate>
        <EmptyDataTemplate>
            <span>No data was returned.</span>
        </EmptyDataTemplate>
       
      
       
       <ItemTemplate>
            <h3><asp:Label ID="Label1" runat="server" Text='<%# Eval("Headline") %>' /></h3>
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("Content") %>' />
            <br />
            <asp:Button ID="Button1" runat="server" CommandName="Edit" Text="Edit" OnPreRender="AdminControl_PreRender" CssClass="btn btn-primary" />
<br /><br /></span>
        </ItemTemplate>
           <%--<LayoutTemplate>
            <div style="" id="itemPlaceholderContainer" runat="server">
                <span runat="server" id="itemPlaceholder" />
            </div>
            
        </LayoutTemplate>--%>
        <SelectedItemTemplate>
        
        </SelectedItemTemplate>
    </asp:ListView>
            </div>
        </div>
</asp:Content>
