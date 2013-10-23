using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using System.Xml.XPath;

public partial class g2700_wanhatautot : System.Web.UI.Page
{
    DataSet ds;

    private int[] getrandomnumbers(int max, int n)
    {
        var list = new List<int>(n);
        int r;
        Random rnd = new Random();
        while(list.Count < n)
        {
            r = rnd.Next(max);
            if (list.Contains(r))
            {
                continue;
            }
            list.Add(r);
            
        }
        return list.ToArray();
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        List<string> columns = new List<string>();
        columns.Add("merkki");
        columns.Add("malli");
        columns.Add("vm");
        columns.Add("myyntiHinta");
 
        ds = new DataSet();
        ds.ReadXml(MapPath("~/App_Data/WanhatAutot.xml"));

        DataTable dt;
        dt = ds.Tables[0];

        
        int[] randomnumbers = getrandomnumbers(dt.Rows.Count, 4);
        DataTable randomrows = dt.Clone();
        foreach (int n in randomnumbers)
        {
            randomrows.ImportRow(dt.Rows[n]);
        }

        gvAutot.DataSource = randomrows.DefaultView.ToTable(false, columns.ToArray());
        gvAutot.DataBind();


        // Dropdownlistin bindaus
        if (!IsPostBack)
        {
            DataTable ddt;
            ddt = dt.DefaultView.ToTable(true, "merkki");

            DataRow row2 = ddt.NewRow();
            row2["merkki"] = "Kaikki";
            ddt.Rows.InsertAt(row2, 0);
            DataRow row = ddt.NewRow();
            row["merkki"] = "-- Valitse --";
            ddt.Rows.InsertAt(row, 0);
            DropDownMerkit.DataSource = ddt.DefaultView;
            DropDownMerkit.DataTextField = "merkki";
            DropDownMerkit.DataBind();
        }
    }
    protected void btnHintaNouseva_Click(object sender, EventArgs e)
    {        
        
        DataTable dt;
        dt = ds.Tables[0];
        DataTable dt2 = dt.Clone();
        dt2.Columns["myyntiHinta"].DataType = Type.GetType("System.Int32");

        foreach (DataRow dr in dt.Rows)
        {
            dt2.ImportRow(dr);
        }
        dt2.AcceptChanges();
        DataView dv = dt2.DefaultView;
        dv.Sort = "myyntiHinta ASC";

        gvAutot.DataSource = dt2.DefaultView;
        gvAutot.DataBind();
    }
    protected void btnHintaLaskeva_Click(object sender, EventArgs e)
    {

       DataTable dt;           
        dt = ds.Tables[0];
        DataTable dt2 = dt.Clone();
        dt2.Columns["myyntiHinta"].DataType = Type.GetType("System.Int32");
        foreach (DataRow dr in dt.Rows)
        {
            dt2.ImportRow(dr);
        }
        dt2.AcceptChanges();
        DataView dv = dt2.DefaultView;
        dv.Sort = "myyntiHinta DESC";
        gvAutot.DataSource = dt2.DefaultView;
        gvAutot.DataBind();

        /********* TOIMIVA MYÖS mutta korvaa columnin uudella ***********
        ddt.Columns.Add("MyyntiHinta", typeof(Int32));
        foreach (DataRow item in ddt.Rows)
        {
            item["MyyntiHinta"] = item["myyntiHinta"];
        }
        ddt.DefaultView.Sort = "MyyntiHinta desc";
        ddt.Columns.Remove("myyntiHinta");
        gvAutot.DataSource = ddt;
        ***********************/

       // gvAutot.DataSource = ddt.DefaultView; 

    }


    protected void DropDownMerkit_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownMerkit.SelectedValue == "-- Valitse --")
        {
            return;
        }
        DataTable dt;
        dt = ds.Tables[0];
        DataView dv = dt.DefaultView;

        if (DropDownMerkit.SelectedValue != "Kaikki")
        {
            dv.RowFilter = string.Format("merkki like '%{0}%'", DropDownMerkit.SelectedValue);
        }
        gvAutot.DataSource = dv;
        gvAutot.DataBind();
    
    }

    protected void btnHae_Click(object sender, EventArgs e)
    {
        DataTable dt;
        dt = ds.Tables[0];
        DataView dv = dt.DefaultView;
        dv.RowFilter = string.Format("merkki like '%{0}%'", TextBox1.Text);
        gvAutot.DataSource = dv;
        gvAutot.DataBind();     

    }
}