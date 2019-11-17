using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.train
{
    public partial class train_course_details : System.Web.UI.Page
    {
        train_courseDataContext db1 = new train_courseDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
          
         //   int lessonid =   Convert.ToInt32(Request["Lesson_id"]);
        //    Response.Write(lessonid);
            int courseid = Convert.ToInt32(Request.QueryString["Course_id"].ToString());
            hidden.Value = courseid.ToString();
            InitControlValuesForEdit(courseid);
           if (HttpContext.Current.Request.UrlReferrer.PathAndQuery.ToString() == "/train/train_course_select.aspx")
            {
                ASPxPageControl1.Visible = false;
            }
            else
            {
                ASPxPageControl1.Visible = true;
                var EmployeeInfo = db1.GetTable<train_record_view>();
                //统计学员总人数
                var allInfo1 = from t in EmployeeInfo
                               where t.Course_id == Convert.ToInt32(courseid) 
                               select t;
                int count1 = 0;
                foreach (var i in allInfo1)
                    count1++;
              
                Students_num.Text = count1.ToString();
                //统计成绩合格的总人数
                var allInfo2 = from t in allInfo1
                               where t.Grade >= 60
                               select t;
                int count2 = 0;
                foreach (var i in allInfo2)
                    count2++;
                pass_num.Text = count2.ToString();
                //统计成绩不合格的总人数
                var allInfo3 = from t in allInfo1
                               where t.Grade >= 0 & t.Grade<60
                               select t;
                int count3 = 0;
                foreach (var i in allInfo3)
                    count3++;
                notpass_num.Text = count3.ToString();
            }
        }

        private void InitControlValuesForEdit(int id)
        {
            train_course_view info = db1.train_course_view.Single(i => i.Id == id);   
            if (info == null) return;
            Name.Text = info.Name;
            Name.Enabled = false;
            Number.Text = info.Number;
            Number.Enabled = false;
            Time.Text = info.Time.ToString();
            Time.Enabled = false;
            Description.Text = info.Description;
            Description.Enabled = false;
            
            train_lesson_type typeinfo = db1.train_lesson_type.Single(i=>i.id ==info.Type);
            if (typeinfo == null) return;
            Type.Value = typeinfo.lesson_type_name;
            Type.Enabled = false;

            train_lesson_content_type contentinfo= db1.train_lesson_content_type.Single(i => i.ID == info.ContentTypeId);
            ContentType.Value = contentinfo.TypeName;
            ContentType.Enabled = false;
    

            Place.Text = info.Place;
            Place.Enabled = false;
            Class_time.Text = info.Class_time;
            Class_time.Enabled = false;
            start_date.Text = info.Start_date.ToString();
            start_date.Enabled = false;
            end_date.Text = info.End_date.ToString();
            end_date.Enabled = false;
            EndChooseDate.Text = info.End_choose_date.ToString();
            EndChooseDate.Enabled = false;
            employeename.Value = info.employeename;
            employeename.Enabled = false;
            StatusName.Value = info.StatusName;
            StatusName.Enabled = false;
            Create_time.Text = info.Create_time.ToString();
            Create_time.Enabled = false;
        }
        protected void ASPxGridView3_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {

            if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
            double s = Convert.ToDouble(e.GetValue("Grade"));

            if (s < 60 && s != 00 )
            {
                e.Row.ForeColor = Color.Red;
                
            }             
        }
    }
}