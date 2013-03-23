<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="LuSuBu.About" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row-fluid">
        <div class="span6 offset3 content">
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
            Headline:
            <asp:TextBox ID="PageNameTextBox" runat="server" 
                Text='<%# Bind("Headline") %>' />
            <br />
            Content:
            <br />
            <asp:TextBox ID="ContentTextBox" runat="server" Text='<%# Bind("Content") %>' TextMode="MultiLine" Height="400px" Width="400px"/>
            <br />
            <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                Text="Update" />
            <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                Text="Cancel" />
            <br /><br /></span>
        </EditItemTemplate>
        <ItemTemplate>
           
            <h3><asp:Literal ID="PageNameLabel" runat="server" Text='<%# Eval("Headline") %>' /></h3>
            <br />            
            <asp:Label ID="ContentLabel" runat="server" Text='<%# Eval("Content") %>' />
            <br />
            <asp:Button ID="EditButton" runat="server" CommandName="Edit" Text="Edit" OnPreRender="AdminControl_PreRender"/>
<br /><br /></span>
        </ItemTemplate>
       
    </asp:ListView>
            </div>
        </div>
</asp:Content>
