using System;
using System.Data.SqlClient;
using System.Configuration;

namespace SchoolManagementSystem
{
    public partial class AddTeacher : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SchoolDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string email = txtEmail.Text;
            string phone = txtPhone.Text;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();

                string insertQuery = "INSERT INTO Teachers (First_Name, Last_Name, Email, phone) VALUES (@first, @last, @mail, @phone)";

                SqlCommand cmd = new SqlCommand(insertQuery, con);
                cmd.Parameters.AddWithValue("@first", firstName);
                cmd.Parameters.AddWithValue("@last", lastName);
                cmd.Parameters.AddWithValue("@mail", email);
                cmd.Parameters.AddWithValue("@phone", phone);

                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblMsg.Text = "Teacher added successfully!";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
        }
    }
}
