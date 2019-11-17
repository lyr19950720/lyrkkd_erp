using DigitalSystem.train.cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.train
{
    public partial class CourseInfo : System.Web.UI.Page
    {
        train_courseDataContext context = new train_courseDataContext();
        train_courseDataContext kkdb = new train_courseDataContext();
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
                if (Request.UrlReferrer != null)
                {
                    ViewState["UrlReferrer"] = Request.UrlReferrer.ToString();
                }
                int lessonId = Convert.ToInt32(Request["Id"]);
              

                if (lessonId != -1)   //projectedit页面定死的，"-1"为"新建"状态
                {
                    //HF_SupplierID.Value = context.train_lesson_basicInfo.SingleOrDefault(item => item.Id == lessonId).Id.ToString();
                    InitControlValuesForEdit(lessonId);
                    hide_lesson_id.Value = lessonId.ToString();
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
            Response.Write("<script language=javascript>window.location.href=document.URL;</script>"); 

        }
        private void SaveInfoAndTab()
        {
            
            int lessonId = Convert.ToInt32(Request["Id"]);
            
            train_course info = context.train_course.Single(i => i.Id == lessonId);

            info.Class_time = Class_time.Text;
            info.End_choose_date = getEndChooseDate();
            info.End_date = end_date.Date;
            info.Place = Place.Text;
            info.Teacher = Convert.ToInt32(Teacher.Value);
            info.Start_date = start_date.Date;
            context.SubmitChanges();
           Response.Write("<script>window.parent.document.getElementById('mainsplitter_RefreshBtn').click();</script>");
        }
        private DateTime getEndChooseDate()
        {

            String tem = EndChooseDate.Date.ToString("yyyy-MM-dd HH:mm:ss").Substring(0, 10) + " 23:59:59";
            return Convert.ToDateTime(tem);

        }
        private void InitControlValuesForNew()
        {

        }
        private void InitControlValuesForEdit(int id)
        {
            train_course_view info = context.train_course_view.Single(i => i.Id == id);
            if (info == null) return;
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
            Class_time.Text = info.Class_time;
            start_date.Date = info.Start_date;
            end_date.Date = info.End_date;
            EndChooseDate.Date = info.End_choose_date;

            Teacher.Value = info.Teacher;
            TeacherType.DataBind();

            Status.Value = info.Status;
            Status.DataBind();
            Status.Enabled = false;
            CourseStatus.DataBind();
            Create_time.Text = info.Create_time.ToString();
            Create_time.Enabled = false;





        }
        

       
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var courseId = Convert.ToInt32(Request["Id"]);
             // 先判断类型下是否还有类型

             var recordList = context.GetTable<Employee_train_record>();
             if (recordList.Any(i => i.Course_id  ==  courseId))
             {
                 showMessage("有学员选课，请先删除学员");
                 return;
             }
             else
             {

                 train_course info = context.train_course.Single(i => i.Id == courseId);
                 context.train_course.DeleteOnSubmit(info);
                 context.SubmitChanges();
                 Response.Write("<script>window.parent.document.getElementById('mainsplitter_RefreshBtn').click();</script>");
                
             }

            // Response.Write("<script>alert(window.parent.location);</script>");
            
           // Response.Write()
            //Response.Write(123);
            //Course.test();
          //  Response.Write("<script language=javascript>window.location.href=document.URL;</script>"); 
             // ASPxGridView1.DataBind();

   

        
        }


        //public void New_By_Department(object sender, EventArgs e)
        //{
        //    int departmentId = Convert.ToInt32(Department.Value);
        //    List<S_User_Info> userList = new List<S_User_Info>();
        //    var UserArray = kkdb.GetTable<S_User_Info>();
        //    var users = from t in UserArray
        //                where t.DepartmentId == departmentId
        //                select t;
        //    List<Train_Employee_User_view> allUser = findAllUser(Convert.ToInt32(Request["Id"]));
        //    List<int> allUsrId = getIds(allUser);
        //    if (users != null)
        //    {
        //        foreach (var t in users)
        //        {
        //            if (!allUsrId.Contains(t.id))
        //            {
        //                insert_Employee_Train_Record(t.id);
        //            }
        //        }
        //    }
        //    ASPxGridView2.DataBind();

        //}

        //private void insert_Employee_Train_Record(int userId)
        //{
        //    Employee_train_record r = new Employee_train_record();
        //    r.Course_id = Convert.ToInt32(Request["Id"]);
        //    r.Employee_id = userId;
        //    r.Grade = 0;

        //    kkdb.Employee_train_record.InsertOnSubmit(r);
        //    kkdb.SubmitChanges();

        //}

        // 查找符合类型的所有产品
        public List<Train_Employee_User_view> findAllUser(int courseId)
        {
            List<Train_Employee_User_view> userList = new List<Train_Employee_User_view>();

            var UserArray = kkdb.GetTable<Train_Employee_User_view>();
            var users = from t in UserArray
                        where t.Course_id == courseId
                        select t;
            foreach (var i in users)
            {
                userList.Add(i);

            }

            return userList;
        }

        private List<int> getIds(List<Train_Employee_User_view> usrs)
        {
            List<int> res = new List<int>();
            foreach (var i in usrs)
            {
                res.Add(i.Employee_id);

            }
            return res;
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

       
        protected void btnEndSelect(object sender, EventArgs e)
        {

        }
        protected void btnStartSelect(object sender, EventArgs e)
        {

        }

        protected void ASPxPageControl1_ActiveTabChanged(object source, DevExpress.Web.ASPxTabControl.TabControlEventArgs e)
        {

        }

        protected void AddLearner_Load(object sender, EventArgs e)
        {
            
        }

        //protected void AddSingleEmploy(object sender, EventArgs e)
        //{
        //    int UserId = Convert.ToInt32(AddSingleEmployeeUserId.Value);
          
        //    insert_Employee_Train_Record(UserId);
        //    ASPxGridView2.DataBind();
        //}

        protected void AddSingleEmployeeDepartmentId_SelectedIndexChanged(object sender, EventArgs e)
        {
            //int Id = Convert.ToInt32(AddSingleEmployeeDepartmentId.Value);
            //hide_department_id.Value = Id.ToString();

            //AddSingleEmployeeUserId.DataBind();
            //AddSingleEmployeeUserId.Enabled = true;
            //AddSingleEmployeeUserId.Text = "";
            //AddSingleEmployeeDepartmentId.Enabled = true;


        }

        protected void AddSingleEmployeeUserId_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void User_select(object sender, LinqDataSourceSelectEventArgs e)
        {

        }

        protected void AddSingleEmployeeUserId_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}