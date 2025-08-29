using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace  SchoolManagementSystem
{
    public partial class ManageTeachers : System.Web.UI.Page
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
                string query = "SELECT * FROM Teachers";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvTeachers.DataSource = dt;
                gvTeachers.DataBind();
            }
        }

        protected void gvTeachers_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvTeachers.EditIndex = e.NewEditIndex;
            LoadTeachers();
        }

        protected void gvTeachers_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvTeachers.EditIndex = -1;
            LoadTeachers();
        }

        protected void gvTeachers_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvTeachers.DataKeys[e.RowIndex].Value.ToString());

            string firstName = ((System.Web.UI.WebControls.TextBox)gvTeachers.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
            string lastName = ((System.Web.UI.WebControls.TextBox)gvTeachers.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
            string email = ((System.Web.UI.WebControls.TextBox)gvTeachers.Rows[e.RowIndex].Cells[3].Controls[0]).Text;
            string phone = ((System.Web.UI.WebControls.TextBox)gvTeachers.Rows[e.RowIndex].Cells[4].Controls[0]).Text;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = @"UPDATE Teachers 
                                 SET First_Name=@first, Last_Name=@last, Email=@mail, Phone=@phone 
                                 WHERE id=@id";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@first", firstName);
                cmd.Parameters.AddWithValue("@last", lastName);
                cmd.Parameters.AddWithValue("@mail", email);
                cmd.Parameters.AddWithValue("@phone", phone);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            gvTeachers.EditIndex = -1;
            lblMsg.Text = "Modified Successfully!";
            LoadTeachers();
        }

        protected void gvTeachers_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvTeachers.DataKeys[e.RowIndex].Value.ToString());

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Teachers WHERE id=@id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblMsg.Text = "Deleted Successfully!";
            LoadTeachers();
        }
    }
}