using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_sleepdiary : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginState"] == null)
        {
            Response.Redirect("~/Pages/landingpage.aspx");
        }

    }


    public void insert()
    {
        vitalusEntities objvt = new vitalusEntities();
        Sleepdiary sd = new Sleepdiary();
        try
        {
            sd.Login_id = Convert.ToInt16(Session["LoginId"].ToString());
            sd.Night = Convert.ToInt32(night.SelectedValue);
            sd.DateStart = Convert.ToDateTime(datestart.Value);
            sd.Prescription = prescription.SelectedValue;
            sd.beverages = beverages.Value;
            sd.caffeinated = caffeinated.Value;
            //sd.turnofftime
            sd.sleephours =  Convert.ToInt32( sleephour.Value);
            sd.sleepminutes = Convert.ToInt32(sleepmin.Value);
            sd.wokeup = wokeup.Value;
            sd.totaltime = totaltime.Value;
            sd.turnofftime =TimeSpan.Parse(turnofftime.Value);
            sd.totalsleephours = Convert.ToInt32(totalsleephours.Value);
            sd.totalsleepmin = Convert.ToInt32(totalsleepmin.Value);
            objvt.Sleepdiaries.Add(sd);
            objvt.SaveChanges();

            string script3 = "alert('Successfully Submited!');";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script3, true);
        }
        catch(Exception e)
        {
            string script3 = "alert('All Fields Are Mandatory');";
            ScriptManager.RegisterStartupScript(this, GetType(),
                                  "ServerControlScript", script3, true);
        }
        
       









    }


    protected void submit_Click(object sender, EventArgs e)
    {
        insert();
        
            //using (vitalusEntities objvt = new vitalusEntities())
            //{
            //    var data = from q in objvt.logins select q;
            //    productGridView.DataSource = data.ToList();
            //    productGridView.DataBind();
            //}

       
        
    }

    
}