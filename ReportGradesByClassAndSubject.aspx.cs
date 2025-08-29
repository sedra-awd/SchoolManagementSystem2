using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SchoolManagementSystem
{
    public partial class ReportGradesByClassAndSubject : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SchoolDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadClasses();
                LoadSubjects();
            }
        }

        private void LoadClasses()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT id, name FROM Classes";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                ddlClasses.DataSource = cmd.ExecuteReader();
                ddlClasses.DataTextField = "name";
                ddlClasses.DataValueField = "id";
                ddlClasses.DataBind();
                con.Close();
            }

            ddlClasses.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select class", "0"));
        }

        private void LoadSubjects()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT id, name FROM Subjects";
                SqlCommand cmd = new SqlCommand(query, con);
                con.Open();
                ddlSubjects.DataSource = cmd.ExecuteReader();
                ddlSubjects.DataTextField = "name";
                ddlSubjects.DataValueField = "id";
                ddlSubjects.DataBind();
                con.Close();
            }

            ddlSubjects.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select subject", "0"));
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int classId = int.Parse(ddlClasses.SelectedValue);
            int subjectId = int.Parse(ddlSubjects.SelectedValue);

            if (classId == 0 || subjectId == 0)
                return;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT s.First_Name + ' ' + s.Last_Name AS StudentName, g.mark AS Grade
                    FROM Grades g
                    INNER JOIN Students s ON g.student_id = s.id
                    WHERE s.class_id = @classId AND g.subject_id = @subjectId";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@classId", classId);
                cmd.Parameters.AddWithValue("@subjectId", subjectId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvGrades.DataSource = dt;
                gvGrades.DataBind();
            }
        }
    }
}
