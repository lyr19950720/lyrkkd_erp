using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.welcome.configure
{
    public partial class EditContent : System.Web.UI.Page
    {
        FirstPageDBServer server = new FirstPageDBServer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString.Count > 0)
                {
                    string key = Convert.ToString(Request.QueryString["key"]);
                    this.HF_Key.Value = key;//设置隐藏域
                    //根据key，还设置memo的文本
                    string content = server.getContentById(Convert.ToInt32(key));
                    this.ContentMemo.Text = content;
                }
            }
        }
        /// <summary>
        /// 保存内容的文本
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void SaveBtn_Click(object sender, EventArgs e)
        {
            if (this.editdiv.Visible == true)
            {
                if (this.HF_Key.Value != "")
                {
                    server.saveContent(Convert.ToInt32(this.HF_Key.Value), this.ContentMemo.Text);
                    showMessage("已保存！");
                }
                else
                {
                    showMessage("请在左侧选择内容！");
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
        /// <summary>
        /// 查看内容+图片+文件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void LookBtn_Click(object sender, EventArgs e)
        {
            if (this.HF_Key.Value == "")
            {
                showMessage("请在左侧选择要显示的内容！");
                return;
            }

            if (this.LookBtn.Text == "查看")
            {
                this.editdiv.Visible = false;
                this.showdiv.Visible = true;
                this.showcontenttd.InnerHtml = "<iframe src='ShowContent.aspx?key=" + this.HF_Key.Value + "' style='border:none;width:100%;height:420px'></iframe>";
                //this.iframe.Src = "ShowContent.aspx?key=" + this.HF_Key.Value;
                this.LookBtn.Text = "编辑内容";
            }
            else
            {
                this.editdiv.Visible = true;
                this.showdiv.Visible = false;
                this.LookBtn.Text = "查看";
            }
        }
        /// <summary>
        /// 上传图片或文件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void UpLoadBtn_Click(object sender, EventArgs e)
        {
            //输入校验
            if (this.HF_Key.Value == "")
            {
                showMessage("请在左侧选择文件所属的内容！");
                return;
            }
            if (this.FU.FileName=="")//选择的没有文件
            {
                showMessage("请选择文件！");
                return;
            }
            if (this.FileTypeBox.Text == "")
            {
                showMessage("请选择文件类型！");
                return;
            }
            string fileName = this.FU.FileName;//文件名
            string fileType = this.FileTypeBox.Text.Trim();//获取文件类别 图片或文件
            string fileExtend = fileName.Contains(".") ? fileName.Split('.')[1] : "";//文件扩展名
            if (fileType == "图片")//若是图片，则文件扩展名必须是图片的格式
            {
                if (fileExtend != "png" && fileExtend != "jpg" && fileExtend != "gif" && fileExtend != "jpeg")
                {
                    showMessage("该文件不是图片！");
                    return;
                }
            }

            //----------一切都正确，将文件保存到服务器，并将文件的路径保存到数据库
            string location = this.LocationText.Text;//图片位置
            string filePath = "";//服务器端文件存放路径
            if (fileType == "图片")
            {
                filePath = Server.MapPath("/welcome/configure/img");
            }
            else
            {
                filePath = Server.MapPath("/welcome/configure/file");
            }
            //判断路径是否存在，若不存在则创建
            if (!Directory.Exists(filePath))
            {
                Directory.CreateDirectory(filePath);
            }
            //存文件
            this.FU.PostedFile.SaveAs(filePath + "\\" + fileName);
            //数据库 
            server.saveFilePath(Convert.ToInt32(this.HF_Key.Value), fileName, location, Convert.ToInt32(this.FileTypeBox.Value));
            showMessage("上传成功！");
        }

    }
}