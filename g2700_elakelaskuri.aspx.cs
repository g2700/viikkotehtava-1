using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class g2700_elakelaskuri : System.Web.UI.Page
{
    const int MIN_IKA = 18;
    const int MAX_IKA = 63;
    int ika; 
    int palkka; 


    protected int laskeElake()
    {
        return (int)((0.5 * palkka) - (63 - ika) * 5.5);
    }

    protected void setElakeText(int elake)
    {
        lblElake.Text = elake.ToString() + "€";
    }
    protected int lakiPalkka()
    {
        return (int)(0.5 * palkka);
    }

    protected int eaKerroin()
    {
        return (int)((-0.08) * palkka);
    }

    protected void Page_Load(object sender, EventArgs e)
    {

        ika = Int32.Parse(ConfigurationManager.AppSettings["ika"]);
        palkka = Int32.Parse(ConfigurationManager.AppSettings["palkka"]);
        //ika = appconfig.ika;
        //palkka = appconfig.palkka;
        setElakeText(laskeElake());
        lblLaki.Text = lakiPalkka().ToString();
        lblKerroin.Text = eaKerroin().ToString();
    }
    protected void btnMiinusIka_Click(object sender, EventArgs e)
    {
        ika = Int32.Parse(txtIka.Text);
        if (ika > MIN_IKA)
        {
            ika--;
            txtIka.Text = ika.ToString();
            setElakeText(laskeElake());
        }
    }
    protected void btnPlusIka_Click(object sender, EventArgs e)
    {
        ika = Int32.Parse(txtIka.Text);
        if (ika < MAX_IKA)
        {
            ika++;
            txtIka.Text = ika.ToString();
            setElakeText(laskeElake());
        }
    }
    protected void btnMiinusPalkka_Click(object sender, EventArgs e)
    {
        palkka = Int32.Parse(txtPalkka.Text);
        palkka--;
        txtPalkka.Text = palkka.ToString();
        setElakeText(laskeElake());
        lblLaki.Text = lakiPalkka().ToString();
        lblKerroin.Text = eaKerroin().ToString();
    }
    protected void btnPlusPalkka_Click(object sender, EventArgs e)
    {
        palkka = Int32.Parse(txtPalkka.Text);
        palkka++;
        txtPalkka.Text = palkka.ToString();
        setElakeText(laskeElake());
        lblLaki.Text = lakiPalkka().ToString();
        lblKerroin.Text = eaKerroin().ToString();
    }
    protected void btnLisatiedot_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/g2700_elakelisatieto.aspx");
    }
    protected void txtIka_TextChanged(object sender, EventArgs e)
    {
        /*
        ika = Int32.Parse(txtIka.Text);
        lblElake.Text = laskeElake().ToString();
         */
    }
}