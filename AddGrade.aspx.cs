using System;
using System.Data.SqlClient;
using System.Configuration;

namespace SchoolManagementSystem
{
    public partial class AddGrade : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SchoolDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
                LoadSubjects();
            }
        }

        private void LoadStudents()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT id, First_Name + ' ' + Last_Name AS FullName FROM Students";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlStudents.DataSource = reader;
                ddlStudents.DataTextField = "FullName";
                ddlStudents.DataValueField = "id";
                ddlStudents.DataBind();
                con.Close();
            }

            ddlStudents.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select student", "0"));
        }

        private void LoadSubjects()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT id, name FROM Subjects";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                ddlSubjects.DataSource = reader;
                ddlSubjects.DataTextField = "name";
                ddlSubjects.DataValueField = "id";
                ddlSubjects.DataBind();
                con.Close();
            }

            ddlSubjects.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select subject", "0"));
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            int studentId = int.Parse(ddlStudents.SelectedValue);
            int subjectId = int.Parse(ddlSubjects.SelectedValue);
            int mark = int.Parse(txtGrade.Text);

            if (studentId == 0 || subjectId == 0)
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please select a student and a subject.";
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Grades (student_id, subject_id, mark) VALUES (@student, @subject, @mark)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@student", studentId);
                cmd.Parameters.AddWithValue("@subject", subjectId);
                cmd.Parameters.AddWithValue("@mark", mark);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Grade added successfully!";
            ddlStudents.SelectedIndex = 0;
            ddlSubjects.SelectedIndex = 0;
            txtGrade.Text = "";
        }
    }
}
