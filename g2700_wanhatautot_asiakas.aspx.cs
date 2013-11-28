using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class g2700_wanhatautot_asiakas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        using (var objCtx = new autodbModel.autodbEntities())
        {
            var autoja = from cs in objCtx.wanhatautot
                         where cs.merkki.Contains(TextBox1.Text) || TextBox1.Text.Length == 0
                         select cs;

            GridView1.DataSourceID = null;
            GridView1.DataSource = autoja;
            GridView1.DataBind();
        }
    }
}