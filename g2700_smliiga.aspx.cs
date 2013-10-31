using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class g2700_smliiga : System.Web.UI.Page
{
    DataTable dt;
    DataSet ds;
    DataView dv;
    bool joukkuefilter = false;
    protected void Page_Load(object sender, EventArgs e)
    {
       var db = System.Configuration.ConfigurationManager.ConnectionStrings["smliigadb"];
      // SqlConnection con = new SqlConnection(db);
       OleDbConnection Conn = new OleDbConnection(db.ToString());

       using (Conn)
       {
           Conn.Open();
           OleDbCommand cmd = new OleDbCommand("SELECT * FROM Pelaajat", Conn);
           OleDbDataAdapter oDA = new OleDbDataAdapter(cmd);
           dt = new DataTable();
           oDA.Fill(dt);
       }
        if(dv == null) {
            dv = dt.DefaultView;
        }
       gvArticle.DataSource = dv;
       gvArticle.DataBind();
//       drpjoukkueet.DataSource ;
       if (!IsPostBack)
       {
           
           DataTable ddt;
           ddt = dt.DefaultView.ToTable(true, "Joukkue");
           DataRow row2 = ddt.NewRow();
           row2["Joukkue"] = "Kaikki";
           ddt.Rows.InsertAt(row2, 0);
           drpjoukkueet.DataSource = ddt.DefaultView;
           drpjoukkueet.DataTextField = "Joukkue";
           drpjoukkueet.DataBind();

           DataTable tb;
           tb = dt.DefaultView.ToTable(true, "PP");

           DataRow row3 = tb.NewRow();
           row3["PP"] = "Kaikki";
           tb.Rows.InsertAt(row3, 0);

           drppelipaikka.DataSource = tb.DefaultView;
           drppelipaikka.DataTextField = "PP";
           drppelipaikka.DataBind();


       }
    }


    protected void drpjoukkueet_SelectedIndexChanged(object sender, EventArgs e)
    {
        joukkuefilter = true;
        if (drpjoukkueet.SelectedValue == "Kaikki")
        {
            dv.RowFilter = createfilter();
            gvArticle.DataSource = dv;
            gvArticle.DataBind();
            return;

        }
        //DataTable dt;
       // dt = ds.Tables[0];
        dv = dt.DefaultView;

       // if (drpjoukkueet.SelectedValue != "Kaikki")
        //{
        dv.RowFilter = createfilter();
           // dv.RowFilter = string.Format("Joukkue like '%{0}%'", drpjoukkueet.SelectedValue);
        //}
            dv.Sort = "Nimi asc";
        gvArticle.DataSource = dv;
        gvArticle.DataBind();
    }


    private const string ASCENDING = " ASC";
    private const string DESCENDING = " DESC";


    public SortDirection GridViewSortDirection
    {
        get
        {
            if (ViewState["sortDirection"] == null)
                ViewState["sortDirection"] = SortDirection.Ascending;

            return (SortDirection)ViewState["sortDirection"];
        }
        set { ViewState["sortDirection"] = value; }
    }
    

    protected void gvArticle_Sorting(object sender, GridViewSortEventArgs e)
    {

        string sortExpression = e.SortExpression;

        if (GridViewSortDirection == SortDirection.Ascending)
        {
            GridViewSortDirection = SortDirection.Descending;
            SortGridView(sortExpression, DESCENDING);
        }
        else
        {
            GridViewSortDirection = SortDirection.Ascending;
            SortGridView(sortExpression, ASCENDING);
        }
        
    }
    
    private void SortGridView(string sortExpression, string direction)
    {
        //  You can cache the DataTable for improving performance
        string filter = "";

        //dv = new DataView(dt);
        if (drpjoukkueet.SelectedIndex != 0)
        {
            filter += string.Format("Joukkue like '%{0}%'", drpjoukkueet.SelectedValue);
        }
        if (drppelipaikka.SelectedIndex != 0)
        {
            if (filter.Length > 0) 
                filter += " and ";
            filter += string.Format("PP like '{0}'", drppelipaikka.SelectedValue);
        }
        dv.RowFilter = filter;
        dv.Sort = sortExpression + direction;

        gvArticle.DataSource = dv;
        gvArticle.DataBind();
    }

    protected void drppelipaikka_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (drppelipaikka.SelectedValue == "Kaikki")
        {


            dv.RowFilter = createfilter();
            gvArticle.DataSource = dv;
            gvArticle.DataBind();
    
            return;
        }
        dv = dt.DefaultView;

        // if (drpjoukkueet.SelectedValue != "Kaikki")
        //{

            //dv.RowFilter = string.Format("PP like '{0}'", drppelipaikka.SelectedValue);
        dv.RowFilter = createfilter();
       
        //}
        dv.Sort = "P desc";
        gvArticle.DataSource = dv;
        gvArticle.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        joukkuefilter = false;
        drpjoukkueet.SelectedIndex = -1;
        drppelipaikka.SelectedIndex = -1;
        dv = dt.DefaultView;
        gvArticle.DataSource = dv;
        gvArticle.DataBind();
    }

    private string createfilter()
    {
        string filter = "";

        //dv = new DataView(dt);
        if (drpjoukkueet.SelectedIndex != 0)
        {
            filter += string.Format("Joukkue like '%{0}%'", drpjoukkueet.SelectedValue);
        }
        if (drppelipaikka.SelectedIndex != 0)
        {
            if (filter.Length > 0)
                filter += " and ";
            filter += string.Format("PP like '{0}'", drppelipaikka.SelectedValue);
        }
        return filter;
    }
}