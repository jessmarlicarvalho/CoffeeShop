using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoffeeShop
{
    public partial class AboutUS : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["New"] != null)
            {
                lblWelcomeUsername.Text += Session["New"].ToString();
            }
            else
            {
                Response.Write("Login.aspx");
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session["New"] = null;
            Response.Redirect("Login.aspx");

        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            if (Session["Cart"] != null)
                Response.Redirect("ViewCart.aspx");
        }
    }

        //protected void btnLogout_Click(object sender, EventArgs e)
        //{

        //}
    
}