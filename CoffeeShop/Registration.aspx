<%@ Page Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="CoffeeShop.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        font-size: x-large;
        color: #744D3D;
    }
        .auto-style3 {
            color: #7D5444;
        }
    .auto-style4 {
        height: 23px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style2">
        Create a New Accout</p>
    <p class="auto-style3">
        Use the form below to create a new accout.</p>
    <table class="auto-style4">
        <tr>
            <td class="auto-style7">Username:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtUsername" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUsername" ErrorMessage="Username is required." ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style7">First Name:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtFirstName" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style8">Last Name:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtLastName" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style8">E-Mail:</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtEmail" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td class="auto-style4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="Email is required." ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" ErrorMessage="You must enter a valid email id." ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style12">Address:</td>
            <td class="auto-style13">
                <asp:TextBox ID="txtAddress" runat="server" Height="72px" TextMode="MultiLine" Width="180px"></asp:TextBox>
            </td>
            <td class="auto-style14">
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style8">Telephone:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtTelephone" runat="server" Width="180px"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style5">Password:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtRPassword" runat="server" TextMode="Password" Width="180px" ></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRPassword" ErrorMessage="Password is required." ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">Confirm:</td>
            <td class="auto-style6">
                <asp:TextBox ID="txtRConfirm" runat="server" TextMode="Password" Width="180px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtRConfirm" ErrorMessage="Confirm Password is required." ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="txtRPassword" ControlToValidate="txtRConfirm" ErrorMessage="Both Password must be same." ForeColor="#CC0000"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="auto-style5">&nbsp;</td>
            <td class="auto-style6">
                <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" style="text-align: left" />
                <input id="btnRest" type="reset" value="Reset" /></td>
            <td>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Registration]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>
