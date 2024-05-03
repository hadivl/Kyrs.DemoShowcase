﻿using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.IO;

namespace DemoShowcase.User
{
	public partial class Registration : System.Web.UI.Page
	{

		SqlConnection con;
		SqlCommand cmd;
		SqlDataAdapter sda;
		DataTable dt;


		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				if (Request.QueryString["id"] != null) /*&& Session["id_User"] != null*/
				{
					getUserDetails();
				}
				else if (Session["id_User"] != null)
				{
					Response.Redirect("Default.aspx");
				}
			}
		}

        protected void btnRegister_Click(object sender, EventArgs e)
        {
			string actionName= string.Empty, imagePath=string.Empty, fileExtension=string.Empty;
			bool isValidToExecute = false;
			int id_User = Convert.ToInt32(Request.QueryString["id"]);
			con = new SqlConnection(Connection.GetConnectionString());
			cmd = new SqlCommand("User_Crud", con);
			cmd.Parameters.AddWithValue("@Action", id_User == 0 ? "INSERT" : "UPDATE");
			cmd.Parameters.AddWithValue("@id_User", id_User);
			cmd.Parameters.AddWithValue("@Full_name", txtname.Text.Trim());
			cmd.Parameters.AddWithValue("@Login", txtLogin.Text.Trim());
			cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
			cmd.Parameters.AddWithValue("@Password", txtPassword.Text.Trim());
			if (fuUserImage.HasFile)
			{
				if(Utils.IsValidExtension(fuUserImage.FileName))
				{
					Guid obj=Guid.NewGuid();
					fileExtension = Path.GetExtension(fuUserImage.FileName);
					imagePath="Images/User"+obj.ToString() + fileExtension;
					fuUserImage.PostedFile.SaveAs(Server.MapPath("~/Images/User/") + obj.ToString() + fileExtension);
					cmd.Parameters.AddWithValue("@ImageUrl", imagePath);
					isValidToExecute = true;

				}
				else
				{
					lblMsg.Visible = true;
					lblMsg.Text = "Please select .jpg, .jped or .png image";
					lblMsg.CssClass = "alter alter-danger";
					isValidToExecute = false;
				}
			}
			else
			{
				isValidToExecute = true;
			}

			if (isValidToExecute)
			{
				cmd.CommandType = CommandType.StoredProcedure;
				try
				{
					con.Open();
					cmd.ExecuteNonQuery();
					actionName = id_User == 0 ? 
						//click here не рвботает как должен
						" registration is successful! <b><a='Login.aspx'> Click here </a></b> to do login" :
						" details update successful! <b><a href='Profile.aspx'> Can check here</a></b>";
					lblMsg.Visible = true;
					lblMsg.Text = "<b>" + txtname.Text.Trim() + "</b>" + actionName;
					lblMsg.CssClass = "alter alter-success";
					if(id_User != 0)
					{
						Response.AddHeader("REFRESH", "1;URL=Profile.aspx");
					}
					clear();
				}
				//catch(SqlException ex)
				//{
				//	if(ex.Message.Contains("Violation of UNIQUE KEY constraint"))
				//	{
				//		lblMsg.Visible = true;
				//		lblMsg.Text = "<b>" + txtname.Text.Trim() + "</b> username already exist, try new one..!";
				//		lblMsg.CssClass = "alter alter-danger";

				//	}

				//}
				catch (SqlException ex)
				{
					if (ex.Number == 2627) // Проверка номера ошибки для уникальности
					{
						lblMsg.Visible = true;
						lblMsg.Text = "<b>Ошибка:</b> Логин или email уже существует. Попробуйте снова.";
						lblMsg.CssClass = "alter alter-danger";
					}
					else
					{
						// Обработка других ошибок SQL
						lblMsg.Visible = true;
						lblMsg.Text = "Error-" + ex.Message;
						lblMsg.CssClass = "alter alter-danger";
					}
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

		void getUserDetails()
		{
			con = new SqlConnection(Connection.GetConnectionString());
			cmd = new SqlCommand("User_Crud", con);
			cmd.Parameters.AddWithValue("@Action", "SELECT4PROFILE");
			cmd.Parameters.AddWithValue("@id_User", Request.QueryString["id"]);
			cmd.CommandType = CommandType.StoredProcedure;
			sda = new SqlDataAdapter(cmd);
			dt= new DataTable();	
			sda.Fill(dt);
			if(dt.Rows.Count ==1)
			{
				txtname.Text = dt.Rows[0]["Full_name"].ToString();
				txtLogin.Text = dt.Rows[0]["Login"].ToString();
				txtEmail.Text = dt.Rows[0]["Email"].ToString();
				
				imgUser.ImageUrl = string.IsNullOrEmpty(dt.Rows[0]["ImageUrl"].ToString()) ? "../Images/No_image.png" : "../" + dt.Rows[0]["ImageUrl"].ToString();
				imgUser.Height = 50;
				imgUser.Width=50;
				txtPassword.TextMode = TextBoxMode.SingleLine;
				txtPassword.ReadOnly = true;
				txtPassword.Text = dt.Rows[0]["Password"].ToString();

			}
			lblHeaderMsg.Text = "<h2>Edit Profile</h2>";
			btnRegister.Text = "Update";
			lblAlreadyUser.Text = "";


		}

		private void clear()
		{
			txtname.Text= string.Empty;
			txtLogin.Text= string.Empty;
			txtEmail.Text= string.Empty;
			txtPassword.Text= string.Empty;	
		}
	}
}