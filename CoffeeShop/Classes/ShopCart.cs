using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

public class ShoppingCart
{
    public List<ShopItem> Items { get; private set; } // the main autumn tribute losing this is the list items of  Shopping requirements from ShopItem.cs
    public static readonly ShoppingCart Instance; // this is the attribute instance of the shopping cart 

    static ShoppingCart() // this is a collection class 
    {
        if (HttpContext.Current.Session["SharpShopingCart"] == null)
        {
            Instance = new ShoppingCart();
            Instance.Items = new List<ShopItem>();
            HttpContext.Current.Session["SharpShoppingCart"] = Instance;
        }
        else
        {
            Instance = (ShoppingCart)HttpContext.Current.Session["SharpShopingCart"];
        }
    }


    protected ShoppingCart() { }

    // Adding items methods

    public void AddItem(int CoffeeID) // this is the method which is uses a parameter of the coffee
    {
        ShopItem newItem = new ShopItem(CoffeeID);

        if (Items.Contains(newItem))
        {
            foreach (ShopItem items in Items)
            {
                if (items.Equals(newItem))
                {
                    items.quantity++;
                    return;
                }
            }
        }
        else
        {
            newItem.quantity = 1;
            Items.Add(newItem);
        }
    }
    public void SetItemQuantity(int CoffeeID, int quantity)
    {
        if (quantity == 0)
        {
            RemoveItem(CoffeeID);
            return;
        }

        ShopItem updateItem = new ShopItem(CoffeeID);

        foreach (ShopItem item in Items)
        {
            if (item.Equals(updateItem))
            {
                item.quantity = quantity;
                return;
            }
        }
    }

    public void RemoveItem(int CoffeeID)
    {
        ShopItem removedItem = new ShopItem(CoffeeID);
        Items.Remove(removedItem);
    }

    public decimal GetSubTotal()
    {
        decimal subTotal = 0;
        foreach (ShopItem item in Items)
        {
            subTotal += item.TotalPrice;
        }

        return subTotal;
    }
}
