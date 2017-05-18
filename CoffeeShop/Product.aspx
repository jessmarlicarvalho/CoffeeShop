<%@ Page Title="" Language="C#" MasterPageFile="~/Product.Master" AutoEventWireup="true" CodeBehind="Product.aspx.cs" Inherits="CoffeeShop.Product1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style1 {
        color: #805746;
    }
    .auto-style2 {
        color: #805746;
        font-size: xx-large;
            text-align: center;
        }
        .auto-style3 {
            color: #805746;
            font-size: xx-large;
            text-align: left;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style3">
    Products</p>
    <p class="auto-style3">
        <asp:Label ID="Label1" runat="server" style="font-size: x-large; color: #000000; text-align: left;" Text="Search for Grind:"></asp:Label>
&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource2" DataTextField="CoffeeGrind" DataValueField="CoffeeGrind" Height="16px" Width="151px">
    </asp:DropDownList>
&nbsp;<asp:Button ID="Button1" runat="server" Text="Search" Width="64px" />
&nbsp;&nbsp;<asp:Button ID="AddToCart" runat="server" OnClick="AddToCart_Click" Text="Select Products" />
    &nbsp;</p>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="LightGoldenrodYellow" BorderColor="Tan" BorderWidth="1px" CellPadding="2" DataKeyNames="CoffeeID" DataSourceID="SqlDataSource1" EmptyDataText="No Record Found. Select Another Record. " ForeColor="Black" style="color: #000000; font-size: medium; text-align: center;">
        <AlternatingRowStyle BackColor="PaleGoldenrod" />
        <Columns>

              <asp:TemplateField HeaderText="Add To Basket">
                  <ItemTemplate>
            <asp:CheckBox ID="SelectedProducts" runat="server" />
          </ItemTemplate>
              </asp:TemplateField>

              <asp:HyperLinkField DataNavigateUrlFields=
                "Image,Name,CoffeeStrength,CoffeeGrind,Origin,Price,Description" 
DataNavigateUrlFormatString=
"ViewCoffeeDetails.aspx?Image={0}&Name={1}&CoffeeStrength={2}&CoffeeGrind={3}&Origin={4}&Price={5}&Descrition={6}"
                Text="View Details" />


            <asp:TemplateField>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Image ID="Image1" runat="server" Height="100px" ImageUrl='<%# Eval("Image") %>' Width="150px" />
                </ItemTemplate>

            </asp:TemplateField>
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="CoffeeStrength" HeaderText="Strength" SortExpression="CoffeeStrength" />
            <asp:BoundField DataField="CoffeeGrind" HeaderText="Grind" SortExpression="CoffeeGrind" />
            <asp:BoundField DataField="Origin" HeaderText="Origin" SortExpression="Origin" />
            <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:c}" />
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />

        </Columns>
        <FooterStyle BackColor="Tan" />
        <HeaderStyle BackColor="Tan" Font-Bold="True" />
        <PagerSettings PageButtonCount="6" Position="TopAndBottom" />
        <PagerStyle BackColor="PaleGoldenrod" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite" />
        <SortedAscendingCellStyle BackColor="#FAFAE7" />
        <SortedAscendingHeaderStyle BackColor="#DAC09E" />
        <SortedDescendingCellStyle BackColor="#E1DB9C" />
        <SortedDescendingHeaderStyle BackColor="#C2A47B" />
    </asp:GridView>

    <p class="auto-style2">
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CoffeeDetails]"></asp:SqlDataSource>
    </p>
<p class="auto-style2">
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT DISTINCT [CoffeeGrind] FROM [CoffeeDetails]"></asp:SqlDataSource>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CoffeeDetails] WHERE ([CoffeeGrind] = @CoffeeGrind)">
        <SelectParameters>
            <asp:ControlParameter ControlID="DropDownList1" Name="CoffeeGrind" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</p>
    <p class="auto-style3">
        <asp:SqlDataSource ID="SqlDataSourceDataList" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [CoffeeDetails]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server"></asp:SqlDataSource>
</p>
    <p class="auto-style2">
        &nbsp;</p>
    <p class="auto-style2">
        &nbsp;</p>
    <p class="auto-style2">
        &nbsp;</p>
</asp:Content>
