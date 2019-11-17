using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace DigitalSystem.train
{
    public partial class train_myrecord : System.Web.UI.Page
    {  
        string login_name;
        int id;     
        train_courseDataContext db1 = new train_courseDataContext();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //string course_id = "";
          
                 login_name = Session["login_user_name"].ToString();
              //  login_name = "admin";
                ASPxGridView1.KeyFieldName = "Course_id";
                ASPxGridView1.SettingsBehavior.ProcessSelectionChangedOnServer = true;

                //查询用户id
                var EmployeeInfo = db1.GetTable<S_User_Info>();
                var employee_id = from t in EmployeeInfo
                                  where t.LoginName == login_name
                                  select t.id;
                foreach (var i in employee_id)
                {
                    Hidden2.Value = i.ToString();
                }     
                id = Convert.ToInt32(Hidden2.Value);
              //  var GradeInfo = db1.GetTable<train_personal_record_view>();

                int year = DateTime.Now.Year;// 取当前时间年 
                int j = 0;
                for (int i = year; i > year - 20; i--)
                {
                    ASPxComboBox1.Items.Add((year - j).ToString());
                    j++;
                }
                ASPxComboBox2.Items.Add("上半年");
                ASPxComboBox2.Items.Add("下半年");
              
            }
        }
        

        protected void ASPxGridView1_HtmlRowPrepared(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType != DevExpress.Web.ASPxGridView.GridViewRowType.Data) return;
            double s = Convert.ToDouble(e.GetValue("Grade"));

            if (s < 60 && s != 00)
            {
                e.Row.ForeColor = Color.Red;
                //e.Row.BackColor = Color.Red;
            }

        }
        protected void Select_Click(object s, EventArgs e)
        {
           // string number = (Number.InnerText).Trim();
          //  HiddenField4.Value = number;

            string ComboBox1Value = ASPxComboBox1.SelectedItem.ToString();
            DateTime d;
            DateTime d2;


            string ComboBox2Value = ASPxComboBox2.SelectedItem.ToString();
            HiddenField2.Value = ComboBox2Value;
       

 
            
            if (ComboBox1Value != "年份")
            {
                d = new DateTime(Convert.ToInt32(ComboBox1Value), 1, 1);
                d2 = new DateTime(Convert.ToInt32(ComboBox1Value), 12, 31);
                if (ComboBox2Value == "上半年")
                {
                    d2 = new DateTime(Convert.ToInt32(ComboBox1Value), 6, 30);

                }
                if (ComboBox2Value == "下半年")
                {
                    d = new DateTime(Convert.ToInt32(ComboBox1Value), 7, 1);
                }
                HiddenField1.Value = d.ToShortDateString();
                HiddenField11.Value = d2.ToShortDateString();
                LinqDataSource1.Where += " and  End_date < @course_year_end and End_date> @course_year_start";

            }
            
        }

        protected void btnRefresh_Click(object s, EventArgs e)
        {
            Response.Write("<script language=javascript>window.location.href=document.URL;</script>"); 
        }
       
    }
}