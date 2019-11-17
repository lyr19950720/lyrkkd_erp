using DigitalSystem.train.cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
namespace DigitalSystem.train
{
    public partial class TeacherGradeDetail : System.Web.UI.Page
    {

        trainCourseDB coursedb = new trainCourseDB();
        train_courseDataContext context = new train_courseDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            ASPxGridView1.DataBind();
            init();
        }
        private void init()
        {
            int id = Convert.ToInt32(Request["Id"]);
            train_course info = context.train_course.Single(i => i.Id == id);
            if (info.Remark == null)
            {
                ASPxLabel7.Visible = false;
                Suggest.Visible = false;
            }
            else
            {
                ASPxLabel7.Visible = true;
                Suggest.Visible = true;
                Suggest.Text = info.Remark;
                Suggest.Enabled = false;
            }

            dbDataContext db1 = new dbDataContext();
            var departmentInfo = db1.GetTable<S_Department_Info>();
            var departmentid = from t in departmentInfo
                               where t.DepartmentName == "培训部"
                               select t.id;
            foreach (var i in departmentid)
            {
                //    Response.Write(i);
                HiddenField1.Value = i.ToString();

            }
        }
        protected void UploadGrade_Click(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request["Id"]);
            if (isGradeRight(id))
            {
                coursedb.update_course_status(Convert.ToInt32(Request["Id"]), 2);
                Response.Write("<script>window.parent.document.getElementById('mainsplitter_RefreshBtn').click();</script>");
            }
            else
            {
                showMessage("成绩非法，无法提交");
            }
            

        }
        public void showMessage(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "updateScript", "<script>alert('" + msg + "')</script>", false);
        }
        protected bool isGradeRight(int id)
        {
            //List<Employee_train_record> res = new List<Employee_train_record>();
            train_courseDataContext kkdb = new train_courseDataContext();
            var UserArray = kkdb.GetTable<Employee_train_record>();
            var users = from t in UserArray
                        where t.Course_id == id
                        select t;
            foreach (var i in users)
            {
                if (i.Grade == null && i.Remark == null) return false;

            }
            return true;
        }
        protected void ASPxGridView3_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {

            if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
            double s = Convert.ToDouble(e.GetValue("Grade"));
            if (s < 60 && s != 00)
            {

                e.Row.ForeColor = Color.Red;
                Response.Write(e.Row.Cells);
                Response.Write(e.Row);
            }
        }
 
    }
}