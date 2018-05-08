using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Selectform : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginState"] == null)
        {
            Response.Redirect("~/Pages/landingpage.aspx");
        }

    }


    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        Response.Redirect("questionnaire.aspx");
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        Response.Redirect("sleepdiary.aspx");
    }
}