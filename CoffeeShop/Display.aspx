<%@ Page Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="Display.aspx.cs" Inherits="CoffeeShop.Display" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <style type="text/css">
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            font-size: xx-large;
            color: #7D5444;
        }
        .auto-style3 {
            font-size: x-large;
        }
        .auto-style4 {
            width: 100%;
        }
        .auto-style9 {
            width: 778px;
            height: 67px;
        }
        .auto-style10 {
            width: 778px;
            color: #000000;
            font-size: large;
        }
        .auto-style11 {
            font-size: large;
            color: #7D5444;
        }
        .auto-style12 {
            background-color: #7D5444;
        }
        .auto-style13 {
            font-size: large;
            color: #FFFFFF;
        }
        .auto-style14 {
            color: #7D5444;
        }
        .auto-style15 {
            font-size: large;
        }
         .auto-style16 {
             text-align: center;
         }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         <span class="auto-style2">
         <table class="auto-style4">
             <tr>
                 <td class="auto-style9">
         <span class="auto-style2">Products</span>
                 </td>
             </tr>
             </span>

    <span class="auto-style1">
             <tr>
                 <td class="auto-style10">Broswe our expensive range of coffees from all over the world.</td>
                 
             </tr>
        </span>
         </table>
         <asp:Label ID="Label3" runat="server" CssClass="auto-style15" Text="Search by Coffee Grind: "></asp:Label>
&nbsp;<asp:DropDownList ID="ddlGrind" AutoPostBack="true" runat="server" Height="17px" Width="182px">
    <asp:ListItem Text="All" Value="" />
    <asp:ListItem Text="Beans Grind" Value="Beans Grind" />
    <asp:ListItem Text="Filter Grind" Value="Filter Grind" />
    <asp:ListItem Text="Espresso Grind" Value="Espresso Grind" />
    <asp:ListItem Text="Turkey Grind" Value="Turkey Grind" />
</asp:DropDownList>&nbsp;&nbsp;
         <br />
  
         <div class="auto-style16">
&nbsp;<asp:DataList ID="d2" runat="server" RepeatColumns="3"
            RepeatDirection="Horizontal" CellSpacing="10" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" GridLines="Horizontal" HorizontalAlign="Center">
            <AlternatingItemStyle Font-Bold="False" HorizontalAlign="Center" />
            <ItemTemplate>
                <table class="auto-style4">
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style12">
                            <asp:Label ID="NameLabel" runat="server" Text='<%# Eval("Name") %>' CssClass="auto-style13" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            
                            <a href="ViewCoffeeDetails.aspx?id=<%#Eval("ProductID")%>"><img src="Images/<%#Eval("ImageURL") %>" alt="" height="100" width="150" /></a>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style14"><span class="auto-style11">Grind:&nbsp; </span>
                            <asp:Label ID="GrindLabel" runat="server" Text='<%# Eval("Grind") %>' CssClass="auto-style11" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style14"><span class="auto-style11">Price: £</span><asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("Price") %>' CssClass="auto-style11" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style14"><span class="auto-style11">Strength:&nbsp; </span>
                            <asp:Label ID="StrengthLabel" runat="server" Text='<%# Eval("Strength") %>' CssClass="auto-style11" />
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style14"><span class="auto-style11">Origin:&nbsp; </span>
                            <asp:Label ID="OriginLabel" runat="server" Text='<%# Eval("Origin") %>' CssClass="auto-style11" />
                        </td>
                    </tr>
                    
                </table>
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>

             <span class="auto-style2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <asp:LinkButton ID="lnkbtnNext" runat="server" CssClass="auto-style3" OnClick="lnkbtnNext_Click">Previous</asp:LinkButton>
                             
                &nbsp; |&nbsp;
                
      <asp:LinkButton ID="lnkbtnPrevious" runat="server" CssClass="auto-style3" OnClick="lnkbtnPrevious_Click">Next</asp:LinkButton>
                             
             </span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />
             <br />
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [CoffeeID], [Name], [Description], [Price], [ImageUrl], [Grind], [CoffeeStrength], [Origin] FROM [Products] WHERE ([CoffeeGrind] = @CoffeeGrind)"></asp:SqlDataSource>

<script type="text/javascript">
    function search() {
        window.location = "Display.aspx?search=" + document.getElementById("searchtextbox").value;
    }
</script>

</asp:Content>
