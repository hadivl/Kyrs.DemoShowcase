using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;

namespace DemoShowcase
{
	public class Connection
	{


		public static string GetConnectionString()
		{
			return ConfigurationManager.ConnectionStrings["cs"].ConnectionString;
		}
	}

	public class Utils
	{

		SqlConnection con;
		SqlCommand cmd;
		SqlDataAdapter sda;
		DataTable dt;
		public static bool IsValidExtension(string fileName)
		{
			bool isValid = false;
			string[] fileExtension = { ".jpg", ".png", ".jped" };
			for (int i = 0; i <= fileExtension.Length - 1; i++)
			{
				if (fileName.Contains(fileExtension[i]))
				{
					isValid = true;
					break;
				}
			}
			return isValid;
		}
		public static string GetImageUrl(object url)
		{
			string imageUrl = "";

			if (url == DBNull.Value || url == null || string.IsNullOrEmpty(url.ToString()))
			{
				imageUrl = "../Images/No_image.png";
			}
			else
			{
				imageUrl = string.Format("../{0}", url);
			}

			return imageUrl;
		}

		public bool updateFavorite(int serialId, int userId)
		{
			bool isFavorite = false;
			con = new SqlConnection(Connection.GetConnectionString());
			cmd = new SqlCommand("Favorite_Crud", con);
			cmd.Parameters.AddWithValue("@Action", "UPDATE");
			cmd.Parameters.AddWithValue("@FK_id_Serial", serialId);
			cmd.Parameters.AddWithValue("@FK_id_User", userId);
			cmd.CommandType = CommandType.StoredProcedure;
			try
			{
				con.Open();
				cmd.ExecuteNonQuery();
				isFavorite = true;
			}
			catch (Exception ex)
			{
				isFavorite= false;
				System.Web.HttpContext.Current.Response.Write("<script>alter('Error - " + ex.Message + " ');<script>");
			}
			finally
			{
				con.Close();
			}
			return isFavorite;
		}
		//public bool removeFromFavorites(int serialId, int userId)
		//{
		//	// Логика удаления сериала из списка избранных
		//	// Например, удаление записи из базы данных или из хранилища

		//	// Вернуть true при успешном удалении
		//	return true; // или false, в зависимости от реализации
		//}

	}
}