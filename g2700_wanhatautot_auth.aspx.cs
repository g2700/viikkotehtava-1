using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;

public partial class g2700_wanhatautot_auth : System.Web.UI.Page
{



    protected void Page_Load(object sender, EventArgs e)
    {


        if (!IsPostBack)
        {

            BindGrid();
  
        }
    }
    private void BindGrid()
    {
        DataSet ds = new DataSet();
        ds.ReadXml(MapPath("~/App_Data/WanhatAutot.xml"));
        gvCrud.DataSource = ds;
        gvCrud.DataBind();

    }







    protected void btnKirjaudu_Click(object sender, EventArgs e)
    {
        if (FormsAuthentication.Authenticate(this.txtKayttaja.Text, this.txtSala.Text))
        {
            FormsAuthentication.SetAuthCookie(this.txtKayttaja.Text, false);
            FormsAuthentication.RedirectFromLoginPage(this.txtKayttaja.Text, false);
        }
        else
        {
            lblKirjautuminen.Text = "Invalid login details. Please try again.";
        }
    }
    protected void btnHashkirjaudu_Click(object sender, EventArgs e)
    {
        XmlDocument doc = new XmlDocument();
        doc.Load(Server.MapPath("~/App_Data/Tunnukset.xml"));
        String hash = txtHashkayttaja.Text + txtHashsala.Text;
        var md5 = MD5.Create();
        byte[] hashed = md5.ComputeHash(Encoding.UTF8.GetBytes(hash));

        //create new instance of StringBuilder to save hashed data
        StringBuilder returnValue = new StringBuilder();

        //loop for each byte and add it to StringBuilder
        for (int i = 0; i < hashed.Length; i++)
        {
            returnValue.Append(hashed[i].ToString());
        }

        // return hexadecimal string
        var hashash = returnValue.ToString();
        foreach (XmlNode node in doc.SelectNodes("//Tunnukset"))
        {
            String username = node.SelectSingleNode("//kayttaja").InnerText;
            String password = node.SelectSingleNode("//sala").InnerText;


            if (username == txtHashkayttaja.Text && password == hashash)
            {
                Response.Redirect("g2700_wanhatautot_crud.aspx");
            }
            else
            {
                lblHashkirjautuminen.Text = "Invalid login details. Please try again.";
            }
        }

    }
}