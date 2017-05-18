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
    public partial class Display : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Jessi\Documents\Visual Studio 2013\Projects\Management\Management\bin\Debug\CoffeeShopAdmin.mdf;Integrated Security=True;Connect Timeout=30");
        protected void Page_Load(object sender, EventArgs e)
        {
            con.Open();
            SqlCommand comm = con.CreateCommand();
            comm.CommandType = CommandType.Text;
            comm.CommandText = "select * from Products";
            comm.ExecuteNonQuery();
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(comm);
            da.Fill(dt);
            d2.DataSource = dt;
            d2.DataBind();

            con.Close();

            // pagination in datalist
            string conString = ConfigurationManager.ConnectionStrings["CoffeeShopAdminConnectionString"].ConnectionString; // how many values should display on the website 
            string query = "SELECT top 10 * FROM Products WHERE Grind=@Grind or @Grind=''";
            SqlCommand cmd = new SqlCommand(query);
            cmd.Parameters.AddWithValue("@Grind", ddlGrind.SelectedItem.Value);
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    using (DataSet ds = new DataSet())
                    {
                        sda.Fill(ds);
                        d2.DataSource = ds;
                        d2.DataBind();
                    }
                }
            }

            if (!IsPostBack)
            {
                CurrentPageIndex = 0;
                showData();
            }
        }

        int pg = 0;

        void showData()
        {
            PagedDataSource pgd = new PagedDataSource();
            SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Products",
               @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\Jessi\Documents\Visual Studio 2013\Projects\Management\Management\bin\Debug\CoffeeShopAdmin.mdf;Integrated Security=True;Connect Timeout=30");
            DataSet ds = new DataSet();
            da.Fill(ds);

            pgd.DataSource = ds.Tables[0].DefaultView;
            pgd.CurrentPageIndex = CurrentPageIndex;
            pgd.AllowPaging = true; // to allow to view paging buttons  
            pgd.PageSize = 6; // this will display 10 records on the page

            lnkbtnPrevious.Enabled = !(pgd.IsLastPage); // linking the hyperlink
            lnkbtnNext.Enabled = !(pgd.IsFirstPage);

            d2.DataSource = pgd;
            d2.DataBind();
        }

        protected void d2_EditCommand(object source, DataListCommandEventArgs e)
        {
            d2.EditItemIndex = e.Item.ItemIndex;
            showData();
        }

        protected void d2_CancelCommand(object source, DataListCommandEventArgs e)
        {
            d2.EditItemIndex = -1;
            showData();
        }

        public int CurrentPageIndex
        {
            get
            {
                if (ViewState["pg"] == null)
                    return 0;
                else
                    return Convert.ToInt16(ViewState["pg"]);
            }
            set
            {
                ViewState["pg"] = value;
            }
        }

        protected void lnkbtnPrevious_Click(object sender, EventArgs e)
        {
            CurrentPageIndex++;
            showData();
        }

        protected void lnkbtnNext_Click(object sender, EventArgs e)
        {
            CurrentPageIndex--;
            showData();
        }
    }
}