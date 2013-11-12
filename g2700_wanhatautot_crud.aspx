<%@ Page Language="C#" AutoEventWireup="true" CodeFile="g2700_wanhatautot_crud.aspx.cs" Inherits="g2700_wanhatautot_crud" %>


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
       
        <asp:GridView ID="gvCrud" runat="server" DataKeyNames="aid" CssClass="GridView" ShowFooter="true" AutoGenerateColumns="false" OnRowDataBound="gvCrud_RowDataBound" OnRowCancelingEdit="gvCrud_RowCancelingEdit" OnRowEditing="gvCrud_RowEditing" OnRowCommand="gvCrud_RowCommand" OnRowDeleting="gvCrud_RowDeleting">
            <EmptyDataTemplate>
                Data Not Found!
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btnEdit" runat="server" CommandName="Edit" Text="Muokkaa" CausesValidation="false" ToolTip="Edit Record" />
                        <asp:Button ID="btnDelete" runat="server" CommandName="Delete" Text="Poista" CausesValidation="false" ToolTip="Delete Record" OnClientClick="return confirm('Haluatko varmasti poistaa tämän?')" />
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:Button ID="btnUpdate" runat="server" Text="Tallenna" CommandName="Modify" CommandArgument='<%# Eval("aid") %>' ValidationGroup="Edit" ToolTip="Update Record" />
                        <asp:Button ID="btnCancel" runat="server" Text="Peruuta" CommandName="Cancel" CausesValidation="false" ToolTip="Cancel" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:Button ID="btnInsert" runat="server" Text="Lisää" ValidationGroup="Insert" CausesValidation="true" ToolTip="Insert Record" OnClick="btnInsert_Click" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Merkki">
                    <ItemTemplate>
                        <%# Eval("merkki") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMerkkiEdit" runat="server" Text='<%# Eval("merkki") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertMerkki" runat="server" ControlToValidate="txtMerkkiEdit" SetFocusOnError="true" ValidationGroup="Edit" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtMerkkiInsert" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertMerkki" runat="server" ControlToValidate="txtMerkkiInsert" SetFocusOnError="true" ValidationGroup="Insert" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Malli">
                    <ItemTemplate>
                        <%# Eval("malli") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMalliEdit" runat="server" Text='<%# Eval("malli") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditMalli" runat="server" ControlToValidate="txtMalliEdit" SetFocusOnError="true" ValidationGroup="Edit" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtMalliInsert" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertMalli" runat="server" ControlToValidate="txtMalliInsert" SetFocusOnError="true" ValidationGroup="Insert" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="vm">
                    <ItemTemplate>
                        <%# Eval("vm") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlvmEdit" runat="server">
                            <asp:ListItem Text="–Valitse–"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvEditvm" runat="server" ControlToValidate="ddlvmEdit" SetFocusOnError="true" ValidationGroup="Edit" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <br />
                         <asp:RangeValidator id="rvVM" ControlToValidate="ddlvmEdit" MinimumValue="1" MaximumValue="3000" Type="Integer" EnableClientScript="false" Text="Valitse vuosi" runat="server" ValidationGroup="Edit" ForeColor="Red" Display="Dynamic"/>
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="ddlvmInsert" runat="server" OnPreRender="ddlvmInsert_PreRender">
                            <asp:ListItem Text="–Valitse–"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="rfvvmInsert" runat="server" ControlToValidate="ddlvmInsert" SetFocusOnError="true" ValidationGroup="Insert" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:RangeValidator id="rvVM" ControlToValidate="ddlvmInsert" MinimumValue="1" MaximumValue="3000" Type="Integer" EnableClientScript="false" Text="Valitse vuosi" runat="server" ValidationGroup="Insert" ForeColor="Red" Display="Dynamic"/>
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Ostohinta">
                    <ItemTemplate>
                        <%# Eval("sisaanOstoHinta") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtOstohintaEdit" runat="server" Text='<%# Eval("sisaanOstoHinta") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditOstohinta" runat="server" ControlToValidate="txtOstohintaEdit" SetFocusOnError="true" ValidationGroup="Edit" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <br />
                         <asp:CustomValidator runat="server" ID="cvOstohinta" ControlToValidate="txtOstohintaEdit" SetFocusOnError="true" ValidationGroup="Edit" OnServerValidate="cvMyyntihinta_ServerValidate" ForeColor="Red" Display="Dynamic" ErrorMessage="Syötä hinta" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtOstohintaInsert" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertOstohinta" runat="server" ControlToValidate="txtOstohintaInsert" SetFocusOnError="true" ValidationGroup="Insert" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:CustomValidator runat="server" ID="cvOstohinta" ControlToValidate="txtOstohintaInsert" SetFocusOnError="true" ValidationGroup="Insert" OnServerValidate="cvMyyntihinta_ServerValidate" ForeColor="Red" Display="Dynamic" ErrorMessage="Syötä hinta" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Myyntihinta">
                    <ItemTemplate>
                        <%# Eval("myyntiHinta") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtMyyntihintaEdit" runat="server" Text='<%# Eval("myyntiHinta") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditMyyntihinta" runat="server" ControlToValidate="txtMyyntihintaEdit" SetFocusOnError="true" ValidationGroup="Edit" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:CustomValidator runat="server" ID="cvMyyntihinta" ControlToValidate="txtMyyntihintaEdit" SetFocusOnError="true" ValidationGroup="Edit" OnServerValidate="cvMyyntihinta_ServerValidate" ForeColor="Red" Display="Dynamic" ErrorMessage="Syötä hinta" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtMyyntihintaInsert" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertMyyntihinta" runat="server" ControlToValidate="txtMyyntihintaInsert" SetFocusOnError="true" ValidationGroup="Insert" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <br />
                       <asp:CustomValidator runat="server" ID="cvMyyntihinta" ControlToValidate="txtMyyntihintaInsert" SetFocusOnError="true" ValidationGroup="Insert" OnServerValidate="cvMyyntihinta_ServerValidate" ForeColor="Red" Display="Dynamic" ErrorMessage="Syötä hinta" />
                    </FooterTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Rekkari">
                    <ItemTemplate>
                        <%# Eval("rekkari") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtRekkariEdit" runat="server" Text='<%# Eval("rekkari") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEditRekkari" runat="server" ControlToValidate="txtRekkariEdit" SetFocusOnError="true" ValidationGroup="Edit" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:CustomValidator runat="server" ID="cvRekkari" ControlToValidate="txtRekkariEdit" SetFocusOnError="true" ValidationGroup="Edit" OnServerValidate="cusCustom_ServerValidate" ForeColor="Red" Display="Dynamic" ErrorMessage="Virheellinen rekisteritunnus" />
                    </EditItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="txtRekkariInsert" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvInsertRekkari" runat="server" ControlToValidate="txtRekkariInsert" SetFocusOnError="true" ValidationGroup="Insert" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                        <br />
                        <asp:CustomValidator runat="server" ID="cvRekkari" ControlToValidate="txtRekkariInsert" SetFocusOnError="true" ValidationGroup="Insert" OnServerValidate="cusCustom_ServerValidate" ForeColor="Red" Display="Dynamic" ErrorMessage="Virheellinen rekisteritunnus" />

                    </FooterTemplate>
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
