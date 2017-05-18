<%@ Page  Language="C#" MasterPageFile="~/Product.Master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="CoffeeShop.ProductDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource2" RepeatColumns="1" RepeatDirection="Horizontal">
        <ItemTemplate>
            <table class="auto-style2">
                <tr>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="104px" ImageUrl='<%# Eval("Image", "~/Images\\{0}") %>' Width="148px" />
                        <br />
                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("Image") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("CoffeeStrength") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label3" runat="server" Text='<%# Eval("CoffeeGrind") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label4" runat="server" Text='<%# Eval("Origin") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Price", "{0:##0.00}" ) %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("Description") %>'></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:Button ID="btnAdd" runat="server" OnClick="Button1_Click" Text="Add to Cart" />
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Products.aspx">Return to Products Page</asp:HyperLink>

    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT [CoffeeID], [Name], [CoffeeStrength], [CoffeeGrind], [Origin], [Description], [Price], [Image] FROM [CoffeeDetails] WHERE ([CoffeeID] = @CoffeeID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="CoffeeID" QueryStringField="CoffeeID" Type="Decimal" />
            </SelectParameters>
        </asp:SqlDataSource>

    </asp:Content>
