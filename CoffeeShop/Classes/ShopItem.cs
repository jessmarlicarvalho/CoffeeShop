using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

    public class ShopItem: IEquatable<ShopItem>
    {
        public int quantity { get; set; }
        private int _itemID;

        public int ItemID
        {
            get { return _itemID; }
            set { _itemID = value; }
        }

        private Coffee _coffee = null;
        public Coffee Coffee
        {
            get
            {
                if (_coffee == null)
                {
                    _coffee = new Coffee(ItemID);
                }
                return _coffee;
            }
        }

        public string Cname
        {
            get { return Coffee.Cname; }
        }

        public string CoffeeStrength
        {
            get { return Coffee.CoffeeStrength; }
        }

        public string CoffeeGrind
        {
            get { return Coffee.CoffeeGrind; }
        }

        public string Origin
        {
            get { return Coffee.Origin; }
        }

        public decimal Price
        {
            get { return Coffee.Price; }
        }
        public string Description
        {
            get { return Coffee.Description; }
        }
        public string Image
        {
            get { return Coffee.Image; }
        }

        public decimal TotalPrice
        {
            get { return Price * quantity; }
        }

        public ShopItem(int CoffeeID)
        {
            this.ItemID = CoffeeID;
        }

        public bool Equals(ShopItem coffee)
        {
            return coffee.ItemID == this.ItemID;
        }
    }






