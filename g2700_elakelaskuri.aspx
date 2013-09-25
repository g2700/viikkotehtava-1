<%@ Page Title="Eläkelaskuri" Language="C#" AutoEventWireup="true" CodeFile="g2700_elakelaskuri.aspx.cs" Inherits="g2700_elakelaskuri" %>

<!DOCTYPE html>

<script runat="server">
    string backgroundColor =
         ConfigurationManager.AppSettings["backgroundColor"];
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="elake.css" rel="stylesheet" type="text/css" />

</head>
<body style="background-color:<%=backgroundColor%>">
    <form id="form1" runat="server">
    <div>
        <div id="otsikko" align="center">
         <h1>Tänään on paras päivä aloittaa eläkesäästäminen!</h1>
            </div>
        <br />
        <div id="nelio">
            <h2 align="center">Tiedätkö kuinka paljon saat aikanaan eläkettä? Laske tästä!</h2>
            <hr />
            <div id="leftcolumn">
                <h5>Ikä</h5> <br />
                <asp:Button ID="btnMiinusIka" runat="server" Text="-" OnClick="btnMiinusIka_Click" /><asp:TextBox ID="txtIka" runat="server" Text="35" OnTextChanged="txtIka_TextChanged"></asp:TextBox>
                <asp:Button ID="btnPlusIka" runat="server" Text="+" OnClick="btnPlusIka_Click" /> vuotta
                <br />
                <br />
                <h5>Palkka</h5> <br />
                <asp:Button ID="btnMiinusPalkka" runat="server" Text="-" OnClick="btnMiinusPalkka_Click" /><asp:TextBox ID="txtPalkka" runat="server" Text="3000"></asp:TextBox>
                <asp:Button ID="btnPlusPalkka" runat="server" Text="+" OnClick="btnPlusPalkka_Click" /> euroa
                <br />
            </div>
            <div>
                <br />
                Lakisääteinen eläke <asp:Label ID="lblLaki" runat="server" Text=""></asp:Label> €
                <br /><br />
                Elinaikakertoimen vaikutus <asp:Label ID="lblKerroin" runat="server"></asp:Label> €
                <br />
                <br />
                Arvio lakisääteisestä eläkkeestä
                <br />
                <asp:Label ID="lblElake" runat="server" Text="" Font-Size="XX-Large"></asp:Label> 
            </div>
        </div>
        <br />
        <br />
        <div id="footer" align="center">
        <h3>2. Riittääkö se sinulle? Paranna toimeentuloasi säästämällä</h3>
        <asp:Button ID="btnLisatiedot" runat="server" Text="Lue lisää" OnClick="btnLisatiedot_Click" CssClass="puttonen" />
        </div>
    </div>
    </form>
</body>
</html>
