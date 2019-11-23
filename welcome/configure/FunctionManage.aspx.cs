using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.welcome
{
    public partial class FunctionManage : System.Web.UI.Page
    {
        FirstPageDBServer server = new FirstPageDBServer();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// 设置功能是否可用 0表示不可用，1表示可用
        /// </summary>
        /// <param name="enable"></param>
        /// <returns></returns>
        public string getFunctionEnable(object enable)
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
        /// 插入之前，检查名称是否重复，区域不允许为空，
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GV_Function_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            string name = Convert.ToString(e.NewValues[0]).Trim();//功能名称
            if (name == "")//名称为空
            {
                showMessage("功能名称不能为空！");
                e.Cancel = true;
                return;
            }
            if (e.NewValues[2] == null)//区域为空
            {
                showMessage("请选择功能所在区域！");
                e.Cancel = true;
                return;
            }
            if (server.judgeFunctionNameExist(name, Convert.ToInt32(e.NewValues[2])))
            {
                e.Cancel = true;
                showMessage("改区域下该功能名称已存在，不能插入！");
            }
        }
        /// <summary>
        /// 删除之前检查该功能下是否存在内容
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GV_Function_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int key = Convert.ToInt32(e.Keys[0]);
            if (server.judgeFunctionContainsContent(key))
            {
                showMessage("该功能下有内容，不能删除！");
                e.Cancel = true;
            }
        }
        /// <summary>
        /// 更新之前，检查名称是否重复
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GV_Function_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            string new_name = Convert.ToString(e.NewValues[0]).Trim();//新名称
            string old_name = Convert.ToString(e.OldValues[0]).Trim();//老名称
            int new_area = Convert.ToInt32(e.NewValues[2]);//新区域
            int old_area = Convert.ToInt32(e.OldValues[2]);//老区域
            if (new_area == old_area)//区域不变的情况下
            {
                if (new_name != old_name)//名称改变，看是否重复
                {
                    if (server.judgeFunctionNameExist(new_name, new_area))
                    {
                        e.Cancel = true;
                        showMessage("该区域下该功能名称已存在，不能更改！");
                        return;
                    }
                }
            }
            else//区域更改的情况下
            {
                if (server.judgeFunctionNameExist(new_name, new_area))
                {
                    e.Cancel = true;
                    showMessage("该区域下该功能名称已存在，不能更改！");
                }
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