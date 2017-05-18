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
    public partial class ViewCoffeeDetails : System.Web.UI.Page
    {

        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Jessi\Documents\Visual Studio 2013\Projects\Management\Management\bin\Debug\CoffeeShopAdmin.mdf;Integrated Security=True;Connect Timeout=30");

        int id;

        //string s;
        //string t;
        //string[] a = new string[9];

        string name, strength, grind, origin, price, desc, image, qty;

        int quantity;

        //protected void lnkbtnViewCart_Click(object sender, EventArgs e)
        //{
        //    DataTable dt = new DataTable();
        //    dt.Columns.AddRange(new DataColumn[9] { new DataColumn("Name"), new DataColumn("CoffeeStrength"), new DataColumn("CoffeeGrind"), new DataColumn("Origin"), new DataColumn("Description"), new DataColumn("Price"), new DataColumn("Image"), new DataColumn("Quantity"), new DataColumn("CoffeeID") });
        //    if (Request.Cookies["aa"] != null)
        //    {
        //        s = Convert.ToString(Request.Cookies["aa"].Value);

        //        string[] strArr = s.Split('|');

        //        for (int i = 0; i < strArr.Length; i++)
        //        {
        //            t = Convert.ToString(strArr[i].ToString());
        //            string[] strArr1 = t.Split(',');
        //            for (int j = 0; j < strArr1.Length; j++)
        //            {
        //                a[j] = strArr1[j].ToString();
        //            }
        //            dt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), a[4].ToString(), a[5].ToString(), a[6].ToString(), a[7].ToString(), i.ToString());
        //        }
        //    }
        //    d1.DataSource = dt;
        //    d1.DataBind();
        //}

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("ViewCart.aspx");
            }
            else
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString()); //  "id" is a varible which means when a customer selects the image it will display image id 

                con.Open();

                SqlCommand comm = con.CreateCommand();
                comm.CommandType = CommandType.Text;
                comm.CommandText = "select * from Products where ProductID =" + id + "";
                comm.ExecuteNonQuery();
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(comm);
                da.Fill(dt);
                d1.DataSource = dt;
                d1.DataBind();

                con.Close();
            }

            quantity = get_qty(id);
            if(quantity == 0)
            {
                lblTitleCart.Visible = false;
                txtQuantity.Visible = false;
                btnAddToCart.Visible = false;

                Response.Write("<script>alert('This item is no longer available. Press Ok button to continue.');</script>");
         
                L1.Text = "No Stock!";
            }
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if(con.State == ConnectionState.Open)
            {
               con.Close();
            }

            con.Open();
            SqlCommand comm = con.CreateCommand();
            comm.CommandType = CommandType.Text;
            comm.CommandText = "select * from Products where ProductID =" + id + "";
            comm.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(comm);
            da.Fill(dt);
            foreach (DataRow dr in dt.Rows)
            {
                name = dr["Name"].ToString();
                strength = dr["Strength"].ToString();
                grind = dr["Grind"].ToString();
                origin = dr["Origin"].ToString();
                price = dr["Price"].ToString();
                desc = dr["Desc"].ToString();
                image = dr["ImageURL"].ToString();
                qty = dr["Quantity"].ToString();
            }

            //if textbox is enter quantity is greater than available quantity then give a masseage error
            if (Convert.ToInt32(txtQuantity.Text) > Convert.ToInt32(qty))
            {
               // L1.Text = "Very Low Stock! Please enter lower quantity.";
                Response.Write("<script>alert('Very Low Stock!');</script>");
               // Response.Write())
                
            }
            else
            { // if customer enters the right quantity level then this label is visible
                L1.Text = "";

                if (Request.Cookies["aa"] == null) // inside these cooking 
                {
                    Response.Cookies["aa"].Value = name.ToString() + "," + strength.ToString() + "," + grind.ToString() + "," + origin.ToString() + "," + price.ToString() + "," + desc.ToString() + "," + image.ToString() + "," + qty.ToString();
                    Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);
                }
                else
                {
                    Response.Cookies["aa"].Value = Request.Cookies["aa"].Value + "|" + name.ToString() + "," + strength.ToString() + "," + grind.ToString() + "," + origin.ToString() + "," + price.ToString() + "," + desc.ToString() + "," + image.ToString() + "," + qty.ToString(); 
                    Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);
                }
                // reduceS the stock in the website such as if the product display five items and customer takes three items then the web will update the changes and display two items available
                SqlCommand comm1 = con.CreateCommand();
                comm1.CommandType = CommandType.Text;
                comm1.CommandText = "UPDATE Products SET Quantity = Quantity - " + txtQuantity.Text + "WHERE ProductID = "+id; // updating the quantity level from the database 
                comm1.ExecuteNonQuery();
                Response.Redirect("ViewCoffeeDetails.aspx?id=" + id.ToString()); // the page will refresh automaticlly when the customer press the button
            }
        }

        public int get_qty(int id)
        {
            con.Open();

            SqlCommand comm = con.CreateCommand();
            comm.CommandType = CommandType.Text;
            comm.CommandText = "SELECT * FROM Products WHERE ProductID =" + id + "";
            comm.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(comm);
            da.Fill(dt);

            foreach (DataRow dr in dt.Rows) 
            {
                quantity = Convert.ToInt32(dr["Quantity"].ToString()); // declaring quantity) 
            }

            return quantity;
        }
    }
}