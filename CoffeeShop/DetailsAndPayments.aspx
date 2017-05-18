<%@ Page Title="" Language="C#" MasterPageFile="~/Product.Master" AutoEventWireup="true" CodeBehind="DetailsAndPayments.aspx.cs" Inherits="CoffeeShop.DetailsAndPayments" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            color: #795041;
            font-size: xx-large;
        }
        .auto-style3 {
            width: 42%;
        }
        .auto-style6 {
            text-align: left;
        }
        .auto-style7 {
            width: 146px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style2">
        Customer Details and Payments</p>
    <asp:Panel ID="Panel1" runat="server" GroupingText="Shipping Details">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table class="auto-style3">
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label1" runat="server" Text="Customer Name: "></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label2" runat="server" Text="Address 1: "></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label3" runat="server" Text="Address 2:"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label4" runat="server" Text="Postcode: "></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label5" runat="server" Text="Country: "></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style7">
                    <asp:Label ID="Label6" runat="server" Text="Telephone:"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
    </asp:Panel>
    <br />
    <asp:Panel ID="Panel2" runat="server" Font-Size="Medium" GroupingText="Payment">
        We&#39;re running a promotion: &quot;FREE &quot;samples of coffees with the promo!<br />
        <br />
        <asp:Label ID="Label7" runat="server" Text="Promo Code:"></asp:Label>
        <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        <br />
        <br />
    </asp:Panel>
    <p>
        &nbsp;<asp:Button ID="Button1" runat="server" Height="45px" Text="Submit Order" Width="130px" />
    </p>
    <p>
    </p>
    <p>
    </p>
    <p>
    </p>
</asp:Content>
