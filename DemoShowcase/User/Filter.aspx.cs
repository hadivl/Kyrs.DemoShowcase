using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace DemoShowcase.User
{
    public partial class Filter : System.Web.UI.Page
    {
       SqlConnection con;
		SqlCommand cmd;
		SqlDataAdapter sda;
		DataTable dt;
		public void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				{
					
					getSerial();
				}
			}
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

        public void btnFilter_Click(object sender, EventArgs e)
        {
            string genre = ((TextBox)FindControl("ddlGenre")).Text;
            int year = string.IsNullOrEmpty(((TextBox)FindControl("txtYear")).Text) ? 0 : Convert.ToInt32(((TextBox)FindControl("txtYear")).Text);
            string country = ((TextBox)FindControl("txtCountry")).Text;
            int age = string.IsNullOrEmpty(((TextBox)FindControl("txtAge")).Text) ? 0 : Convert.ToInt32(((TextBox)FindControl("txtAge")).Text);

            DataView dv = dt.DefaultView;
            string filterExpression = "";

            if (!string.IsNullOrEmpty(genre))
            {
                filterExpression += "Genre = '" + genre + "'";
            }

            if (year > 0)
            {
                if (!string.IsNullOrEmpty(filterExpression))
                    filterExpression += " OR ";
                filterExpression += "Year_Of_Release = " + year;
            }

            if (!string.IsNullOrEmpty(country))
            {
                if (!string.IsNullOrEmpty(filterExpression))
                    filterExpression += " OR ";
                filterExpression += "Country = '" + country + "'";
            }

            if (age > 0)
            {
                if (!string.IsNullOrEmpty(filterExpression))
                    filterExpression += " OR ";
                filterExpression += "Age_Restriction = " + age;
            }

            dv.RowFilter = filterExpression;
            rSerial.DataSource = dv;
            rSerial.DataBind();
        }


        public void rSerial_ItemCommand(object source, RepeaterCommandEventArgs e)
		{
			
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
	}
}