using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace CoffeeShop
{
    public partial class OrderSummary : System.Web.UI.Page
    {
        protected string strOrderID = HttpContext.Current.Request.QueryString["OrderID"].ToString();
        protected double strTotal = 0;
        protected double strSumTotal = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

    }
}