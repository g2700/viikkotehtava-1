<%@ Page Language="C#" AutoEventWireup="true" CodeFile="g2700_smliiga.aspx.cs" Inherits="g2700_smliiga" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
</body>
</html>
<asp:dropdownlist ID="drpjoukkueet" runat="server"  AutoPostBack="True"  OnSelectedIndexChanged="drpjoukkueet_SelectedIndexChanged"></asp:dropdownlist>
<asp:dropdownlist ID="drppelipaikka"  AutoPostBack="True" runat="server" OnSelectedIndexChanged="drppelipaikka_SelectedIndexChanged"></asp:dropdownlist>
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="height: 26px" Text="Näytä kaikki" />
<asp:GridView ID="gvArticle" runat="server"  AllowSorting="True" OnSorting="gvArticle_Sorting">
<Columns>


</Columns>
</asp:GridView>
    
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:smliigadb %>" ProviderName="<%$ ConnectionStrings:smliigadb.ProviderName %>" SelectCommand="SELECT * FROM [Pelaajat]"></asp:SqlDataSource>
</form>

