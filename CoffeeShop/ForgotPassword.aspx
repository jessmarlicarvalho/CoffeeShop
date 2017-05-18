<%@ Page Title="" Language="C#" MasterPageFile="~/ForgotPassword.Master" AutoEventWireup="true" CodeBehind="ForgotPassword.aspx.cs" Inherits="CoffeeShop.ForgotPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            font-size: xx-large;
            color: #795041;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <fieldset>
            <legend class="auto-style2">Forgot Password</legend>
            <asp:Label ID="lblEmail" runat="server" style="font-size: large" Text="Email Address: " />
            <asp:TextBox ID="txtEmail" runat="server" Width="158px" />
            <asp:RequiredFieldValidator ID="RV1" runat="server" ControlToValidate="txtEmail" ErrorMessage="Please Enter EmailID" ForeColor="#CC0000" SetFocusOnError="True">*
    </asp:RequiredFieldValidator>
            <asp:Button ID="btnPass" runat="server" onclick="btnPass_Click" Text="Submit" />
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" CssClass="error" ForeColor="#CC0000" />
            <br />
            <asp:Label ID="lblMessage" runat="server" Text="" />
        </fieldset>
    </div>
</asp:Content>
