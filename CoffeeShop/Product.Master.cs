using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoffeeShop
{
    public partial class Product : System.Web.UI.MasterPage
    {
            string s;
            string t;
            string[] a = new string[8];
            int total = 0;
            int totalCount = 0;

            protected void Page_Load(object sender, EventArgs e)
            {
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

                        total = total + (Convert.ToInt32(a[4].ToString()) * Convert.ToInt32(a[7].ToString()));
                        totalCount = totalCount + 1;

                        CartTotalItem.Text = totalCount.ToString();
                        CartTotalPrice.Text = total.ToString();
                    }
                }
            }
        }
    }
