<%@ Page Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="ViewCart.aspx.cs" Inherits="CoffeeShop.ViewCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            font-size: xx-large;
            color: #744D3D;
        }
        .auto-style7 {
            text-align: left;
        }
        .auto-style8 {
            text-align: center;
        }
        .auto-style9 {
            font-size: x-large;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style2">
        View Shopping Cart
    </p>
    <div class="auto-style7">
            <div class="auto-style7">
                <br />
        <asp:Label ID="l1" runat="server" CssClass="auto-style9"></asp:Label>
            <br />
            </div>
            <div class="auto-style8">
            <asp:DataList ID="d1" runat="server">

              <HeaderTemplate>
                  <table border="1">
                      <tr style="background-color:burlywood; color:white; font-weight:bold">
                          <td>Image</td>
                          <td>Name</td>
                          <td>Strength</td>
                          <td>Grind</td>
                          <td>Origin</td>
                          <td>Description</td>
                          <td>Price</td>
                          <td>Qty</td>
                          <td>Delete</td>
                      </tr>
              </HeaderTemplate>
                 <ItemTemplate>
                     <tr>
                         <td><img src="Images/<%#Eval("ImageURL") %>" height="100" width="100" /></td>
                         <td><%#Eval("Name") %></td>
                         <td><%#Eval("Strength") %></td>
                         <td><%#Eval("Grind") %></td>
                         <td><%#Eval("Origin") %></td>
                         <td><%#Eval("Price") %></td>
                         <td><%#Eval("Desc") %></td>
                         <td><%#Eval("Quantity") %></td>
                         <td>
                             <a href="delete_cart.aspx?id=<%#Eval("ProductID") %>">Remove</a>
                         </td>
                     </tr>
                 </ItemTemplate>
                <FooterTemplate>
                </table>
                </FooterTemplate>
            </asp:DataList>
            
            </div>
            
            <br />
            <asp:Button ID="btnCheckout" runat="server" Height="70px" Text="Checkout" Width="138px" OnClick="btnCheckout_Click" />
        <p>
            &nbsp;</p>
            <br />
            <br />
        </div>
     <br />
    <br />
     </asp:Content>
