<%@ Page Title="" Language="C#" MasterPageFile="Site.Master" AutoEventWireup="true" CodeBehind="UpdateOrderDetails.aspx.cs" Inherits="CoffeeShop.UpdateOrderDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style2 {
        font-size: xx-large;
        color: #825A49;
    }
        .auto-style3 {
            width: 100%;
        }
        .auto-style4 {
            width: 286px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p class="auto-style2">
    Update Order Details</p>
   
    
    <table class="auto-style3">
        <tr>
            <td>
                 <asp:Panel ID="Panel1" runat="server" Width="389px" GroupingText="Customer Details">
    <table>
        <tr>
            <td>First Name: </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtFristName" runat="server" Width="250px"></asp:TextBox>
            </td>
            </tr>
        <tr>
            <td>Last Name: 
                </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtLastName" runat="server" Width="250px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Address: 
                
               
            </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtAddress" runat="server" Height="60px" TextMode="MultiLine" Width="250px"></asp:TextBox></td>
            </tr>
        <tr>
            <td>
                <br />
                Telephone: </td>
            <td class="auto-style4">
                <asp:TextBox ID="txtTelephone" runat="server" Width="250px"></asp:TextBox></td>
            </tr>
        <tr>
            <td colspan="2" align="center">
                <br />
                <asp:Button ID="b1" runat="server" Text="Update and Continue" OnClick="b1_Click" />

                

            </td>
        </tr>
    </table>
     </asp:Panel>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
    

</asp:Content>
