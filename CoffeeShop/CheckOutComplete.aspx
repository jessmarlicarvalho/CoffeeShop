<%@ Page Title="" Language="C#" MasterPageFile="~/Product.Master" AutoEventWireup="true" CodeBehind="CheckOutComplete.aspx.cs" Inherits="CoffeeShop.CheckOutComplete" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            color: #744D3D;
            font-size: xx-large;
            text-align: center;
        }
        .auto-style3 {
            color: #7C5343;
            font-size: xx-large;
            text-align: center;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style2">
        &nbsp;</p>
    <p class="auto-style2">
        Checkout Completed!</p>
    <p class="auto-style2">
        Thank You for your Order! Your Order number is:
        <asp:Label ID="lblOrderNumber" runat="server"></asp:Label>
    </p>
    <p class="auto-style3">
        How about shopping for some more Coffees in our
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Product.Master">store</asp:HyperLink>
        ?</p>
    <p class="auto-style3">
        &nbsp;</p>
    <p class="auto-style3">
        &nbsp;</p>
</asp:Content>
