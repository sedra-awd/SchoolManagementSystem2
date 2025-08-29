using System;
using System.Data.SqlClient;
using System.Configuration;

namespace SchoolManagementSystem { 
    public partial class AddClass : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SchoolDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string className = txtClassName.Text.Trim();

            if (string.IsNullOrEmpty(className))
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please enter a class name.";
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Classes (name) VALUES (@name)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", className);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Class added successfully!";
            txtClassName.Text = "";
        }
    }
}
