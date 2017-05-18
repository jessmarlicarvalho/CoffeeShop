<%@ Page Title="" Language="C#" MasterPageFile="~/Product.Master" AutoEventWireup="true" CodeBehind="OrderSummary.aspx.cs" Inherits="CoffeeShop.OrderSummary" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            font-size: large;
            color: #805746;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style2">
        Your Order Summary</p>
    <p>
        <asp:Label ID="Label1" runat="server" Text="Order Total:"></asp:Label>
&nbsp;<asp:Label ID="lblOrderPrice" runat="server" style="color: #825A49; font-size: large"></asp:Label>
    </p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="None" Height="155px" Width="689px">
            <AlternatingRowStyle BackColor="PaleGoldenrod" />
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" />
                <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                <asp:BoundField DataField="Grind" HeaderText="Grind" SortExpression="Grind" />
                <asp:BoundField DataField="Images " HeaderText="Images " SortExpression="Images " />
                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                <asp:TemplateField HeaderText="Qty"></asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="Tan" />
            <HeaderStyle BackColor="Tan" Font-Bold="True" />
            <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
            <SortedAscendingCellStyle BackColor="#FAFAE7" />
            <SortedAscendingHeaderStyle BackColor="#DAC09E" />
            <SortedDescendingCellStyle BackColor="#E1DB9C" />
            <SortedDescendingHeaderStyle BackColor="#C2A47B" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Stock]"></asp:SqlDataSource>
    </p>
    <p>
        &nbsp;</p>
    
    </div>
    </form>
</body>






</asp:Content>
