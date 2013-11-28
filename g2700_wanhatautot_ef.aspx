<%@ Page Language="C#" AutoEventWireup="true" CodeFile="g2700_wanhatautot_ef.aspx.cs" Inherits="g2700_wanhatautot_ef" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>

    </div>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=autodbEntities" DefaultContainerName="autodbEntities" EnableFlattening="False" EnableInsert="True" EntitySetName="wanhatautot" EntityTypeFilter="autott" EnableDelete="True" EnableUpdate="True">
        </asp:EntityDataSource>
        <asp:GridView ID="GridView1" runat="server" DataSourceID="EntityDataSource1" AutoGenerateColumns="False" DataKeyNames="id" AllowSorting="True">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="id" HeaderText="id" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="rekkari" HeaderText="rekkari" SortExpression="rekkari" />
                <asp:BoundField DataField="merkki" HeaderText="merkki" SortExpression="merkki" />
                <asp:BoundField DataField="malli" HeaderText="malli" SortExpression="malli" />
                <asp:BoundField DataField="vm" HeaderText="vm" SortExpression="vm" />
                <asp:BoundField DataField="myyntihinta" HeaderText="myyntihinta" SortExpression="myyntihinta" />
                <asp:BoundField DataField="sisaanostohinta" HeaderText="sisaanostohinta" SortExpression="sisaanostohinta" />
            </Columns>
  
        </asp:GridView>
        <asp:FormView ID="FormView1" runat="server" DataKeyNames="id" DataSourceID="EntityDataSource1" DefaultMode="Insert">
            <EditItemTemplate>
                id:
                <asp:Label ID="idLabel1" runat="server" Text='<%# Eval("id") %>' />
                <br />
                rekkari:
                <asp:TextBox ID="rekkariTextBox" runat="server" Text='<%# Bind("rekkari") %>' />
                <br />
                merkki:
                <asp:TextBox ID="merkkiTextBox" runat="server" Text='<%# Bind("merkki") %>' />
                <br />
                malli:
                <asp:TextBox ID="malliTextBox" runat="server" Text='<%# Bind("malli") %>' />
                <br />
                vm:
                <asp:TextBox ID="vmTextBox" runat="server" Text='<%# Bind("vm") %>' />
                <br />
                myyntihinta:
                <asp:TextBox ID="myyntihintaTextBox" runat="server" Text='<%# Bind("myyntihinta") %>' />
                <br />
                sisaanostohinta:
                <asp:TextBox ID="sisaanostohintaTextBox" runat="server" Text='<%# Bind("sisaanostohinta") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>
            <InsertItemTemplate>
                id:
                <asp:TextBox ID="idTextBox" runat="server" Text='<%# Bind("id") %>' />
                <br />
                rekkari:
                <asp:TextBox ID="rekkariTextBox" runat="server" Text='<%# Bind("rekkari") %>' />
                <br />
                merkki:
                <asp:TextBox ID="merkkiTextBox" runat="server" Text='<%# Bind("merkki") %>' />
                <br />
                malli:
                <asp:TextBox ID="malliTextBox" runat="server" Text='<%# Bind("malli") %>' />
                <br />
                vm:
                <asp:TextBox ID="vmTextBox" runat="server" Text='<%# Bind("vm") %>' />
                <br />
                myyntihinta:
                <asp:TextBox ID="myyntihintaTextBox" runat="server" Text='<%# Bind("myyntihinta") %>' />
                <br />
                sisaanostohinta:
                <asp:TextBox ID="sisaanostohintaTextBox" runat="server" Text='<%# Bind("sisaanostohinta") %>' />
                <br />
                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </InsertItemTemplate>
            <ItemTemplate>
                id:
                <asp:Label ID="idLabel" runat="server" Text='<%# Eval("id") %>' />
                <br />
                rekkari:
                <asp:Label ID="rekkariLabel" runat="server" Text='<%# Bind("rekkari") %>' />
                <br />
                merkki:
                <asp:Label ID="merkkiLabel" runat="server" Text='<%# Bind("merkki") %>' />
                <br />
                malli:
                <asp:Label ID="malliLabel" runat="server" Text='<%# Bind("malli") %>' />
                <br />
                vm:
                <asp:Label ID="vmLabel" runat="server" Text='<%# Bind("vm") %>' />
                <br />
                myyntihinta:
                <asp:Label ID="myyntihintaLabel" runat="server" Text='<%# Bind("myyntihinta") %>' />
                <br />
                sisaanostohinta:
                <asp:Label ID="sisaanostohintaLabel" runat="server" Text='<%# Bind("sisaanostohinta") %>' />
                <br />
                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
            </ItemTemplate>
        </asp:FormView>
    </form>
    </body>
</html>

