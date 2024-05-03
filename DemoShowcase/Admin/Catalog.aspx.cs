using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace DemoShowcase.Admin
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
				Session["breadCrum"] = "Catalog";
				//НУЖНО ДОБАВИТЬ БУДЕТ ПОТОМ ДЛЯ ОСТАЛЬНЫХ
				if (Session["admin"] == null)
				{
					Response.Redirect("../User/Login.aspx");
				}
				else
				{
					getCatalogies();
				}
				
			}
			lblMsg.Visible = false;
		}

		//protected void btnAddOrUpdate_Click(object sender, EventArgs e)
		//{
		//	string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
		//	string ageRestriction = txtAgeR.Text.Trim();
		//	bool isValidToExecute = false;
		//	int id_serial = Convert.ToInt32(hdnId.Value);
		//	int year = 0;
		//	int rating = 0;
		//	int num = 0;

		//	if (int.TryParse(txtYear.Text.Trim(), out int yearValue))
		//	{
		//		year = yearValue;
		//	}
		//	else
		//	{
		//		// Вывести сообщение об ошибке, если указанное значение года некорректно
		//		lblMsg.Visible = true;
		//		lblMsg.Text = "Please enter a valid year.";
		//		lblMsg.CssClass = "alert alert-danger";
		//		return;
		//	}

		//	if (int.TryParse(txtRating.Text.Trim(), out int ratingValue))
		//	{
		//		rating = ratingValue;
		//	}
		//	else
		//	{
		//		// Вывести сообщение об ошибке, если указанное значение рейтинга некорректно
		//		lblMsg.Visible = true;
		//		lblMsg.Text = "Please enter a valid rating.";
		//		lblMsg.CssClass = "alert alert-danger";
		//		return;
		//	}

		//	con = new SqlConnection(Connection.GetConnectionString());
		//	cmd = new SqlCommand("Catalog_Crud", con);
		//	cmd.Parameters.AddWithValue("@Action", id_serial == 0 ? "INSERT" : "UPDATE");
		//	cmd.Parameters.AddWithValue("@id_Serial", id_serial);
		//	cmd.Parameters.AddWithValue("@Name_serial", txtname.Text.Trim());
		//	cmd.Parameters.AddWithValue("@Age_Restriction", ageRestriction);
		//	cmd.Parameters.AddWithValue("@Year_Of_Release", year);
		//	cmd.Parameters.AddWithValue("@Rating", rating);
		//	cmd.Parameters.AddWithValue("@Number_Released_Episodes", num);
		//	cmd.Parameters.AddWithValue("@IsActive", cbIsActive.Checked);

		//	if (fuCatalogImage.HasFile)
		//	{
		//		if (Utils.IsValidExtension(fuCatalogImage.FileName))
		//		{
		//			Guid obj = Guid.NewGuid();
		//			fileExtension = Path.GetExtension(fuCatalogImage.FileName);
		//			imagePath = "Images/Category/" + obj.ToString() + fileExtension;
		//			fuCatalogImage.PostedFile.SaveAs(Server.MapPath("~/Images/Category/") + obj.ToString() + fileExtension);
		//			cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
		//			isValidToExecute = true;
		//		}
		//		else
		//		{
		//			lblMsg.Visible = true;
		//			lblMsg.Text = "Please select .jpg, .jpeg or .png image";
		//			lblMsg.CssClass = "alert alert-danger";
		//			isValidToExecute = false;
		//		}
		//	}
		//	else
		//	{
		//		isValidToExecute = true;
		//	}

		//	if (isValidToExecute)
		//	{
		//		cmd.CommandType = CommandType.StoredProcedure;
		//		try
		//		{
		//			con.Open();
		//			cmd.ExecuteNonQuery();
		//			actionName = id_serial == 0 ? "inserted" : "updated";
		//			lblMsg.Visible = true;
		//			lblMsg.Text = "Catalog" + " " + actionName + " " + "successfully!";
		//			lblMsg.CssClass = "alert alert-success";
		//			getCatalogies();
		//			clear();
		//		}
		//		catch (Exception ex)
		//		{
		//			lblMsg.Visible = true;
		//			lblMsg.Text = "Error--" + ex.Message;
		//		}
		//		finally
		//		{
		//			con.Close();
		//		}
		//	}
		//}

		protected void btnAddOrUpdate_Click(object sender, EventArgs e)
		{
			string actionName = string.Empty, imagePath = string.Empty, fileExtension = string.Empty;
			string ageRestriction = txtAgeR.Text.Trim();
			string category = txtCat.Text.Trim();
			string country = txtCountry.Text.Trim();
			string genre = txtGenre.Text.Trim();
			bool isValidToExecute = false;
			int id_serial = Convert.ToInt32(hdnId.Value);
			int year = 0;
			int rating = 0;

			if (int.TryParse(txtYear.Text.Trim(), out int yearValue))
			{
				year = yearValue;
			}
			else
			{
				lblMsg.Visible = true;
				lblMsg.Text = "Please enter a valid year.";
				lblMsg.CssClass = "alert alert-danger";
				return;
			}

			if (int.TryParse(txtRating.Text.Trim(), out int ratingValue))
			{
				rating = ratingValue;
			}
			else
			{
				lblMsg.Visible = true;
				lblMsg.Text = "Please enter a valid rating.";
				lblMsg.CssClass = "alert alert-danger";
				return;
			}






			con = new SqlConnection(Connection.GetConnectionString());
			cmd = new SqlCommand("Catalog_Crud", con);
			cmd.Parameters.AddWithValue("@Action", id_serial == 0 ? "INSERT" : "UPDATE");
			cmd.Parameters.AddWithValue("@id_Serial", id_serial);
			cmd.Parameters.AddWithValue("@Name_serial", txtname.Text.Trim());
			cmd.Parameters.AddWithValue("@Age_Restriction", ageRestriction);
			cmd.Parameters.AddWithValue("@Year_Of_Release", year);
			cmd.Parameters.AddWithValue("@Rating", rating);
	
			cmd.Parameters.AddWithValue("@Category", category);
			cmd.Parameters.AddWithValue("@Country", country);
			cmd.Parameters.AddWithValue("@Genre", genre);
			cmd.Parameters.AddWithValue("@IsActive", cbIsActive.Checked);

			if (fuCatalogImage.HasFile)
			{
				if (Utils.IsValidExtension(fuCatalogImage.FileName))
				{
					Guid obj = Guid.NewGuid();
					fileExtension = Path.GetExtension(fuCatalogImage.FileName);
					imagePath = "../Images/Category" + obj.ToString() + fileExtension;
					fuCatalogImage.PostedFile.SaveAs(Server.MapPath("~/Images/Category") + obj.ToString() + fileExtension);
					cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
					isValidToExecute = true;
				}
				else
				{
					lblMsg.Visible = true;
					lblMsg.Text = "Please select .jpg, .jpeg or .png image";
					lblMsg.CssClass = "alert alert-danger";
					isValidToExecute = false;
				}
			}
			else
			{
				isValidToExecute = true;

				cmd.Parameters.AddWithValue("@ImageUrl", imgCatalog.ImageUrl);
			}

			if (isValidToExecute)
			{
				cmd.CommandType = CommandType.StoredProcedure;

				try
				{
					con.Open();
					cmd.ExecuteNonQuery();
					actionName = id_serial == 0 ? "inserted" : "updated";
					lblMsg.Visible = true;
					lblMsg.Text = "Catalog" + " " + actionName + " " + "successfully!";
					lblMsg.CssClass = "alert alert-success";
					getCatalogies();
					clear();
				}
				catch (Exception ex)
				{
					lblMsg.Visible = true;
					lblMsg.Text = "Error--" + ex.Message;
				}
				finally
				{
					con.Close();
				}
			}
		}


		private void getCatalogies()
		{
			con = new SqlConnection(Connection.GetConnectionString());
			cmd = new SqlCommand("Catalog_Crud", con);
			cmd.Parameters.AddWithValue("@Action", "SELECT");
			cmd.CommandType = CommandType.StoredProcedure;
			sda = new SqlDataAdapter(cmd);
			dt = new DataTable();
			sda.Fill(dt);
			rCatalog.DataSource = dt;
			rCatalog.DataBind();
		}

		private void clear()
		{
			txtAgeR.Text = string.Empty;
			txtYear.Text = string.Empty;
			txtRating.Text = string.Empty;
			txtname.Text = string.Empty;
			txtCountry.Text = string.Empty;
			txtGenre.Text = string.Empty;
			txtCat.Text = string.Empty;
			cbIsActive.Checked = false;
			hdnId.Value = "0";
			btnAddOrUpdate.Text = "Add";
			imgCatalog.ImageUrl = String.Empty;
		}

		protected void btnClear_Click(object sender, EventArgs e)
		{
			clear();
		}

		protected void rCatalog_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			lblMsg.Visible = false;
			if(e.CommandName == "edit")
			{
				con = new SqlConnection(Connection.GetConnectionString());
				cmd = new SqlCommand("Catalog_Crud", con);
				cmd.Parameters.AddWithValue("@Action", "GETBYID");
				cmd.Parameters.AddWithValue("@id_Serial", e.CommandArgument);
				cmd.CommandType= CommandType.StoredProcedure;
				sda = new SqlDataAdapter(cmd);
				dt= new DataTable();
				sda.Fill(dt);
				//txtname.Text = dt.Rows[0]["Name_serial"].ToString();
				//txtAgeR.Text = dt.Rows[0]["Age_Restriction"].ToString();

				//txtYear.Text = dt.Rows[0]["Year_Of_Release"].ToString();
				//txtRating.Text = dt.Rows[0]["Rating"].ToString();
				//cbIsActive.Checked = Convert.ToBoolean(dt.Rows[0]["IsActive"]);

				//imgCatalog.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString()) ? "../Images/No_image.png" : "../" + dt.Rows[0]["ImageUrl"].ToString();
				txtname.Text = dt.Rows[0]["Name_serial"] != DBNull.Value ? dt.Rows[0]["Name_serial"].ToString() : string.Empty;
				txtAgeR.Text = dt.Rows[0]["Age_Restriction"] != DBNull.Value ? dt.Rows[0]["Age_Restriction"].ToString() : string.Empty;
				txtYear.Text = dt.Rows[0]["Year_Of_Release"] != DBNull.Value ? dt.Rows[0]["Year_Of_Release"].ToString() : string.Empty;
			
				txtRating.Text = dt.Rows[0]["Rating"] != DBNull.Value ? dt.Rows[0]["Rating"].ToString() : string.Empty;
			
				txtCat.Text = dt.Rows[0]["Category"] != DBNull.Value ? dt.Rows[0]["Category"].ToString() : string.Empty;
				txtCountry.Text = dt.Rows[0]["Country"] != DBNull.Value ? dt.Rows[0]["Country"].ToString() : string.Empty;
				txtGenre.Text = dt.Rows[0]["Genre"] != DBNull.Value ? dt.Rows[0]["Genre"].ToString() : string.Empty;
				cbIsActive.Checked = dt.Rows[0]["IsActive"] != DBNull.Value ? Convert.ToBoolean(dt.Rows[0]["IsActive"]) : false;
				imgCatalog.ImageUrl = dt.Rows[0]["ImageUrl"] != DBNull.Value && !string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString()) ? "../Images" + dt.Rows[0]["ImageUrl"].ToString() : "../Images/No_image.png";

				imgCatalog.Height = 200;
				imgCatalog.Width=200;
				hdnId.Value = dt.Rows[0]["id_Serial"].ToString();
				btnAddOrUpdate.Text = "Update";
				LinkButton btn=e.Item.FindControl("lnkEdit") as LinkButton;
				btn.CssClass = "badge badge-warning";

			}
			else if (e.CommandName == "delete")
			{
				con = new SqlConnection(Connection.GetConnectionString());
				cmd = new SqlCommand("Catalog_Crud", con);
				cmd.Parameters.AddWithValue("@Action", "DELETE");
				cmd.Parameters.AddWithValue("@id_Serial", e.CommandArgument);
				cmd.CommandType = CommandType.StoredProcedure;
				try
				{
					con.Open();
					cmd.ExecuteNonQuery();
					lblMsg.Visible = true;
					lblMsg.Text = "Category deleted successfully!";
					lblMsg.CssClass = "alter alter-success";
					getCatalogies();

				}
				catch (Exception ex)
				{
					lblMsg.Visible = true;
					lblMsg.Text = "Error-" + ex.Message;
					lblMsg.CssClass = "alter alter-danger";
				}
				finally
				{
					con.Close();
				}
			}
		}

		protected void rCatalog_ItemDataBound(object sender, RepeaterItemEventArgs e)
		{
			if(e.Item.ItemType == ListItemType.Item || e.Item.ItemType==ListItemType.AlternatingItem)
			{
				Label lbl = e.Item.FindControl("lblIsActive") as Label;
				if(lbl.Text == "True")
				{
					lbl.Text = "Active";
					lbl.CssClass = "badge badge-success";
				}
				else
				{
					lbl.Text = "In-Active";
					lbl.CssClass = "badge bsdge-danger";
				}
			}
		}
	}
}