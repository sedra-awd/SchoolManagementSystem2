using System;
using System.Data.SqlClient;
using System.Configuration;

namespace SchoolManagementSystem
{
    public partial class ReportStudentsByAddress : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SchoolDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string address = txtAddress.Text.Trim();

            if (string.IsNullOrEmpty(address))
            {
                lblResult.Text = "Please enter an address.";
                return;
            }

            int studentCount = 0;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT COUNT(*) FROM Students WHERE Address = @address";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@address", address);

                con.Open();
                studentCount = (int)cmd.ExecuteScalar();
                con.Close();
            }

            lblResult.Text = $"Number of students in '{address}': {studentCount}";
        }
    }
}
