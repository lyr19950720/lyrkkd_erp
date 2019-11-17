using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.train.floder
{
    public partial class AddLearner : System.Web.UI.Page
    {

        private train_courseDataContext kkdb = new train_courseDataContext();
        private List<int> usrs = new List<int>();
        private List<Train_Employee_User_view> allUser;
        private int courseId; 
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Write("<script>window.document.getElementById('hide_lesson_id').value=window.parent.document.getElementById('hide_lesson_id').value; alert(window.parent.document.getElementById('hide_lesson_id').value);" +
                "</script>");
            courseId =  Convert.ToInt32(hide_lesson_id.Value);
            allUser =  findAllUser(courseId);
            //hide_lesson_id.Value = courseId.ToString();
            LessonGridview.DataBind();


        }
       
   
        // 产品表的相关操作
        public void New_By_Department(object sender, EventArgs e)
        {
            int departmentId = Convert.ToInt32(Department.Value);
            List<S_User_Info> userList = new List<S_User_Info>();
            var UserArray = kkdb.GetTable<S_User_Info>();
            var users = from t in UserArray
                        where t.DepartmentId == departmentId
                        select t;

            List<int> allUsrId = getIds(allUser);
                if (users != null)
                {
                    foreach (var t in users)
                    {
                        if (!allUsrId.Contains(t.id))
                         {
                            insert_Employee_Train_Record(t.id);
                         }
                    }
                }
            

        }
        
        private void insert_Employee_Train_Record(int userId)
        {
            Employee_train_record r = new Employee_train_record();
            r.Course_id = courseId;
            r.Employee_id = userId;
            r.Grade = 0;

            kkdb.Employee_train_record.InsertOnSubmit(r);
            kkdb.SubmitChanges();

        }
 
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
        /// 提示对话框
        /// </summary>
        public void showMessage(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), this.UniqueID, "alert('" + msg + "')", true);
        }

       

    }
}
