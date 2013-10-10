<%@ Page Title="Lisätietoja eläke expertistä" Language="C#" AutoEventWireup="true" CodeFile="g2700_elakelisatieto.aspx.cs" Inherits="g2700_elakelisatieto" %>

<!DOCTYPE html>

<script runat="server">
    string backgroundColor =
         ConfigurationManager.AppSettings["backgroundColor"];
</script>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body style="background-color:<%=backgroundColor%>">
    <form id="form1" runat="server">
    <div align="center">
    <h1>Ota yhteyttä eläkkeen kartuttamisen eksperttiin!</h1><br />
        Antti Aamunen <br />
        Jyväskylä <br />
        antti.aamunen@elake.fi

    </div>
    </form>
</body>
</html>
