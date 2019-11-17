using DigitalSystem.train.cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace DigitalSystem.train
{
    public partial class LessonDetail : System.Web.UI.Page
    {
        train_courseDataContext context = new train_courseDataContext();
        LessonDB bEdit = new LessonDB();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int lessonId = Convert.ToInt32(Request["lessonId"]);

                if (lessonId != -1)   //projectedit页面定死的，"-1"为"新建"状态
                {
                    HF_SupplierID.Value = context.train_lesson_basicInfo.SingleOrDefault(item => item.Id == lessonId).Id.ToString();
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
            //Response.Write("<script>window.parent.document.getElementById('mainsplitter_RefreshBtn').click();</script>");
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "updateScript",
           // "<script>window.parent.document.getElementById('mainsplitter_RefreshBtn').click();</script>", false);
            Response.Write("<script>window.parent.document.getElementById('mainsplitter_RefreshBtn').click();</script>");
        }
        private void SaveInfoAndTab()
        {
            train_lesson_basicInfo info = new train_lesson_basicInfo();
            info.Name = Name.Text.Trim();
            info.Number = Number.Text.Trim();
            info.Time = Convert.ToInt32(Time.Text.Trim());
            info.Type = Convert.ToInt32(Type.Value);
            info.Description = Description.Text.Trim();
            int lessonId = Convert.ToInt32(Request["lessonId"]);
            if(lessonId == -1)
            {
                bEdit.insert_lesson_basicInfo(info.Number, info.Name, info.Time, info.Type, info.Description);
            }
            else
            {
                bEdit.update_lesson_basicInfo(lessonId, info.Number, info.Name, info.Time, info.Type, info.Description);
            }
            
        }

        private void InitControlValuesForNew()
        {

        }
        private void InitControlValuesForEdit(int lessonId)
        {
            train_lesson_basicInfo info = bEdit.select_info(lessonId);
            Name.Text = info.Name;
            Name.Enabled = true;
            Number.Text = info.Number;
            Number.Enabled = true;
            Time.Text = info.Time.ToString();
            Time.Enabled = true;
            Description.Text = info.Description;
            Description.Enabled = true;
            
            Type.Value = info.Type;
            Type.Enabled = true;
            Type.DataBind();

            LinqDataSource1.DataBind();
            btnSave.Enabled = true;
            //btnSubmit.Enabled = false;
            btnDelete.Enabled = true;

        }


        //删除正在编辑的供应商信息
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            int lessonId = Convert.ToInt32(Request["lessonId"]);
            if (lessonId == -1)   //为"新建"状态
            {
                Response.Write("<script>window.parent.document.getElementById('mainsplitter_RefreshBtn').click();</script>");
            }
            else   //删除编辑状态的项目信息
            {
                //bProjectEdit.Delete_MProjectInfoEdit(projectInfoId);
                bEdit.delete_lesson_basicInfo(lessonId);
                Response.Write("<script>window.parent.document.getElementById('mainsplitter_RefreshBtn').click();</script>");
            }
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