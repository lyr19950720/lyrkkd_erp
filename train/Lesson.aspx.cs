using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.train
{
    public partial class Lesson : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        #region 初始化 ASPxPageControl
        #endregion
        protected void btnSave_Click(object sender, EventArgs e)
        {
        }
        private void SaveInfoAndTab()
        {

        }

        private void InitControlValuesForNew()
        {

        }
        private void InitControlValuesForEdit(int supplierInfoId)
        {


        }


        //删除正在编辑的供应商信息
        protected void btnDelete_Click(object sender, EventArgs e)
        {

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

        protected void RefreshBtn_Click(object sender, EventArgs e)
        {
            gridEditList.DataBind();
           
            gridEditList.PageIndex = 0;
            
            UpdatePanel1.Update();
            
        }
    }
}