using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Pages_landingpage : System.Web.UI.Page
{
    vitalusEntities context = new vitalusEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null && Session["User"].ToString() == "Admin")
        {
            Response.Redirect("/Pages/Selectform.aspx");
        }
        else if (Session["User"] != null && Session["User"].ToString() == "Analyst")
        {
            Response.Redirect("/Pages/analystportal.aspx");
        }

    }


    public void abc(object sender, EventArgs e)
    {



    }



    protected void Unnamed_Click(object sender, EventArgs e)
    {

    }

    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        var obj = context.logins.FirstOrDefault(x => x.Username == analystn.Text.Trim() && x.Password == analystp.Text.Trim() && x.Type == "admin");
        if (obj != null)
        {
            Session["UserId"] = obj.Username;
            Session["LoginState"] = "true";
            Session["User"] = "Analyst";
            Session["LoginId"] = obj.LoginID;
            Response.Redirect("/Pages/analystportal.aspx");
        }
        else
        {
            pas.Visible = true;
        }


    }

    protected void Unnamed_Click2(object sender, EventArgs e)
    {
        var obj = context.logins.FirstOrDefault(x => x.Username == username.Text.Trim() && x.Password == password.Text.Trim() && x.Type == "user");
        if (obj != null)
        {
            Session["UserId"] = obj.Username;
            Session["LoginState"] = "true";
            Session["User"] = "Admin";
            Session["LoginId"] = obj.LoginID;
            Response.Redirect("/Pages/Selectform.aspx");
        }
        else
        {
            Response.Write("<script>alert('Invalid username or password');</script>");
        }




    }
}