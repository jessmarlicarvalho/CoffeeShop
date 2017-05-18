using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace CoffeeShop
{
    public partial class UpdateOrderDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\Jessi\Documents\Visual Studio 2015\Projects\CoffeeShop\CoffeeShop\App_Data\CoffeeShop.mdf;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        { 
            if(IsPostBack)
            {
                return;
            }

            con.Open();
            SqlCommand comm = con.CreateCommand();
            comm.CommandType = CommandType.Text;
            comm.CommandText = "SELECT * FROM Registration WHERE Username ='" + Session["Username"].ToString() + "'";
            comm.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(comm);
            da.Fill(dt);
            foreach(DataRow dr in dt.Rows)
            {
                txtFristName.Text = dr["firstName"].ToString();
                txtLastName.Text = dr["lastName"].ToString();
                txtAddress.Text = dr["Address"].ToString();
                txtTelephone.Text = dr["Telephone"].ToString();
            }



            con.Close();
        }

        protected void b1_Click(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand comm = con.CreateCommand();
            comm.CommandType = CommandType.Text;
            comm.CommandText = "UPDATE Registration SET firstName='"+txtFristName.Text+ "', lastName='" + txtLastName.Text + "', Address='" + txtAddress.Text + "' WHERE Username ='" + Session["Username"].ToString() + "'";
            comm.ExecuteNonQuery();
            con.Close();

            Response.Redirect("Payment.aspx");
        }
    }
}