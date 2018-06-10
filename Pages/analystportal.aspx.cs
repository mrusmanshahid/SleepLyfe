using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_analystportal : System.Web.UI.Page
{
    vitalusEntities context = new vitalusEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["LoginState"] == null)
        {
            Response.Redirect("~/Pages/landingpage.aspx");
        }
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {

    }

    protected void btnCreateLogin_Click(object sender, EventArgs e)
    {
        var obj = new login();
        obj.Username = txtUsername.Text.Trim();
        obj.Password = txtPassword.Text.Trim();
        obj.Type = "user";
        context.logins.Add(obj);
        context.SaveChanges();
        Response.Write("<script>alert('Successfully Created!');</script>");
    }
}