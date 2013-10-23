using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class g2700_levyntiedot : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string isbn = Request.QueryString["ISBN"];
        XmlDataSource1.XPath = "//Records//genre//record";
        XmlDocument doc = XmlDataSource1.GetXmlDocument();

        XmlNodeList nodes = doc.SelectNodes("//Records//genre//record[@ISBN='"+Request.QueryString["ISBN"]+"']");
        XmlNode node = nodes.Item(0);
      
        DataList1.DataSource = node;
        DataList1.DataBind();
        lblartist.Text =  node.Attributes["Artist"].Value;
        lbltitle.Text = node.Attributes["Title"].Value;
        lblhinta.Text = node.Attributes["Price"].Value;
        lblisbn.Text = isbn;
        imgLevy.ImageUrl = "images/" + isbn + ".jpg";
    }
}