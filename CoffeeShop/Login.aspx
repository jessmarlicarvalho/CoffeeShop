<%@ Page Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CoffeeShop.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            color: #704A3A;
        }
        .auto-style3 {
            color: #704A3A;
            font-size: xx-large;
        }
        .auto-style4 {
            color: #000000;
        }
        .auto-style5 {
            color: #000000;
            font-size: medium;
        }
        .auto-style6 {
            color: #000000;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style3">
    Login</p>
<p class="auto-style6">
    Please enter your username and password. Register, if you don&#39;t have an accout.</p>
    <p class="auto-style2">
        &nbsp;</p>
<table class="auto-style4">
    <tr>
        <td class="auto-style5">Username:</td>
        <td class="auto-style9">
            <asp:TextBox ID="txtUsername" runat="server" Width="180px"></asp:TextBox>
        </td>
        <td class="auto-style7">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Enter your username." ForeColor="#CC0000"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">Password:</td>
        <td class="auto-style10">
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
        </td>
        <td class="auto-style8">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="Enter you password." ForeColor="#CC0000"></asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="auto-style6">&nbsp;</td>
        <td class="auto-style10">
            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Registration.aspx">Create new accout</asp:HyperLink>
&nbsp; <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/ForgotPassword.aspx">Forgot Password?</asp:HyperLink>
        </td>
        <td class="auto-style8">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style6">&nbsp;</td>
        <td class="auto-style10">
            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" style="height: 26px" />
        </td>
        <td class="auto-style8">&nbsp;</td>
    </tr>
    <tr>
        <td class="auto-style6">&nbsp;</td>
        <td class="auto-style10">
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </td>
        <td class="auto-style8">&nbsp;</td>
    </tr>
</table>
</asp:Content>
