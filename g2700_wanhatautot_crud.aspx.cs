using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class g2700_wanhatautot_crud : System.Web.UI.Page
{

    List<string> v;



    protected void Page_Load(object sender, EventArgs e)
    {
        v = new List<string>();
        for (int i = 1900; i <= 2013; i++)
        {
            v.Add(i.ToString());
        }


        if (!IsPostBack)
        {
            v = new List<string>();
            for (int i = 1900; i <= 2013; i++)
            {
                v.Add(i.ToString());
            }
            BindGrid();
            DropDownList ddlvm = (DropDownList)gvCrud.FooterRow.FindControl("ddlvmInsert");

            ddlvm.AppendDataBoundItems = true;
            ddlvm.DataSource = v;
            ddlvm.DataBind();
        }
    }
    private void BindGrid()
    {
        DataSet ds = new DataSet();
        ds.ReadXml(MapPath("~/App_Data/WanhatAutot.xml"));
        gvCrud.DataSource = ds;
        gvCrud.DataBind();

    }

    protected void btnInsert_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            TextBox txtMerkki = (TextBox)gvCrud.FooterRow.FindControl("txtMerkkiInsert");
            DropDownList ddlvm = (DropDownList)gvCrud.FooterRow.FindControl("ddlvmInsert");
            TextBox txtMalli = (TextBox)gvCrud.FooterRow.FindControl("txtMalliInsert");
            TextBox txtOstohinta = (TextBox)gvCrud.FooterRow.FindControl("txtOstohintaInsert");
            TextBox txtMyyntihinta = (TextBox)gvCrud.FooterRow.FindControl("txtMyyntihintaInsert");
            TextBox txtRekkari = (TextBox)gvCrud.FooterRow.FindControl("txtRekkariInsert");



            XmlDocument oXmlDocument = new XmlDocument();
            oXmlDocument.Load(MapPath("~/App_Data/WanhatAutot.xml"));
            XmlNode oXmlRootNode = oXmlDocument.SelectSingleNode("Wanhatautot");
            XmlNode oXmlRecordNode = oXmlRootNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "Auto", ""));
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "aid", "")).InnerText = (new Random()).Next(1000, 100000).ToString(); // fix it
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "rekkari", "")).InnerText = txtRekkari.Text;
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "merkki", "")).InnerText = txtMerkki.Text;
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "malli", "")).InnerText = txtMalli.Text;
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "vm", "")).InnerText = ddlvm.SelectedValue;
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "myyntiHinta", "")).InnerText = txtMyyntihinta.Text;
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "sisaanOstoHinta", "")).InnerText = txtOstohinta.Text;
            oXmlDocument.Save(MapPath("~/App_Data/WanhatAutot.xml"));




            Response.Write("Record Inserted!");
            BindGrid();
        }
    }

    protected void gvCrud_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowState == DataControlRowState.Edit || e.Row.RowState ==
            (DataControlRowState.Edit | DataControlRowState.Alternate))
        {

            DropDownList ddlvm = (DropDownList)e.Row.FindControl("ddlvmEdit");

            ddlvm.AppendDataBoundItems = true;
            ddlvm.DataSource = v;
            ddlvm.DataBind();

            ddlvm.SelectedValue = DataBinder.Eval(e.Row.DataItem, "vm").ToString();
        }


    }

    protected void gvCrud_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvCrud.EditIndex = e.NewEditIndex;
        BindGrid();
    }

    protected void gvCrud_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvCrud.EditIndex = -1;
        BindGrid();
    }

    protected void gvCrud_RowCommand(object sender, GridViewCommandEventArgs e)
    {


        if (e.CommandName == "Modify")
        {
            if (Page.IsValid)
            {

                GridViewRow row = (GridViewRow)(((Button)e.CommandSource).NamingContainer);
                int index = row.RowIndex;

                string id = gvCrud.DataKeys[row.RowIndex].Value.ToString();


                TextBox txtMerkki = (TextBox)row.FindControl("txtMerkkiEdit");
                DropDownList ddlvm = (DropDownList)row.FindControl("ddlvmEdit");
                TextBox txtMalli = (TextBox)row.FindControl("txtMalliEdit");
                TextBox txtOstohinta = (TextBox)row.FindControl("txtOstohintaEdit");
                TextBox txtMyyntihinta = (TextBox)row.FindControl("txtMyyntihintaEdit");
                TextBox txtRekkari = (TextBox)row.FindControl("txtRekkariEdit");

                XmlDocument oXmlDocument = new XmlDocument();
                oXmlDocument.Load(MapPath("~/App_Data/WanhatAutot.xml"));
                XmlNode oldChild = oXmlDocument.SelectSingleNode("/Wanhatautot/Auto/descendant::*[contains(text(), '" + id + "')]").ParentNode;



                XmlNode newChild = oldChild.Clone();
                newChild["rekkari"].InnerText = txtRekkari.Text;
                newChild["merkki"].InnerText = txtMerkki.Text;
                newChild["malli"].InnerText = txtMalli.Text;
                newChild["vm"].InnerText = ddlvm.SelectedValue;
                newChild["myyntiHinta"].InnerText = txtMyyntihinta.Text;
                newChild["sisaanOstoHinta"].InnerText = txtOstohinta.Text;


                oXmlDocument.DocumentElement.ReplaceChild(newChild, oldChild);



                oXmlDocument.Save(MapPath("~/App_Data/WanhatAutot.xml"));


                Response.Write("Record Updated!");
                gvCrud.EditIndex = -1;
                BindGrid();

            }
        }
    }
    protected void gvCrud_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = gvCrud.DataKeys[e.RowIndex].Value.ToString();

        XmlDocument xml = new XmlDocument();
        xml.Load(MapPath("~/App_Data/WanhatAutot.xml"));
        XmlNode oldChild = xml.SelectSingleNode("/Wanhatautot/Auto/descendant::*[contains(text(), '" + id + "')]");
        xml.DocumentElement.RemoveChild(oldChild.ParentNode);
        xml.Save(MapPath("~/App_Data/WanhatAutot.xml"));

        Response.Write("Record Deleted!");
        BindGrid();
    }


    protected void cusCustom_ServerValidate(object source, ServerValidateEventArgs args)
    {


            if (BLAutot.isValidRekkari(args.Value)) 
                args.IsValid = true;
            else
                args.IsValid = false;
        
    }
    protected void ddlvmInsert_PreRender(object sender, EventArgs e)
    {
        DropDownList ddlvm = (DropDownList)gvCrud.FooterRow.FindControl("ddlvmInsert");

        ddlvm.AppendDataBoundItems = true;
        ddlvm.DataSource = v;
        ddlvm.DataBind();
    }
    protected void cvMyyntihinta_ServerValidate(object source, ServerValidateEventArgs args)
    {
        if (BLAutot.isValidHinta(args.Value))
            args.IsValid = true;
        else
            args.IsValid = false;
    }
}