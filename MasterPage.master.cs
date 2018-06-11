using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    List<menuItem> menuitemlst = new List<menuItem>();

    protected void Page_Load(object sender, EventArgs e)
    {
        string _user = Session["User"] == null ? "" : Session["User"].ToString();

        menuitemlst.Add(new menuItem("Home", "/Pages/Selectform.aspx", "Admin"));
        menuitemlst.Add(new menuItem("Home", "/Pages/analystportal.aspx", "Analyst"));
        menuitemlst.Add(new menuItem("EDF Analysis", "/Pages/EDFViewer.aspx", "Analyst"));

        rptMenuItem.DataSource = menuitemlst.Where(x => x.user == _user).ToList();
        rptMenuItem.DataBind();

    }
    private void logout()
    {
        Session.Clear();
        Response.Redirect("/Pages/analystportal.aspx");
    }

    protected void lgout_Click(object sender, EventArgs e)
    {
        logout();
    }
}




public class menuItem
{
    public menuItem(string menuName, string menuAdd, string usr)
    {
        menuItemName = menuName;
        menuItemAddress = menuAdd;
        user = usr;
    }
    public string menuItemName { get; set; }

    public string menuItemAddress { get; set; }

    public string user { get; set; }
}
