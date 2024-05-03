using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace DemoShowcase.User
{

	public partial class Profile : System.Web.UI.Page
	{
		SqlConnection con;
		SqlCommand cmd;
		SqlDataAdapter sda;
		DataTable dt;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Session["id_User"] != null)
				{
					Response.Redirect("Login.aspx");
				}
				else
				{
					getUserDetails();
				}
			}
		}

		void getUserDetails()
		{
			con = new SqlConnection(Connection.GetConnectionString());
			cmd = new SqlCommand("User_Crud", con);
			cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
			cmd.Parameters.AddWithValue("@id_User", Session["idUser"]);
			cmd.CommandType = CommandType.StoredProcedure;
			sda = new SqlDataAdapter(cmd);
			dt = new DataTable();
			sda.Fill(dt);
			rUserProfile.DataSource = dt;
			rUserProfile.DataBind();
			if (dt.Rows.Count == 1)
			{
				Session["fullname"] = dt.Rows[0]["Full_name"].ToString();
				Session["login"] = dt.Rows[0]["Login"].ToString();
				Session["email"] = dt.Rows[0]["Email"].ToString();
				Session["imageUrl"] = dt.Rows[0]["ImageUrl"].ToString();

				Session["createDate"] = dt.Rows[0]["CreateDate"].ToString();

			}
		}
	}
}