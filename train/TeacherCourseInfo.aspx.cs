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
    public partial class TeacherCourseInfo : System.Web.UI.Page
    {
        train_courseDataContext context = new train_courseDataContext();
        trainCourseDB coursedb = new trainCourseDB();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

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
                int lessonId = Convert.ToInt32(Request["Id"]);
                if (lessonId != -1)   //projectedit页面定死的，"-1"为"新建"状态
                {
                    //HF_SupplierID.Value = context.train_lesson_basicInfo.SingleOrDefault(item => item.Id == lessonId).Id.ToString();
                    InitControlValuesForEdit(lessonId);

                    //编辑时允许上传文件
                }

            }
        }
        protected void ASPxGridView3_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {

            if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
            double s = Convert.ToDouble(e.GetValue("Grade"));
            if (s < 60 && s != 00)
            {
                e.Row.ForeColor = Color.Red;

            }
        }
        #region 初始化 ASPxPageControl
        #endregion
        protected void btnSave_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.parent.document.getElementById('mainsplitter_RefreshBtn').click();</script>");
        }


        protected void btn_upload_grade(object sender, EventArgs e)
        {
            coursedb.update_course_status(Convert.ToInt32(Request["Id"]), 2);
            Response.Write("<script>window.parent.document.getElementById('mainsplitter_RefreshBtn').click();</script>");

        }
        private void InitControlValuesForEdit(int id)
        {
            train_course_view info = context.train_course_view.Single(i => i.Id == id);

            Name.Text = info.Name;
            Name.Enabled = false;
            Number.Text = info.Number;
            Number.Enabled = false;
            Time.Text = info.Time.ToString();
            Time.Enabled = false;
            Description.Text = info.Description;
            Description.Enabled = false;

            Type.Value = info.Type;

            Type.DataBind();
            Type.Enabled = false;
            lessonType.DataBind();

            ContentType.Value = info.ContentTypeId;
            ContentType.DataBind();
            ContentType.Enabled = false;
            LinqContentType.DataBind();

            Place.Text = info.Place;
            Place.Enabled = false;

            Class_time.Text = info.Class_time;
            Class_time.Enabled = false;

            start_date.Date = info.Start_date;
            start_date.Enabled = false;

            end_date.Date = info.End_date;
            end_date.Enabled = false;

            EndChooseDate.Date = info.End_choose_date;
            EndChooseDate.Enabled = false;

            Teacher.Value = info.Teacher;
            TeacherType.DataBind();
            //TeacherType.Enabled = false;

            Status.Value = info.Status;
            Status.DataBind();
            Status.Enabled = false;
            CourseStatus.DataBind();
            Create_time.Text = info.Create_time.ToString();
            Create_time.Enabled = false;


        }



        /// <summary>
        /// 删除之前检查该类型是否被使用
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GV_SmallType_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {


        }
        
        public void showMessage(string msg)
        {
            ScriptManager.RegisterStartupScript(this, this.GetType(), "updateScript", "<script>alert('" + msg + "')</script>", false);
        }

        protected void GV_SmallType_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

        }

        protected void ContactGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

        }

        protected void ContactGridView_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
        }

        protected void QualificationsInfoGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

        }

        protected void QualificationsInfoGridView_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

        }

        protected void BankGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

        }

        protected void BankGridView_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

        }


        protected void CategoryGridView_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {

        }

        protected void CategoryGridView_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {

        }
     
    }
}