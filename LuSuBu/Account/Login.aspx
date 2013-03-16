<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="LuSuBu.Account.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row-fluid">
        <div class="span6 offset3">
    <asp:Login ID="Login1" runat="server" PasswordRecoveryUrl="~/Account/PasswordRecovery.aspx" PasswordRecoveryText="Recover Password" CreateUserText="Register" CreateUserUrl="~/Account/Register.aspx" ></asp:Login>
            
        
        </div>
         </div>
    <script type="text/javascript">
        $("#MainContent_Login1_LoginButton").addClass("btn btn-primary");
    </script>
</asp:Content>
