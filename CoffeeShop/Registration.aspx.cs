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
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int userid = 0;
            string condtring = ConfigurationManager.ConnectionStrings["ConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(condtring))
            {
                using (SqlCommand comm = new SqlCommand("Register_User", con))
                {
                    using (SqlDataAdapter data = new SqlDataAdapter())
                    {
                        comm.CommandType = CommandType.StoredProcedure;
                        comm.Parameters.AddWithValue("@Username", txtUsername.Text.Trim());
                        comm.Parameters.AddWithValue("@email", txtEmail.Text.Trim());
                        comm.Parameters.AddWithValue("@password", txtRPassword.Text.Trim());

                        comm.Parameters.AddWithValue("@Address", txtAddress.Text.Trim());
                        comm.Parameters.AddWithValue("@Telephone", txtTelephone.Text.Trim());
                        comm.Parameters.AddWithValue("@FirstName", txtFirstName.Text.Trim());
                        comm.Parameters.AddWithValue("@LastName", txtLastName.Text.Trim());
                     

                        con.Open();
                        userid = Convert.ToInt32(comm.ExecuteScalar());
                        con.Close();
                    }

                }
            }
            string msg=string.Empty;
            switch (userid)
            {
                case -1:msg = "username already exist";
                    break;
                case -2: msg = "email already exist";
                    break;
                default:msg = "successful";
                    Response.Redirect("Login.aspx");
                    break;
            }
            ClientScript.RegisterStartupScript(GetType(),"alert","alert('"+msg+"');",true);
    }
        }
    }



