using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class g2700_Valuuttamuunnin2 : System.Web.UI.Page
{
    private const float Markkarate = 5.94573F;

    protected void Page_Load(object sender, EventArgs e)
    {
        String teksti = "";
        //param
        if (Request.QueryString["user"] != null)
        {
            teksti = Request.QueryString["user"];
        }
        //session 
        if (Session["user"] != null)
        {
            teksti = (string)(Session["user"]);
        }        
        //keksit
        if (Request.Cookies["user"] != null)
        {
            teksti = Server.HtmlEncode(Request.Cookies["user"].Value);
        }
        lblNimi.Text = teksti;
    }

    protected void btnMuunna_Click(object sender, EventArgs e)
    {
        try
        {
            //muunnetaan markat euroiksi
        lblEurot.Text = string.Format("{0:0.00000} euroa",
          float.Parse(txtbMarkat.Text) / Markkarate);
 
        }
        catch (Exception ex)
        {
            lblEurot.Text = ex.Message;
        }
    }
}