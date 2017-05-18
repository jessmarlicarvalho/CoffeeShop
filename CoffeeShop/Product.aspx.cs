using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;


namespace CoffeeShop
{
    public partial class Product1 : System.Web.UI.Page
    {
        //Cart myCart;
       SqlConnection conn = new SqlConnection(@"Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\Jessi\\documents\\visual studio 2015\\Projects\\CoffeeShop\\CoffeeShop\\App_Data\\CoffeeShop.mdf;Integrated Security=True");
   protected void Page_Load(object sender, EventArgs e)
        {
           
            
        }

        public void FillDataList()
        {

        }

        protected void AddToCart_Click(object sender, EventArgs e)
        {
            var selectedProducts = GridView1.Rows.Cast<GridViewRow>()
        .Where(row => ((CheckBox)row.FindControl("SelectedProducts")).Checked)
        .Select(row => GridView1.DataKeys[row.RowIndex].Value.ToString()).ToList();
            if (Session["Cart"] == null)
            {
                Session["Cart"] = selectedProducts;
            }
            else
            {
                var cart = (List<string>)Session["Cart"];
                foreach (var product in selectedProducts)
                    cart.Add(product);
                Session["Cart"] = cart;
            }
            foreach (GridViewRow row in GridView1.Rows)
            {
                CheckBox cb = (CheckBox)row.FindControl("SelectedProducts");
                if (cb.Checked)
                    cb.Checked = false;
            }
        }
        
    }
}