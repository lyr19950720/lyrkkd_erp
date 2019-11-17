using DigitalSystem.train.cs;
using System;
using System.Collections.Generic;

using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.train
{
    public partial class OpenCourseDetail1 : System.Web.UI.Page
    {
        train_courseDataContext context = new train_courseDataContext();
        trainCourseDB coursedb = new trainCourseDB();
        LessonDB bEdit = new LessonDB();
        int lesson_id;
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
                lesson_id = lessonId;

                if (lessonId != -1)   //projectedit页面定死的，"-1"为"新建"状态
                {
                    //HF_SupplierID.Value = context.train_lesson_basicInfo.SingleOrDefault(item => item.Id == lessonId).Id.ToString();
                    InitControlValuesForEdit(lessonId);
                    
                    //编辑时允许上传文件
                }
                else
                {
                    InitControlValuesForNew();
                    //新建时不许上传文件

                }
            }
        }
        #region 初始化 ASPxPageControl
        #endregion
        protected void btnSave_Click(object sender, EventArgs e)
        {
            
            
            SaveInfoAndTab();
            showMessage("保存成功");
            Response.Write("<script>window.parent.document.getElementById('mainsplitter_RefreshBtn').click();</script>");
        }
        private void SaveInfoAndTab()
        {
            train_course info = new train_course();
            //info.Course_name = Name.Text.Trim();
            //info.Course_number = Number.Text.Trim();
            //info.Learn_time = Convert.ToInt32(Time.Text.Trim());
            //info.CourseType = Convert.ToInt32(Type.Value);
            //info.Description = Description.Text.Trim();
            info.Create_time = DateTime.Now;
            info.Class_time = Class_time.Text;
            info.Start_date = start_date.Date;
            info.End_choose_date = getEndChooseDate();
            info.End_date = end_date.Date;
            info.Lesson_id = Convert.ToInt32(Request["Id"]);
            info.Place = Place.Text;
            info.Status = 1;
            info.Teacher = Convert.ToInt32(Teacher.Value);

            coursedb.insert_course(info.Create_time, info.Teacher, info.Class_time, info.Place, info.End_choose_date, info.Start_date, info.End_date, info.Status,info.Lesson_id);

        }
        private DateTime getEndChooseDate()
        {
            
            String tem = EndChooseDate.Date.ToString("yyyy-MM-dd HH:mm:ss").Substring(0, 10) + " 23:59:59";
            DateTime res = Convert.ToDateTime(tem);
            return res;

        }
        private void InitControlValuesForNew()
        {

        }
        private void InitControlValuesForEdit(int lessonId)
        {
            train_lesson_basicInfo info = bEdit.select_info(lessonId);

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

            btnSave.Enabled = true;

        }


        
        /// <summary>
        /// 删除之前检查该类型是否被使用
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GV_SmallType_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {


        }
        /// <summary>
        /// 插入之前，检测名称同一类型下不允许重复，过程参数编码不允许重复
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>

        /// <summary>
        /// 指定产品的质量编辑操作
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        //<summary>
        //提示对话框
        //</summary>
        //<param name="msg"></param>
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

        protected void btnEndCourse(object sender, EventArgs e)
        {

        }
        protected void btnEndSelect(object sender, EventArgs e)
        {

        }
        protected void btnStartSelect(object sender, EventArgs e)
        {

        }
    }
}