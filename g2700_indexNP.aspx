﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="g2700_indexNP.aspx.cs" Inherits="g2700_indexNP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
    <div>
        <br />
         <asp:HyperLink ID="HyperLinkT1" runat="server" NavigateUrl="~/g2700_Default2.aspx">Viikkotehtävän 1 ratkaisu</asp:HyperLink><br />
    <br />
        <asp:HyperLink ID="HyperLinkT2" runat="server" NavigateUrl="~/g2700_elakelaskuri.aspx">Viikkotehtävän 2 ratkaisu</asp:HyperLink><br />
        <br />
        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/Tehtava-3/g2700_Treeview.aspx">Viikkotehtävän 3 ratkaisu</asp:HyperLink><br />
                <br />
        <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/g2700_wanhatautot.aspx">Viikkotehtävän 4 ratkaisu</asp:HyperLink><br />
                <br />
        <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/g2700_levykauppax.aspx">Viikkotehtävän 5 ratkaisu</asp:HyperLink><br />
    </div>
    <asp:HyperLink ID="HyperLinkTT" runat="server" NavigateUrl="~/jakso_palaute.aspx">10.10 tuntitehtävä & puolivälipalaute</asp:HyperLink>


</asp:Content>
