using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SchoolManagementSystem
{
    public partial class AddStudent : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SchoolDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClasses();
            }
        }

        private void LoadClasses()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT id, name FROM Classes";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlClasses.DataSource = reader;
                ddlClasses.DataTextField = "name";
                ddlClasses.DataValueField = "id";
                ddlClasses.DataBind();
                con.Close();
            }

            ddlClasses.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Choose the class", "0"));
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string firstName = txtFirstName.Text;
            string lastName = txtLastName.Text;
            string fatherName = txtFatherName.Text;
            string motherName = txtMotherName.Text;
            DateTime birthDate = DateTime.Parse(txtBirthDate.Text);
            string address = txtAddress.Text;
            int classId = int.Parse(ddlClasses.SelectedValue);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Students (First_Name, Last_Name, Father_Name, Mother_Name, BirthDate, Address, class_id) VALUES (@first, @last, @father, @mother, @birth, @address, @classId)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@first", firstName);
                cmd.Parameters.AddWithValue("@last", lastName);
                cmd.Parameters.AddWithValue("@father", fatherName);
                cmd.Parameters.AddWithValue("@mother", motherName);
                cmd.Parameters.AddWithValue("@birth", birthDate);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@classId", classId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblMsg.Text = "The student has been added successfully!";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtFatherName.Text = "";
            txtMotherName.Text = "";
            txtBirthDate.Text = "";
            txtAddress.Text = "";
            ddlClasses.SelectedIndex = 0;
        }
    }
}
