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
	public partial class Catalog : System.Web.UI.Page
	{
		SqlConnection con;
		SqlCommand cmd;
		SqlDataAdapter sda;
		DataTable dt;
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				{
					getCatalogies();
					getSerial();
				}
			}
		}

		private void getCatalogies()
		{
			con = new SqlConnection(Connection.GetConnectionString());
			cmd = new SqlCommand("Catalog_Crud", con);
			cmd.Parameters.AddWithValue("@Action", "ACTIVECAT");
			cmd.CommandType = CommandType.StoredProcedure;
			sda = new SqlDataAdapter(cmd);
			dt = new DataTable();
			sda.Fill(dt);

			//rCatalog.DataSource = dt;
			//rCatalog.DataBind();
		}

		public void getSerial()
		{
			con = new SqlConnection(Connection.GetConnectionString());
			cmd = new SqlCommand("Serial_Crud", con);
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.AddWithValue("@Action", "ACTIVEPROD");

			con.Open();
			sda = new SqlDataAdapter(cmd);
			dt = new DataTable();
			sda.Fill(dt);



			rSerial.DataSource = dt;
			rSerial.DataBind();
		}

		public void rSerial_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			if (Session["idUser"] != null)
			{
				bool isFavoriteItemUpdated = false;
				int i = itItemExistInFavorite(Convert.ToInt32(e.CommandArgument));
				if (i == 0)
				{
					//new
					con = new SqlConnection(Connection.GetConnectionString());
					cmd = new SqlCommand("Favorite_Crud", con);
					cmd.Parameters.AddWithValue("@Action", "INSERT");
					cmd.Parameters.AddWithValue("@FK_id_Serial", e.CommandArgument);
					cmd.Parameters.AddWithValue("@FK_id_User", Session["idUser"]);
					cmd.CommandType = CommandType.StoredProcedure;
					try
					{
						con.Open();
						cmd.ExecuteNonQuery();
					}
					catch(Exception ex)
					{
						Response.Write("<script>alter('Error - " + ex.Message + " ');<script>");
					}
					finally
					{
						con.Close();
					}
				}
				else
				{
					//add
					Utils utils = new Utils();
					isFavoriteItemUpdated = utils.updateFavorite(Convert.ToInt32(e.CommandArgument), Convert.ToInt32(Session["idUser"]));

				}
				lblMsg.Visible = false;
				lblMsg.Text = "The series has been successfully added to your favorites list";
				lblMsg.CssClass = "alter alter-success";
				Response.AddHeader("REFRESH", "1;URL=Favorites.aspx");

			}
			else
			{
				Response.Redirect("Login.aspx");
			}
		}

		int itItemExistInFavorite(int serialId)
		{
			con = new SqlConnection(Connection.GetConnectionString());
			cmd = new SqlCommand("Favorite_Crud", con);
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.AddWithValue("@Action", "GETBYID");
			cmd.Parameters.AddWithValue("@FK_id_Serial", serialId);
			cmd.Parameters.AddWithValue("@FK_id_User", Session["idUser"]);
			con.Open();
			sda = new SqlDataAdapter(cmd);
			dt = new DataTable();
			sda.Fill(dt);

			return dt.Rows.Count;


		}

	}
}