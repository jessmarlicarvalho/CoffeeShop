using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

public class Coffee
{
    public string Cname { get; set; }
    public string CoffeeStrength { get; set; }
    public string CoffeeGrind { get; set; }
    public string Origin { get; set; }
    public decimal Price { get; set; }
    public string Description { get; set; }
    public string Image { get; set; }

    public Coffee(int coffeeDetails)
    {
        string conn = @"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C: \Users\Jessi\documents\visual studio 2015\Projects\CoffeeShop\CoffeeShop\App_Data\CoffeeShop.mdf;Integrated Security=True ";

        string NameComm = "SELECT name FROM CoffeeDetails WHERE coffeeID = '" + coffeeDetails + "'";
        string StrengthComm = "SELECT coffeeStrength FROM CoffeeDetails WHERE coffeeID = '" + coffeeDetails + "'";
        string GrindComm = "SELECT coffeeGrind FROM CoffeeDetails WHERE coffeeID = '" + coffeeDetails + "'";
        string OriginComm = "SELECT origin FROM CoffeeDetails WHERE coffeeID = '" + coffeeDetails + "'";
        string CostComm = "SELECT price FROM CoffeeDetails WHERE coffeeID = '" + coffeeDetails + "'";
        string DescriptionComm = "SELECT description FROM CoffeeDetails WHERE coffeeID = '" + coffeeDetails + "'";
        string ImageComm = "SELECT image FROM CoffeeDetails WHERE coffeeID = '" + coffeeDetails + "'";

        SqlConnection SqlConnection = new SqlConnection(conn);

        SqlCommand SqlNameCommand = new SqlCommand(NameComm, SqlConnection);
        SqlCommand SqlStrengthCommand = new SqlCommand(StrengthComm, SqlConnection);
        SqlCommand SqlGrindCommand = new SqlCommand(GrindComm, SqlConnection);
        SqlCommand SqlOriginCommand = new SqlCommand(OriginComm, SqlConnection);
        SqlCommand SqlCostCommand = new SqlCommand(CostComm, SqlConnection);
        SqlCommand SqlDescriptionCommand = new SqlCommand(DescriptionComm, SqlConnection);
        SqlCommand SqlImageCommand = new SqlCommand(ImageComm, SqlConnection);

        SqlConnection.Open();

        this.Cname = Convert.ToString(SqlNameCommand.ExecuteScalar());
        this.CoffeeStrength = Convert.ToString(SqlStrengthCommand.ExecuteScalar());
        this.CoffeeGrind = Convert.ToString(SqlGrindCommand.ExecuteScalar());
        this.Origin = Convert.ToString(SqlOriginCommand.ExecuteScalar());
        this.Price = Convert.ToDecimal(SqlCostCommand.ExecuteScalar());
        this.Description = Convert.ToString(SqlDescriptionCommand.ExecuteScalar());
        this.Image = Convert.ToString(SqlImageCommand.ExecuteScalar());

        SqlConnection.Close();
    }
}

