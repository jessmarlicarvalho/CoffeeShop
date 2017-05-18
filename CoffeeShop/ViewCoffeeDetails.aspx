<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewCoffeeDetails.aspx.cs" Inherits="CoffeeShop.ViewCoffeeDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     
    <br />

    <asp:Label ID="lblTitle" runat="server" style="color: #744D3D; font-size: xx-large" Text="View Coffee Details"></asp:Label>
<br />
    <br />

    <asp:Panel ID="Panel1" runat="server" Height="566px" BorderColor="#6C4636" BorderStyle="Solid">
    <asp:Repeater ID="d1" runat="server">
        <HeaderTemplate>
        </HeaderTemplate>
        <ItemTemplate>
                 <asp:Label ID="lblCName" runat="server" style="color: #744D3D; font-size: x-large" Text='<%#Eval("Name") %>'></asp:Label>
             <br> </br>
                    <img src="Images/<%#Eval("ImageURL") %>" height="191" width="288" /> <br> </br>
                                 Strength: <%#Eval("Strength") %><br> </br>
                                 Grind: <%#Eval("Grind") %> 
                    <br> </br>
                                 Origin: <%#Eval("Origin") %><br> </br>
                                 Price: £<%#Eval("Price") %><br> </br>
                                 Stock Level: <%#Eval("Quantity") %> 
                     <br></br>          
                                 Description: <%#Eval("Desc") %> 
                    <br> 
                    </br> 
                    <br> </br>
   <br />
    <br />
    <br /> <br />
       
        </ItemTemplate>
        <FooterTemplate>
        </FooterTemplate>
    </asp:Repeater>
        <br>
     </br>
       
    </asp:Panel>
    <br/>
     <table>
            <tr>
                <td><asp:Label ID="lblTitleCart" runat="server" Text="Enter Quantity:"></asp:Label> </td>
                <td>
                    <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox></td>
                <td><asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="btnAddToCart_Click"/></td>
            </tr>
            <tr>
                <td colspan="3">
                    <asp:Label ID="L1" runat="server" ForeColor="Red" Text=""></asp:Label></td>
            </tr>
        </table>
    <br />
    </asp:Content>
