using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace CoffeeShop
{
    public class DataAccess
    {
        private static string myConnectionString;

        static DataAccess()
        {
           myConnectionString =  WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        }

        public static DataTable selectQuery(string query)
        {
            DataTable dt = new DataTable();
           SqlConnection conn = new SqlConnection(myConnectionString);
            conn.Open();
            SqlCommand comm = new SqlCommand(query, conn);
            dt.Load(comm.ExecuteReader());
            conn.Close();
            return dt;
        }

    }
}