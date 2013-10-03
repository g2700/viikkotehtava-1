using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Tehtava_3_G2700_Treeview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TreeView1.ExpandDepth = 1;
    }
}