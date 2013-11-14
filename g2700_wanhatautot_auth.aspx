<%@ Page Language="C#" AutoEventWireup="true" CodeFile="g2700_wanhatautot_auth.aspx.cs" Inherits="g2700_wanhatautot_auth" %>

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
                    <!–CODE START –>
           <table>
    <tr><td>Käyttäjä: <asp:TextBox ID="txtKayttaja" runat="server" Width="120px" ></asp:TextBox> </td>
        <td> <asp:RequiredFieldValidator ID="rfvUser" ErrorMessage="Anna käyttäjä" ControlToValidate="txtKayttaja" runat="server" /></td>
        
        <td>Salasana: <asp:TextBox ID="txtSala" TextMode="Password" runat="server" Width="120px" ></asp:TextBox></td>
        <td> <asp:RequiredFieldValidator ID="rfvSala" ErrorMessage="Anna salasana" ControlToValidate="txtSala" runat="server" /></td>

        <td><asp:Button ID="btnKirjaudu" runat="server" Width="100px" Text="Kirjaudu" onClick="btnKirjaudu_Click" CausesValidation="false"/></td>
    </tr>
    <tr>
        <td><asp:Label ID="lblKirjautuminen" runat="server"></asp:Label></td>
    </tr>

    </table>

                    <h2>VE2</h2>
                    <table>
    <tr><td>Käyttäjä: <asp:TextBox ID="txtHashkayttaja" runat="server" Width="120px" ></asp:TextBox> </td>
        <td> <asp:RequiredFieldValidator ID="rfvHashUser" ErrorMessage="Anna käyttäjä" ControlToValidate="txtHashkayttaja" runat="server" /></td>

        <td>Salasana: <asp:TextBox ID="txtHashsala" TextMode="Password" runat="server" Width="120px" ></asp:TextBox></td>
         <td> <asp:RequiredFieldValidator ID="rfvHashSala" ErrorMessage="Anna salasana" ControlToValidate="txtHashsala" runat="server" /></td>
        </tr>
        <tr>
        <td><asp:Button ID="btnHashkirjaudu" runat="server" Width="100px" Text="Kirjaudu" CausesValidation="false" onClick="btnHashkirjaudu_Click" /></td>
    </tr>
    <tr>
        <td><asp:Label ID="lblHashkirjautuminen" runat="server"></asp:Label></td>
    </tr>

    </table>


        <asp:GridView ID="gvCrud" runat="server" DataKeyNames="aid" CssClass="GridView" ShowFooter="true" AutoGenerateColumns="false" >
            <EmptyDataTemplate>
                Data Not Found!
            </EmptyDataTemplate>
            <Columns>
      

                <asp:TemplateField HeaderText="Merkki">
                    <ItemTemplate>
                        <%# Eval("merkki") %>
                    </ItemTemplate>
   
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Malli">
                    <ItemTemplate>
                        <%# Eval("malli") %>
                    </ItemTemplate>

                </asp:TemplateField>

                <asp:TemplateField HeaderText="vm">
                    <ItemTemplate>
                        <%# Eval("vm") %>
                    </ItemTemplate>
     
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Ostohinta">
                    <ItemTemplate>
                        <%# Eval("sisaanOstoHinta") %>
                    </ItemTemplate>
                   
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Myyntihinta">
                    <ItemTemplate>
                        <%# Eval("myyntiHinta") %>
                    </ItemTemplate>
       
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Rekkari">
                    <ItemTemplate>
                        <%# Eval("rekkari") %>
                    </ItemTemplate>

                </asp:TemplateField>
            </Columns>
            <HeaderStyle CssClass="Header-Class" />
            <RowStyle CssClass="Row-Class" />
            <AlternatingRowStyle CssClass="Alternet-Row-Class" />
            <FooterStyle CssClass="Footer-Class" />
        </asp:GridView>
                    <!–CODE END –>

                </div>
            </div>
        </div>
    </form>


</body>
</html>
