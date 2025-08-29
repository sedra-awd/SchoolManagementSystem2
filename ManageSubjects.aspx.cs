using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SchoolManagementSystem
{
    public partial class ManageSubjects : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SchoolDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSubjects();
            }
        }

        private void LoadSubjects()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
            SELECT Subjects.id, Subjects.name, Subjects.passed_grade,
                   Teachers.First_Name + ' ' + Teachers.Last_Name AS TeacherName
            FROM Subjects
            LEFT JOIN Teachers ON Subjects.teacher_id = Teachers.id";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvSubjects.DataSource = dt;
                gvSubjects.DataBind();
            }
        }

        protected void gvSubjects_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvSubjects.EditIndex = e.NewEditIndex;
            LoadSubjects();
        }

        protected void gvSubjects_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvSubjects.EditIndex = -1;
            LoadSubjects();
        }

        protected void gvSubjects_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvSubjects.DataKeys[e.RowIndex].Value.ToString());
            string name = ((System.Web.UI.WebControls.TextBox)gvSubjects.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            int passMark = int.Parse(((System.Web.UI.WebControls.TextBox)gvSubjects.Rows[e.RowIndex].Cells[2].Controls[0]).Text);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Subjects SET name=@name, passed_grade=@passMark WHERE id=@id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@passMark", passMark);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblMsg.Text = "Modified Successfully";
            gvSubjects.EditIndex = -1;
            LoadSubjects();
        }

        protected void gvSubjects_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvSubjects.DataKeys[e.RowIndex].Value.ToString());

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Subjects WHERE id=@id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblMsg.Text = "Deleted Successfully";
            LoadSubjects();
        }
    }
}