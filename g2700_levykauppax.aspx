<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/levykauppamaster.master" CodeFile="g2700_levykauppax.aspx.cs" Inherits="g2700_levykauppax" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    h2 {
        margin-top:2px;
    }
    .dataelement {
        float:left;

    }
    #clear {
        clear: both;
    }
    #tiedot {
        margin-left: 150px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:DataList ID="DataList1" runat="server" DataSourceID="XmlDataSource1">
        <ItemTemplate>
           <div class="dataelement"><img src="images/<%# Eval("ISBN") %>.jpg" alt="Smiley face" height="100" width="100">   </div>  
            <div class="dataelement" id="tiedot">
                <h2><asp:Label ID="Label2" runat="server" Text='<%# Eval("Artist") %>' /> : <asp:Label ID="Label3" runat="server" Text='<%# Eval("Title") %>' /></h2>
                
                ISBN:<a href="g2700_levyntiedot.aspx?ISBN=<%# Eval("ISBN") %>"><%# Eval("ISBN") %></a><br />Hinta:<asp:Label ID="Label1" runat="server" Text='<%# Eval("Price") %>' /><br />
            </div>
            <div id="clear" />
        </ItemTemplate>
    </asp:DataList>

    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/LevykauppaX.xml" XPath="//Records//genre//record"></asp:XmlDataSource>



</asp:Content>