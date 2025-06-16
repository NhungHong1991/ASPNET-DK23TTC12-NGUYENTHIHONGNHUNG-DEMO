using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace BanLaptop
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        // Kết nối dùng chuỗi từ Web.config
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["YourConnectionStringName"].ConnectionString);

        protected void Page_Load(Object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void btnSubmit_Click(Object sender, EventArgs e)
        {
            string name = txtName.Text.Trim();
            string lang = ddlLanguages.SelectedValue;
            string gender = raMale.Checked ? "Nam" : "Nữ";

            string languageMessage;

            switch (lang)
            {
                case "an":
                    languageMessage = "Welcome";
                    break;
                case "vi":
                    languageMessage = "Chào mừng";
                    break;
                case "ch":
                    languageMessage = "欢迎";
                    break;
                default:
                    languageMessage = "Hello";
                    break;
            }

            string finalMessage = GetWelcomeMessage(languageMessage, gender, name);
            lblResult.Text = finalMessage;
        }

        private string GetWelcomeMessage(string greeting, string gender, string name)
        {
            return $"{greeting}, bạn {gender} {name}!";
        }

        // Hiển thị dữ liệu lên GridView1
        public void hienthi()
        {
            string sql = "SELECT * FROM tbluser";
            SqlDataAdapter da = new SqlDataAdapter(sql, con);
            DataSet ds = new DataSet();
            da.Fill(ds);
            GridView1.DataSource = ds;

        }
        public void them(string sql)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void Sua(string sql)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        public void xoa(string sql)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
        // Lấy dữ liệu dòng được chọn
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow row = GridView1.SelectedRow;
            this.txtuser.Text = row.Cells[2].Text;
            this.txtfull.Text = row.Cells[4].Text;
            this.txtmail.Text = row.Cells[5].Text;

            string selectedValue = row.Cells[5].Text;
            if (DropDownList1.Items.FindByValue(selectedValue) != null)
            {
                this.DropDownList1.SelectedValue = selectedValue;
            }
        }

        // Xử lý xóa dòng
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string a = GridView1.DataKeys[e.RowIndex].Values["username"].ToString();
            SqlCommand cmd = new SqlCommand("DELETE FROM tbluser WHERE username = @username", con);
            cmd.Parameters.AddWithValue("@username", a);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            hienthi();
        }
    }
}
