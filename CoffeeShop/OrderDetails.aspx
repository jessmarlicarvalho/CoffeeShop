<%@ Page Title="" Language="C#" MasterPageFile="~/Product.Master" AutoEventWireup="true" CodeBehind="OrderDetails.aspx.cs" Inherits="CoffeeShop.OrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="CoffeeID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="CoffeeID" HeaderText="CoffeeID" ReadOnly="True" SortExpression="CoffeeID" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="CoffeeStrength" HeaderText="CoffeeStrength" SortExpression="CoffeeStrength" />
            <asp:BoundField DataField="CoffeeGrind" HeaderText="CoffeeGrind" SortExpression="CoffeeGrind" />
            <asp:BoundField DataField="Origin" HeaderText="Origin" SortExpression="Origin" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Image" HeaderText="Image" SortExpression="Image" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" />
            <asp:BoundField DataField="IDCat" HeaderText="IDCat" SortExpression="IDCat" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CoffeeDetails]"></asp:SqlDataSource>
</asp:Content>
