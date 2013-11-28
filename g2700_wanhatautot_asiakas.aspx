<%@ Page Language="C#" AutoEventWireup="true" CodeFile="g2700_wanhatautot_asiakas.aspx.cs" Inherits="g2700_wanhatautot_asiakas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClick="Button1_Click" />
    </div>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=autodbEntities" DefaultContainerName="autodbEntities" EnableFlattening="False" EntitySetName="wanhatautot" EntityTypeFilter="autott" Select="it.[rekkari], it.[merkki], it.[malli], it.[vm], it.[myyntihinta]">
        </asp:EntityDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="EntityDataSource1" AutoGenerateColumns="False" AllowSorting="True">
            <Columns>
                <asp:BoundField DataField="rekkari" HeaderText="rekkari" ReadOnly="True" SortExpression="rekkari" />
                <asp:BoundField DataField="merkki" HeaderText="merkki" SortExpression="merkki" ReadOnly="True" />
                <asp:BoundField DataField="malli" HeaderText="malli" SortExpression="malli" ReadOnly="True" />
                <asp:BoundField DataField="vm" HeaderText="vm" SortExpression="vm" ReadOnly="True" />
                <asp:BoundField DataField="myyntihinta" HeaderText="myyntihinta" SortExpression="myyntihinta" ReadOnly="True" />
            </Columns>
  
        </asp:GridView>
    </form>
    </body>
</html>

