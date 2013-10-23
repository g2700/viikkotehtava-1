<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/levykauppamaster.master" CodeFile="g2700_levyntiedot.aspx.cs" Inherits="g2700_levyntiedot" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   <div> <asp:image ID="imgLevy" runat="server"></asp:image></div>
     <br />
    <h3><asp:label ID="lblartist" runat="server" text="Label"></asp:label> <asp:label ID="lbltitle" runat="server" text="Label"></asp:label></h3>
    ISBN: <asp:label ID="lblisbn" runat="server" text="Label"></asp:label><br />
    Hinta: <asp:label ID="lblhinta" runat="server" text="Label"></asp:label><br /> 
    <h3>Levyn biisit:</h3>
    <asp:DataList ID="DataList1" runat="server">
        <ItemTemplate>
                <%# ((System.Xml.XmlNode)Container.DataItem).Attributes["name"].Value %>
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:XmlDataSource ID="XmlDataSource1" runat="server" DataFile="~/LevykauppaX.xml" XPath="//Records//genre//record"></asp:XmlDataSource>


    


    <br /><a href="g2700_levykauppax.aspx">Takaisin</a>
    </asp:Content>