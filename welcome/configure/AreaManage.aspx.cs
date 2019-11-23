using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.welcome
{
    public partial class AreaManage : System.Web.UI.Page
    {
        FirstPageDBServer server = new FirstPageDBServer();
        protected void Page_Load(object sender, EventArgs e)
        {
            //设置当前可显示区域个数
            this.areaNumberLabel.InnerHtml = getAreaNumber()+"";
            //设置区域样式
            string style = server.getAreaStyle();
            this.AreaStyleText.Text = style;
        }
        /// <summary>
        /// 返回区域的个数
        /// </summary>
        /// <returns></returns>
        public int getAreaNumber()
        {
            return server.getAreas().Count;
        }
        /// <summary>
        /// 设置区域是否可用 0表示不可用，1表示可用
        /// </summary>
        /// <param name="enable"></param>
        /// <returns></returns>
        public string getAreaEnable(object enable)
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
        /// 插入区域之前的操作 区域名称不允许重复，这是将来用作div的ID的，另外宽度不能为空
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GV_Area_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            string name = Convert.ToString(e.NewValues[0]).Trim();
            string width = Convert.ToString(e.NewValues[1]).Trim();
            if (name != "")//名称不允许为空
            {
                if (server.judgeAreaNameExist(name))//区域名称已存在
                {
                    e.Cancel = true;//取消插入
                    showMessage("该区域名称已存在！");
                    return;
                }
            }
            else
            {
                e.Cancel = true;//取消插入
                showMessage("区域名称不能为空！");
                return;
            }
            if (width == "")
            {
                e.Cancel = true;
                showMessage("区域所占屏幕百分比不能为空！");
                return;
            }
            this.areaNumberLabel.InnerHtml = (getAreaNumber() + 1) + "";
        }
        /// <summary>
        /// 弹出提示对话框
        /// </summary>
        /// <param name="msg"></param>
        public void showMessage(string msg)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), this.UniqueID, "alert('" + msg + "')", true);
        }
        /// <summary>
        /// 更新之前检查名字是否重复
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GV_Area_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            string new_name = Convert.ToString(e.NewValues[0]).Trim();
            string old_name = Convert.ToString(e.OldValues[0]).Trim();
            if (new_name != "")//名称不允许为空
            {
                if (new_name != old_name)
                {
                    if (server.judgeAreaNameExist(new_name))//区域名称已存在
                    {
                        e.Cancel = true;//取消更改
                        showMessage("该区域名称已存在！");
                    }
                }
            }
            else
            {
                e.Cancel = true;//取消更改
                showMessage("区域名称不能为空！");
            }
        }
        /// <summary>
        /// 删除之前，检查该区域下是否有功能
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GV_Area_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            int key =Convert.ToInt32(e.Keys[0]);
            if (server.judgeIsAreaContainsFunction(key))//该区域下有功能，不能删除
            {
                e.Cancel = true;
                showMessage("该区域下有功能，不能删除!");
                return;
            }
            this.areaNumberLabel.InnerHtml = (getAreaNumber()-1)+"";
        }
        /// <summary>
        /// 更新之后，设置可用区域数量
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GV_Area_RowUpdated(object sender, DevExpress.Web.Data.ASPxDataUpdatedEventArgs e)
        {
            this.areaNumberLabel.InnerHtml = (getAreaNumber()) + "";
        }

    }
}