using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

namespace CoffeeShop
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Jessi\Documents\Visual Studio 2013\Projects\Management\Management\bin\Debug\CoffeeShopAdmin.mdf;Integrated Security=True;Connect Timeout=30");
        int tot = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            con.Open();

            SqlCommand comm = con.CreateCommand();
            comm.CommandType = CommandType.Text;
            comm.CommandText = "SELECT * FROM Registration WHERE Username = '" + txtUsername.Text + "' and Password = '" + txtPassword.Text + "'";
            comm.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(comm);
            da.Fill(dt);
            tot = Convert.ToInt32(dt.Rows.Count.ToString());

            if(tot > 0)
            {
                if(Session["checkoutbutton"] == "yes")
                {
                    Session["Username"] = txtUsername.Text;
                    Response.Redirect("UpdateOrderDetails.aspx");
                }
                else
                {
                    Session["Username"] = txtUsername.Text;
                    Response.Redirect("UpdateOrderDetails.aspx");
                }
            }
            else
            {
                Label1.Text = "Invalid Username and password";
            }

            con.Close();
        }
    }
 }
