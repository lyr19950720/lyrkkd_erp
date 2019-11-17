using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
namespace DigitalSystem.train
{
    public partial class train_course_select : System.Web.UI.Page
    {

        string login_name;
       
        train_courseDataContext db1 = new train_courseDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            
           login_name = Session["login_user_name"].ToString();
           // login_name = "admin";
         

           ASPxGridView2.KeyFieldName = "Course_id";
          
            string date = DateTime.Now.ToString();
            Hidden.Value = date;
            //string login_name = Session["login_user_name"].ToString();
           
           // Hidden2.Value = Session["Employee_Id"].ToString();
            //查询用户id
            
            var EmployeeInfo = db1.GetTable<S_User_Info>();
            var employee_id = from t in EmployeeInfo
                              where t.LoginName == login_name
                              select t.id;
         
            foreach (var i in employee_id)
            {
                //Response.Write(i);
                Hidden2.Value = i.ToString();
            }
            var recordsInfo = db1.GetTable<Employee_train_record>();
            var courseInfo = db1.GetTable<train_course_view>();
            

            var selectedInfo = from t in courseInfo
                               where (
                               from t1 in recordsInfo
                               where   t1.Employee_id == Convert.ToInt32(Hidden2.Value)
                               select t1.Course_id
                               ).Contains(t.Lesson_id)
                               select t.Lesson_id;

            foreach (var i in selectedInfo)
          {
            //   Response.Write(i.ToString());
        
                //LinqDataSource1.Where += " and  Lesson_id  != (16)";   
                //Hidden3.Value = i.ToString();
           }
           //LinqDataSource1.Where += " and  Lesson_id in selectedInfo";
            
        }
        protected void ASPxGridView3_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {

            if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
            double s = Convert.ToDouble(e.GetValue("Grade"));
  
            if (s < 60 && s!=00)
            {
                e.Row.ForeColor = Color.Red;
               
            }

        }

       protected void ASPxButton1_Click(object sender,EventArgs e)
        
       {


                int course_id = Convert.ToInt32(HiddenField1.Value);
              
                int employee_id = Convert.ToInt32(Hidden2.Value);
               // Employee_train_record Info = db.Employee_train_record.Single(i => i.Course_id == (course_id) & i.Employee_id == (employee_id));
                if (contains(course_id,employee_id).Count !=0)
                {
                    Response.Write("您已选该课程！");
                    return;
                } 
                    Employee_train_record record = new Employee_train_record();
                    record.Employee_id = Convert.ToInt32(Hidden2.Value);
                    record.Course_id = Convert.ToInt32(course_id);
                    record.Grade = null;
                    db1.Employee_train_record.InsertOnSubmit(record);
                    db1.SubmitChanges();
                   

                    Response.Write("<script language=javascript>window.location.href=document.URL;</script>"); 
             
                
           
            
        }
       private List<Employee_train_record> contains(int courseId, int employeeId)
       {
           train_courseDataContext kkdb = new train_courseDataContext();
           List<Employee_train_record> userList = new List<Employee_train_record>();
           var UserArray = kkdb.GetTable<Employee_train_record>();
           var users = from t in UserArray
                       where t.Course_id == courseId
                       where t.Employee_id == employeeId
                       select t;

           foreach (var i in users)
           {
               userList.Add(i);

           }

           return userList;
       }
       protected void ASPxButton2_Click(object sender, EventArgs e)
       {

           string course_id = HiddenField1.Value;
           string employee_id = Hidden2.Value;
           train_courseDataContext db = new train_courseDataContext();
           if (course_id != null )
           {
                List<Employee_train_record>  list = contains(Convert.ToInt32(course_id), Convert.ToInt32(employee_id) );
               if (list == null || list.Count ==0)
               {
                   Response.Write("未选择该课程！");
                   return;
               }
               Employee_train_record info = db.Employee_train_record.Single(i => i.Id == list[0].Id); ;
               db.Employee_train_record.DeleteOnSubmit(info);
               db.SubmitChanges();
               Response.Write("<script language=javascript>window.location.href=document.URL;</script>");
           }
           else {
               Response.Write("请您进行选课！");
           }
          
       
       }
       protected void ASPxGridView1_SelectionChanged(object sender, EventArgs e)
       {
          
           string[] s = { "Course_id"};
           List<object> keyValues = ASPxGridView1.GetSelectedFieldValues(s);
           HiddenField1.Value = keyValues[0].ToString();      
       }

       protected void ASPxGridView2_SelectionChanged(object sender, EventArgs e)
       {
           string[] s = { "Course_id" };
           List<object> keyValues = ASPxGridView2.GetSelectedFieldValues(s);
         
           HiddenField1.Value = keyValues[0].ToString();
       

       }

    }
}