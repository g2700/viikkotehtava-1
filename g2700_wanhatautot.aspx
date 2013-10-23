<%@ Page Language="C#" AutoEventWireup="true" CodeFile="g2700_wanhatautot.aspx.cs" Inherits="g2700_wanhatautot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Wanhat autot</title>
    <link href="auto.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form2" runat="server">
        <div>
<div id="otsikko" align="center">
        <h1>Wanhoja autoja</h1>
    </div>
            <div id="nelio">
                <div id="sisalto">
        <asp:Panel id="pnlDefaultButton" runat="server" DefaultButton="btnHae">
            <asp:Button ID="btnHintaNouseva" runat="server" OnClick="btnHintaNouseva_Click" Text="Halvin ensin" />
            <asp:Button ID="btnHintaLaskeva" runat="server" OnClick="btnHintaLaskeva_Click" Text="Kallein ensin" />
            <asp:DropDownList ID="DropDownMerkit" runat="server" OnSelectedIndexChanged="DropDownMerkit_SelectedIndexChanged" 
             AutoPostBack="True"  >
            </asp:DropDownList>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:Button ID="btnHae" runat="server" Text="Hae" OnClick="btnHae_Click" />
        </asp:Panel>
        <br />
        
        <asp:GridView ID="gvAutot" runat="server" BackColor="#ffffff" ShowHeaderWhenEmpty="true">
        </asp:GridView> <br />
        </div>
    </div>
    </form>
</body>
</html>