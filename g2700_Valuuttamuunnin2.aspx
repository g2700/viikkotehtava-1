<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="g2700_Valuuttamuunnin2.aspx.cs" Inherits="g2700_Valuuttamuunnin2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br />
    <h1>TERVETULOA:</h1>
    <p>
        <asp:Label ID="lblNimi" runat="server" Text="" ></asp:Label>
    </p>



    <p>
        <asp:TextBox ID="txtbMarkat" runat="server"></asp:TextBox>
        <asp:Button ID="btnMuunna" runat="server" Text="Markat euroiksi" OnClick="btnMuunna_Click" />
    </p> <br />
    <p>
        <asp:Label ID="lblEurot" runat="server" Text=""></asp:Label>
    </p>
    


</asp:Content>

