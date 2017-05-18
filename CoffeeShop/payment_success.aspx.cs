using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace CoffeeShop
{
    public partial class payment_success : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Jessi\Documents\Visual Studio 2013\Projects\Management\Management\bin\Debug\CoffeeShopAdmin.mdf;Integrated Security=True;Connect Timeout=30");
        string order = "";
        string order_id;
        string s;
        string t;
        string[] a = new string[8];

        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            order = Request.QueryString["order"].ToString();

            if (order == Session["order_no"].ToString())
            {
                //this is for getting user details and storing it on order_details table
                SqlCommand comm = con.CreateCommand();
                comm.CommandType = CommandType.Text;
                comm.CommandText = "SELECT * FROM Registration WHERE Username ='" + Session["Username"].ToString() + "'";
                comm.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(comm);
                da.Fill(dt);
                foreach (DataRow dr in dt.Rows)
                {
                    SqlCommand comm1 = con.CreateCommand();
                    comm1.CommandType = CommandType.Text;
                    comm1.CommandText = "INSERT INTO Orders values('" + dr["FirstName"] + "','" + dr["LastName"] + "', '" + dr["Email"] + "', '" + dr["Address"] + "','" + dr["Postcode"] + "', '" + dr["Telephone"] + "')";
                    comm1.ExecuteNonQuery();
                }

                //end storing user details
                //now we are going to get orders id from orders table

                SqlCommand comm2 = con.CreateCommand();
                comm2.CommandType = CommandType.Text;
                comm2.CommandText = "SELECT top 1 * FROM Orders WHERE Username='" + Session["Username"] + "' Orders by OrderID desc";
                comm2.ExecuteNonQuery();
                DataTable dt2 = new DataTable();
                SqlDataAdapter da2 = new SqlDataAdapter(comm2);
                da2.Fill(dt2);
                foreach (DataRow dr2 in dt2.Rows)
                {
                    order_id = dr2["OrderID"].ToString();
                }
                //ending of getting order id

                //this is for getting ordered items from cookies

                if (Request.Cookies["aa"] != null)
                {
                    s = Convert.ToString(Request.Cookies["aa"].Value);
                    string[] strArr = s.Split('|');
                    for (int i = 0; i < strArr.Length; i++)
                    {
                        t = Convert.ToString(strArr[i].ToString());
                        string[] strArr1 = t.Split(',');
                        for (int j = 0; j < strArr1.Length; j++)
                        {
                            a[j] = strArr1[j].ToString();
                        }

                        SqlCommand comm3 = con.CreateCommand();
                        comm3.CommandType = CommandType.Text;
                        comm3.CommandText = "INSERT INTO OrderDetails values('" + order_id.ToString() + "', '" + a[0].ToString() + "','" + a[1].ToString() + "','" + a[2].ToString() + "','" + a[3].ToString() + "','" + a[4].ToString() + "')";
                        comm3.ExecuteNonQuery();
                    }
                }
                //end of getting items from cookie
            }
            else
            {
                Response.Redirect("Login.aspx");
            }

            con.Close();

            Session["Username"] = "";
            Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);

            Response.Redirect("Home.aspx");
        }
    }
}