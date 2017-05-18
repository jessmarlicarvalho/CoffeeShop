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
    public partial class delete_cart : System.Web.UI.Page
    {
        string s;
        string t;
        string[] a = new string[8];
        int id;
        string name, strength, grind, origin, price, desc, image, quanty;
        int count = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            DataTable dt = new DataTable();
            dt.Rows.Clear();

            dt.Columns.AddRange(new DataColumn[9] { new DataColumn("Name"), new DataColumn("CoffeeStrength"), new DataColumn("CoffeeGrind"), new DataColumn("Origin"), new DataColumn("Price"), new DataColumn("Description"), new DataColumn("Image"), new DataColumn("Quantity"), new DataColumn("CoffeeID") });
           if(Request.Cookies["aa"] != null)
            {
                s = Convert.ToString(Request.Cookies["aa"].Value);
                string[] strArr = s.Split('|');
                for(int i = 0; i < strArr.Length; i++)
                {
                    t = Convert.ToString(strArr[i].ToString());
                    string[] strArr1 = t.Split(',');
                    for(int j = 0; j < strArr1.Length; j++)
                    {
                        a[j] = strArr1.ToString();
                    }
                    dt.Rows.Add(a[0].ToString(), a[1].ToString(), a[2].ToString(), a[3].ToString(), a[4].ToString(), a[5].ToString(), a[6].ToString(), a[7].ToString(), i.ToString());
                }
            }

            dt.Rows.RemoveAt(id); 

            Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);
            Response.Cookies["aa"].Expires = DateTime.Now.AddDays(-1);

            foreach(DataRow dr in dt.Rows)
            {
                name = dr["Name"].ToString();
                strength = dr["CoffeeStrength"].ToString();
                grind = dr["CoffeeGrind"].ToString();
                origin = dr["Origin"].ToString();
                price = dr["Price"].ToString();
                desc = dr["Description"].ToString();
                image = dr["Image"].ToString();
                quanty = dr["Quantity"].ToString(); 

                count = count + 1;
                if(count == 1)
                {
                    Response.Cookies["aa"].Value = name.ToString() + "," + strength.ToString() + "," + grind.ToString() + "," + origin.ToString() + "," + price.ToString() + "," + desc.ToString() + "," + image.ToString() + "," + quanty.ToString();
                    Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);
                }
                else
                {
                    Response.Cookies["aa"].Value = Request.Cookies["aa"].Value + "|" + name.ToString() + "," + strength.ToString() + "," + grind.ToString() + "," + origin.ToString() + "," + price.ToString() + "," + desc.ToString() + "," + image.ToString() + "," + quanty.ToString();
                    Response.Cookies["aa"].Expires = DateTime.Now.AddDays(1);
                }
            }

            Response.Redirect("ViewCart.aspx");
        }
    }
}