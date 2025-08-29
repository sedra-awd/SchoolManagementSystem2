using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace SchoolManagementSystem
{
    public partial class AddSubject : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SchoolDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTeachers();
            }
        }

        private void LoadTeachers()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT id, First_Name + ' ' + Last_Name AS FullName FROM Teachers";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                ddlTeachers.DataSource = cmd.ExecuteReader();
                ddlTeachers.DataTextField = "FullName";
                ddlTeachers.DataValueField = "id";
                ddlTeachers.DataBind();
                con.Close();
            }

            ddlTeachers.Items.Insert(0, new ListItem("Select a teacher", "0"));
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            string subjectName = txtSubjectName.Text.Trim();
            int passedGrade = int.Parse(txtPassedGrade.Text.Trim());
            int teacherId = int.Parse(ddlTeachers.SelectedValue);

            if (teacherId == 0)
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Please select a teacher.";
                return;
            }

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Subjects (name, teacher_id, passed_grade) VALUES (@name, @teacherId, @grade)";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", subjectName);
                cmd.Parameters.AddWithValue("@teacherId", teacherId);
                cmd.Parameters.AddWithValue("@grade", passedGrade);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblMsg.ForeColor = System.Drawing.Color.Green;
            lblMsg.Text = "Subject added successfully!";
            txtSubjectName.Text = "";
            txtPassedGrade.Text = "";
            ddlTeachers.SelectedIndex = 0;
        }
    }
}
