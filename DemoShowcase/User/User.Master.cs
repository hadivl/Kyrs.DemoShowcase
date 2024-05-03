﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DemoShowcase.User
{
	public partial class User : System.Web.UI.MasterPage
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			//проверит содержит ли имя страницы Default
			if (!Request.Url.AbsoluteUri.ToString().Contains("Default.aspx"))
			{
				form1.Attributes.Add("class", "sub_page");
			}
			else
			{
				form1.Attributes.Remove("class");

				Control sliderUserControl = (Control)Page.LoadControl("SliderUserControl.ascx");

				pnlSliderUC.Controls.Add(sliderUserControl);
			}
			if (Session["idUser"] != null)
			{
				lbLoginOrLogout.Text = "Logout";
			}
			else
			{
				lbLoginOrLogout.Text = "Login";
			}
		}

        protected void lbLoginOrLogout_Click(object sender, EventArgs e)
        {
			if (Session["idUser"] == null)
			{
				Response.Redirect("Login.aspx");
			}
			else
			{
				Session.Abandon();
				Response.Redirect("Login.aspx");
			}
        }

		protected void lblRegisterOrProfile_Click(object sender, EventArgs e)
		{
			if (Session["idUser"] != null)
			{
				lblRegisterOrProfile.ToolTip = "User Profile";
				Response.Redirect("Profile.aspx");
			}
			else
			{
				lblRegisterOrProfile.ToolTip = "User Regisration";
				Response.Redirect("Registration.aspx");
			}
		}

	}
}