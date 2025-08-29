using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace SchoolManagementSystem
{
    public partial class ManageClasses : System.Web.UI.Page
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
                string query = "SELECT * FROM Classes";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvClasses.DataSource = dt;
                gvClasses.DataBind();
            }
        }

        protected void gvClasses_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvClasses.EditIndex = e.NewEditIndex;
            LoadClasses();
        }

        protected void gvClasses_RowCancelingEdit(object sender, System.Web.UI.WebControls.GridViewCancelEditEventArgs e)
        {
            gvClasses.EditIndex = -1;
            LoadClasses();
        }

        protected void gvClasses_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvClasses.DataKeys[e.RowIndex].Value.ToString());
            string name = ((System.Web.UI.WebControls.TextBox)gvClasses.Rows[e.RowIndex].Cells[1].Controls[0]).Text;

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE Classes SET name = @name WHERE id = @id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            gvClasses.EditIndex = -1;
            lblMsg.Text = "Class updated successfully!";
            LoadClasses();
        }

        protected void gvClasses_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(gvClasses.DataKeys[e.RowIndex].Value.ToString());

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "DELETE FROM Classes WHERE id = @id";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            lblMsg.Text = "Class deleted successfully!";
            LoadClasses();
        }
    }
}
