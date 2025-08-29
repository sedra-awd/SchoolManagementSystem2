using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace YourProjectNamespace
{
    public partial class ManageGrades : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SchoolDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadGrades();
            }
        }

        private void LoadGrades()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"
                    SELECT 
                        g.id,
                        s.First_Name + ' ' + s.Last_Name AS student_name,
                        sub.name AS subject_name,
                        g.mark
                    FROM Grades g
                    INNER JOIN Students s ON g.student_id = s.id
                    INNER JOIN Subjects sub ON g.subject_id = sub.id";

                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvGrades.DataSource = dt;
                gvGrades.DataBind();
            }
        }

        protected void gvGrades_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvGrades.EditIndex = e.NewEditIndex;
            LoadGrades();
        }

        protected void gvGrades_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvGrades.EditIndex = -1;
            LoadGrades();
        }

        protected void gvGrades_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvGrades.DataKeys[e.RowIndex].Value.ToString());
            int mark = int.Parse(((System.Web.UI.WebControls.TextBox)gvGrades.Rows[e.RowIndex].Cells[3].Controls[0]).Text);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Grades SET mark = @mark WHERE id = @id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@mark", mark);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            gvGrades.EditIndex = -1;
            lblMsg.Text = "Grade updated successfully!";
            LoadGrades();
        }

        protected void gvGrades_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvGrades.DataKeys[e.RowIndex].Value.ToString());

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Grades WHERE id = @id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblMsg.Text = "Grade deleted successfully!";
            LoadGrades();
        }
    }
}
