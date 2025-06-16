<%@ Page Title="" Language="C#" MasterPageFile="~/gdien.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="BanLaptop.contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="TextBox1" runat="server" CssClass="from-control" required="reguired"></asp:TextBox>
<asp:Button ID="btnHienthi" runat="server" Text="Hiển thị" CssClass="btn btn-default" OnClick="button1_click" />
    <asp:Label ID="lbht" runat="server" Text="Label"></asp:Label>
    <br/>
    <asp:GridView ID="GridView" runat="server" CssClass="'table">
        <columns>
            <asp:CommandField ShowSelectButton="true" />
            <asp:CommandField ShowDeleteButton="true" />
        </columns>
    </asp:GridView>
    <br />
</asp:Content>
