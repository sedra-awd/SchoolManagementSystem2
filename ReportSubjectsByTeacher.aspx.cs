using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SchoolManagementSystem
{
    public partial class ReportSubjectsByTeacher : System.Web.UI.Page
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
                SqlDataReader reader = cmd.ExecuteReader();
                ddlTeachers.DataSource = reader;
                ddlTeachers.DataTextField = "FullName";
                ddlTeachers.DataValueField = "id";
                ddlTeachers.DataBind();
                con.Close();
            }

            ddlTeachers.Items.Insert(0, new System.Web.UI.WebControls.ListItem("Select a teacher", "0"));
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            int teacherId = int.Parse(ddlTeachers.SelectedValue);
            if (teacherId == 0)
                return;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT name FROM Subjects WHERE teacher_id = @teacherId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@teacherId", teacherId);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvSubjects.DataSource = dt;
                gvSubjects.DataBind();
            }
        }
    }
}
