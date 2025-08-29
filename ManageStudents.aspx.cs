using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SchoolManagementSystem
{
    public partial class ManageStudents : System.Web.UI.Page
    {
        string connectionString = ConfigurationManager.ConnectionStrings["SchoolDBConnection"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadStudents();
            }
        }

        private void LoadStudents()
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "SELECT * FROM Students";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvStudents.DataSource = dt;
                gvStudents.DataBind();
            }
        }

        protected void gvStudents_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvStudents.EditIndex = e.NewEditIndex;
            LoadStudents();
        }

        protected void gvStudents_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvStudents.EditIndex = -1;
            LoadStudents();
        }

        protected void gvStudents_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvStudents.DataKeys[e.RowIndex].Value.ToString());

            string firstName = ((System.Web.UI.WebControls.TextBox)gvStudents.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string lastName = ((System.Web.UI.WebControls.TextBox)gvStudents.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string fatherName = ((System.Web.UI.WebControls.TextBox)gvStudents.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string motherName = ((System.Web.UI.WebControls.TextBox)gvStudents.Rows[e.RowIndex].Cells[4].Controls[0]).Text;
            DateTime birthDate = DateTime.Parse(((System.Web.UI.WebControls.TextBox)gvStudents.Rows[e.RowIndex].Cells[5].Controls[0]).Text);
            string address = ((System.Web.UI.WebControls.TextBox)gvStudents.Rows[e.RowIndex].Cells[6].Controls[0]).Text;
            int classId = int.Parse(((System.Web.UI.WebControls.TextBox)gvStudents.Rows[e.RowIndex].Cells[7].Controls[0]).Text);

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"UPDATE Students SET 
                                First_Name=@first, Last_Name=@last, Father_Name=@father, 
                                Mother_Name=@mother, BirthDate=@birth, Address=@address, class_id=@classId 
                                WHERE id=@id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@first", firstName);
                cmd.Parameters.AddWithValue("@last", lastName);
                cmd.Parameters.AddWithValue("@father", fatherName);
                cmd.Parameters.AddWithValue("@mother", motherName);
                cmd.Parameters.AddWithValue("@birth", birthDate);
                cmd.Parameters.AddWithValue("@address", address);
                cmd.Parameters.AddWithValue("@classId", classId);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            gvStudents.EditIndex = -1;
            lblMsg.Text = "Student updated successfully!";
            LoadStudents();
        }

        protected void gvStudents_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvStudents.DataKeys[e.RowIndex].Value.ToString());

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Students WHERE id=@id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
            }

            lblMsg.Text = "Student deleted successfully!";
            LoadStudents();
        }
    }
}
