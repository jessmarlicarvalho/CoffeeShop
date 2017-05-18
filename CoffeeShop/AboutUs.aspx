<%@ Page Title="" Language="C#" MasterPageFile="/Product.Master" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="CoffeeShop.AboutUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            font-size: x-large;
        }
        .auto-style2 {
            font-weight: normal;
            color: #7C5343;
            width: 54px;
            height: 45px;
        }
        .auto-style3 {
            text-align: justify;
            font-weight: normal;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1 class="auto-style2">About Us</h1>
    <h4 class="auto-style3">CoffeShop.com, are THE local, independent Coffee Experts, but don’t worry we haven’t forgotten about the 
        ‘Ice, Ice Cafeee..’! We currently have two Coffee Houses in Peterborough & Bedford. We are here to offer something different or even BETTER, 
        you will not find the kind of passion for excellence in Coffee at those big brands, you WILL find genuine passion, 
        knowledge and a drive to become even better at CoffeeShop. 
        We love what we do and hope you will too and we will not rest until we are considered 
        THE best, so pop in and find out what all the fuss is about.</h4>
    <br />

    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/Slider.xml" Height="500px" Width="1300px"/>
            <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick1"></asp:Timer>
            <asp:Image ID="Image1" runat="server"/>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
