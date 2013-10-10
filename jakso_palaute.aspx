<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master" CodeFile="jakso_palaute.aspx.cs" Inherits="jakso_palaute" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="leftpanel">
        <asp:Label ID="Label1" runat="server" Text="Pvm:"></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Aseta päivämäärä" ControlToValidate="TextBox1" ForeColor="Red"></asp:RequiredFieldValidator>

        <asp:Label ID="Label2" runat="server" Text="Nimi"></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>     
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Aseta nimi" ControlToValidate="TextBox2" ForeColor="Red"></asp:RequiredFieldValidator>   
        
        <br />
        <asp:Label ID="Label3" runat="server" Text="Olen oppinut:"></asp:Label>
        <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="!" ControlToValidate="TextBox3" ForeColor="Red"></asp:RequiredFieldValidator>   
        <br />
        <asp:Label ID="Label4" runat="server" Text="Haluan oppia:"></asp:Label>
        <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="!" ControlToValidate="TextBox4" ForeColor="Red"></asp:RequiredFieldValidator>   
        <br />
        <asp:Label ID="Label5" runat="server" Text="Hyvää"></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server" TextMode="MultiLine"></asp:TextBox>        
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="!" ControlToValidate="TextBox5" ForeColor="Red"></asp:RequiredFieldValidator>   
        <br />
        <asp:Label ID="Label6" runat="server" Text="Parannettavaa"></asp:Label>
        <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="!" ControlToValidate="TextBox6" ForeColor="Red"></asp:RequiredFieldValidator>   
        <br />
        <asp:Label ID="Label7" runat="server" Text="Muuta:"></asp:Label>
        <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine"></asp:TextBox>        
    </div>

    <asp:Button ID="btnSendFeedback" runat="server" Text="Lähetä palaute" OnClick="btnSendFeedback_Click"/>


    <br />

    <asp:Button ID="btnGetFeedback" runat="server" Text="Näytä palaute" OnClick="btnGetFeedback_Click" CausesValidation="False"/>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView>

</asp:Content>
