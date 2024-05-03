using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI;

namespace DemoShowcase.User
{
	public partial class Favorites : System.Web.UI.Page
	{
		SqlConnection con;
		SqlCommand cmd;
		SqlDataAdapter sda;
		DataTable dt;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Session["idUser"] == null)
				{
					Response.Redirect("Login.aspx");
				}
				else
				{
					getFavoriteItem();
				}
			}
		}


		void getFavoriteItem()
		{
			con = new SqlConnection(Connection.GetConnectionString());
			cmd = new SqlCommand("Favorite_Crud", con);
			cmd.Parameters.AddWithValue("@Action", "SELECT");
			cmd.Parameters.AddWithValue("@FK_id_User", Session["idUser"]);
			cmd.CommandType = CommandType.StoredProcedure;

			sda = new SqlDataAdapter(cmd);
			dt = new DataTable();
			sda.Fill(dt);
			rFavoritItem.DataSource = dt;
			if (dt.Rows.Count == 0)
			{
				rFavoritItem.FooterTemplate = null;
				rFavoritItem.FooterTemplate = new CustomTemplate(ListItemType.Footer);
			}
			rFavoritItem.DataBind();

		}



		protected void rFavoritItem_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			// Обработка события при необходимости
		}

		protected void rFavoritItem_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{
			// Дополнительное преобразование данных, если требуется
		}

		private sealed class CustomTemplate : ITemplate
		{
			private ListItemType ListItemType { get; set; }
			public CustomTemplate(ListItemType type)
			{
				ListItemType = type;
			}

			public void InstantiateIn(Control container)
			{
				if(ListItemType == ListItemType.Footer)
				{
					var footer = new LiteralControl("<tr><td colspan='5'><b>Text</b><a href='CatalogSerial.aspx' class='badge badge-info ml2'>Вернуться на страницу каталога</a></td></tr></tbody></table>");
					container.Controls.Add(footer);
				}
			}
		}
	}
}
