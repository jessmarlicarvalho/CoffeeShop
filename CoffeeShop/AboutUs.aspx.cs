using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CoffeeShop
{
    public partial class AboutUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                NewMethod();
            }
        }

        //protected void Timer1_Tick(object sender, EventArgs e)
        //{
        //    SetImageURL();
        //}

        private void SetImageURL()
        {
            NewMethod();
        }

        private void NewMethod()
        {
            Random _rand = new Random();
            int i = _rand.Next(1, 3);
            Image1.ImageUrl = "~/Slideshow/" + i.ToString() + ".jpg";
        }

        protected void Timer1_Tick1(object sender, EventArgs e)
        {
            NewMethod();
        }

        //protected void AdRotator1_AdCreated(object sender, AdCreatedEventArgs e)
        //{

        //}
    }
    }
