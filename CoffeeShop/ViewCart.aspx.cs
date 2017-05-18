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
    public partial class ViewCart : System.Web.UI.Page
    {
        //  Cart myCart;
        //Decimal price;
        string s;
        string t;
        string[] a = new string[8];
        int total = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            dt.Columns.AddRange(new DataColumn[9] { new DataColumn("Name"), new DataColumn("Strength"), new DataColumn("Grind"), new DataColumn("Origin"), new DataColumn("Price"), new DataColumn("Desc"), new DataColumn("ImageURL"), new DataColumn("Quantity"), new DataColumn("ProductID") });
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
                               //name            strength          grind           origin          price            desc            image            quantity
                    dt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), a[4].ToString(), a[5].ToString(), a[6].ToString(), a[7].ToString(), i.ToString());

                    total = total + (Convert.ToInt32(a[4].ToString()) * Convert.ToInt32(a[7].ToString()));
                }
            }

            d1.DataSource = dt;
            d1.DataBind();

            l1.Text = "Total Cost: £" + total.ToString();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Session["checkoutbutton"] = "yes";
            Response.Redirect("checkout.aspx");
        }
    }
}