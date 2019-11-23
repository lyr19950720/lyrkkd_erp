using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.welcome
{
    public partial class ContentManage : System.Web.UI.Page
    {
        FirstPageDBServer server = new FirstPageDBServer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 设置内容是否可用 0表示不可用，1表示可用
        /// </summary>
        /// <param name="enable"></param>
        /// <returns></returns>
        public string getContentEnable(object enable)
        {
            try
            {
                int e = Convert.ToInt32(enable);
                if (e == 0)
                {
                    return "否";
                }
                else if (e == 1)
                {
                    return "是";
                }
                else
                {
                    return "";
                }

            }
            catch (Exception)
            {

                return "";
            }
        }
        /// <summary>
        /// 删除之前，检查该内容下是否包含图片
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GV_Content_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int key = Convert.ToInt32(e.Keys[0]);
            if (server.judgeContentContainsFile(key))
            {
                //删除其包含的图片或文件
                server.deleteFiles(key);
            }

        }
        /// <summary>
        /// 插入之前，检查标题是否为空，功能名称可以为空，标题允许重复
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GV_Content_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            string title = Convert.ToString(e.NewValues[0]).Trim();
            if (title == "")
            {
                e.Cancel = true;
                showMessage("请输入内容标题！");
            }
        }
        /// <summary>
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GV_Content_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            string title = Convert.ToString(e.NewValues[0]).Trim();
            if (title == "")
            {
                e.Cancel = true;
                showMessage("请输入内容标题！");
            }
        }
        /// <summary>
        /// 弹出提示对话框
        /// </summary>
        /// <param name="msg"></param>
        public void showMessage(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), this.UniqueID, "alert('" + msg + "')", true);
        }
    }
}