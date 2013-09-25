using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class g2700_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Session.RemoveAll();
           
            if (Request.Cookies["user"] != null)
            {
                //Keksin poisto
                HttpCookie aCookie;
                string cookieName;
                int limit = Request.Cookies.Count;
                for (int i = 0; i < limit; i++)
                {
                    cookieName = Request.Cookies[i].Name;
                    aCookie = new HttpCookie(cookieName);
                    aCookie.Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies.Add(aCookie);
                }
            }
    }

    protected void btnParam_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/g2700_Valuuttamuunnin2.aspx?user=" + HttpUtility.UrlEncode(user.Text));
    }

    protected void btnSessio_Click(object sender, EventArgs e)
    {
        Session["user"] = HttpUtility.UrlEncode(user.Text);
        Response.Redirect("~/g2700_Valuuttamuunnin2.aspx");
    }

    protected void btnKeksi_Click(object sender, EventArgs e)
    {
        Response.Cookies["user"].Value = user.Text;
        Response.Cookies["user"].Expires = DateTime.Now.AddDays(1);

        HttpCookie aCookie = new HttpCookie("lastVisit");
        aCookie.Value = DateTime.Now.ToString();
        aCookie.Expires = DateTime.Now.AddDays(1);
        Response.Cookies.Add(aCookie);

        Response.Redirect("~/g2700_Valuuttamuunnin2.aspx");
    }
}