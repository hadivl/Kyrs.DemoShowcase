using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoShowcase.User
{
	public partial class Login : System.Web.UI.Page
	{

		SqlConnection con;
		SqlCommand cmd;
		SqlDataAdapter sda;
		DataTable dt;
		public void Page_Load(object sender, EventArgs e)
		{
			if (Session["idUser"] != null)
			{
				Response.Redirect("Default.aspx");
			}
		}

        public void btnLogin_Click(object sender, EventArgs e)
        {
			if (txtLogin.Text.Trim() == "HadiVL" && txtPassword.Text.Trim() == "123vl")
			{
				Session["admin"] = txtLogin.Text.Trim();
				Response.Redirect("../Admin/Dashboard.aspx");

			}
			else
			{
				con = new SqlConnection(Connection.GetConnectionString());
				cmd = new SqlCommand("User_Crud", con);
				cmd.Parameters.AddWithValue("@Action", "SELECT4LOGIN");
				cmd.Parameters.AddWithValue("@Login", txtLogin.Text.Trim());
				cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
				cmd.CommandType = CommandType.StoredProcedure;
				sda = new SqlDataAdapter(cmd);
				dt = new DataTable();
				sda.Fill(dt);

				if(dt.Rows.Count == 1)
				{
					Session["login"]=txtLogin.Text.Trim();
					Session["idUser"] = dt.Rows[0]["id_User"];
					Response.Redirect("Default.aspx");
				}
				else
				{
					lblMsg.Visible = true;
					lblMsg.Text = "Invalid Credentials...!";
					lblMsg.CssClass = "alert alert-danger";
				}
			}
        }
    }
}