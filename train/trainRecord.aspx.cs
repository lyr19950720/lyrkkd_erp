using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.train
{
    public partial class trainRedirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
           {
         
                int year = DateTime.Now.Year;// 取当前时间年 
 
                int j = 0;
                for (int i = year; i > year - 20; i--)
                {
                    ASPxComboBox1.Items.Add((year-j).ToString());
                    j++;
                    
                }
                ASPxComboBox2.Items.Add("上半年");
                ASPxComboBox2.Items.Add("下半年");
                ASPxComboBox3.Items.Add("进行中");
                ASPxComboBox3.Items.Add("已结课");
                ASPxComboBox3.Items.Add("待审核");
                ASPxComboBox3.Items.Add("驳回");
            }

        }

        protected void Select_Click(object s, EventArgs e)
        {
            //string number = Request.Form["Number"];
            ASPxGridView3.Visible = true;
            string number = (Number.InnerText).Trim();
            HiddenField4.Value = number;
           
             string ComboBox1Value = ASPxComboBox1.SelectedItem.ToString();
             DateTime d;
            DateTime d2;
           

            string ComboBox2Value = ASPxComboBox2.SelectedItem.ToString();
            HiddenField2.Value = ComboBox2Value;
            string ComboBox3Value = ASPxComboBox3.SelectedItem.ToString();
            HiddenField3.Value = ComboBox3Value;
         
            if (number != "")
                LinqDataSource3.Where = "Number=@course_number";
            if (ComboBox1Value != "年份")
            {
                d = new DateTime(Convert.ToInt32(ComboBox1Value), 1, 1);
                d2 = new DateTime(Convert.ToInt32(ComboBox1Value), 12, 31);
                    if (ComboBox2Value == "上半年") { 
                        d2 = new DateTime(Convert.ToInt32(ComboBox1Value), 6, 30);
                    }
                    if (ComboBox2Value == "下半年")
                    {
                        d = new DateTime(Convert.ToInt32(ComboBox1Value), 7, 1);
                    }
                    HiddenField1.Value = d.ToShortDateString();
                    HiddenField11.Value = d2.ToShortDateString();
                    if (LinqDataSource3.Where == "")
                        LinqDataSource3.Where = "End_date < @course_year_end and End_date> @course_year_start";
                    else
                        LinqDataSource3.Where += " and  End_date < @course_year_end and End_date> @course_year_start";

            }
            if (ComboBox3Value != "课程状态")
            {
                if (ComboBox3Value == "进行中")
                {
                    if (LinqDataSource3.Where == "")
                        LinqDataSource3.Where = "Status=1";
                    else
                        LinqDataSource3.Where += " and Status=1";
                }
                if (ComboBox3Value == "待审核")
                {
                    if (LinqDataSource3.Where == "")
                        LinqDataSource3.Where = "Status=2";
                    else
                        LinqDataSource3.Where += " and Status=2";
                }
                if (ComboBox3Value == "驳回")
                {
                    if (LinqDataSource3.Where == "")
                        LinqDataSource3.Where = "Status=5";
                    else
                        LinqDataSource3.Where += " and Status=5";
                }
                if (ComboBox3Value == "已结课")
                {
                    if (LinqDataSource3.Where == "")
                        LinqDataSource3.Where = "Status=3";
                    else
                    LinqDataSource3.Where += " and Status =3";
                }
            }
            
            mainsplitter.GetPaneByName("find_course").Size = Unit.Percentage(30); 
        }

        protected void btnRefresh_Click(object s, EventArgs e)
        {     
            ASPxGridView3.Visible = false;
           Number.Value = "";
            mainsplitter.GetPaneByName("find_course").Size = Unit.Percentage(5);   
        }

        protected void ASPxGridView1_HtmlRowPrepared(object s, DevExpress.Web.ASPxGridView.ASPxGridViewTableRowEventArgs e)
        {
            //    int lessonid =Convert.ToInt32(e.GetValue("Lesson_id"));
            //    Response.Write(lessonid);
            //  Response.Redirect("train_course_details.aspx?Lesson_id=" + lessonid);
            // Response.Redirect("train_course_select.aspx?Lesson_id=" + lessonid);

        }
    }
}