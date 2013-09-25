<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="g2700_Default2.aspx.cs" Inherits="g2700_Default2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    nimesi, kiitos 
    <asp:TextBox ID="user" runat="server" Text="" ></asp:TextBox>
        <asp:Button ID="btnParam" runat="server" Text="Välitä parametrinä" OnClick="btnParam_Click" />
        <asp:Button ID="btnSessio" runat="server" Text="Tallenna sessioniin" OnClick="btnSessio_Click" />
        <asp:Button ID="btnKeksi" runat="server" Text="Tallenna cookieihin" OnClick="btnKeksi_Click" />


</asp:Content>

