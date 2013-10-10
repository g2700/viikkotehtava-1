using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class jakso_palaute : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSendFeedback_Click(object sender, EventArgs e)
    {
        
        if (Page.IsValid)
        {
            XmlDocument oXmlDocument = new XmlDocument();

            oXmlDocument.Load(MapPath("~/App_Data/Palautteet.xml"));

            XmlNode oXmlRootNode = oXmlDocument.SelectSingleNode("palautteet");

            XmlNode oXmlRecordNode = oXmlRootNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element, "palaute", ""));
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element,
                "pvm", "")).InnerText = TextBox1.Text;
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element,
                "tekija", "")).InnerText = TextBox2.Text;
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element,
                 "opittu", "")).InnerText = TextBox3.Text;
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element,
            "haluanoppia", "")).InnerText = TextBox4.Text;
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element,
                "hyvaa", "")).InnerText = TextBox5.Text;
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element,
                 "parannettavaa", "")).InnerText = TextBox6.Text;
            oXmlRecordNode.AppendChild(oXmlDocument.CreateNode(XmlNodeType.Element,
                  "muuta", "")).InnerText = TextBox7.Text;

            oXmlDocument.Save(MapPath("~/App_Data/Palautteet.xml")); 

        }
        

    }
    protected void btnGetFeedback_Click(object sender, EventArgs e)
    {
        DataSet ds = new DataSet();
        DataTable dt;
        //dt = new DataTable();
        ds.ReadXml(MapPath("~/App_Data/Palautteet.xml"));
        dt = ds.Tables[0];
        //kytketään kontrolliin
        //GridView1.DataSource = ds; //toimii jos yksi taulu
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}