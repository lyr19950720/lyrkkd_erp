using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.welcome.configure
{
    public partial class ShowContent : System.Web.UI.Page
    {
        FirstPageDBServer server = new FirstPageDBServer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count > 0)
            {
                string key = Convert.ToString(Request.QueryString["key"]);
                //获取内容信息
                P_Content content = server.getContentInfoById(Convert.ToInt32(key));
                //获取该内容下的图片信息
                List<P_File> images = server.getFilesByContentID(content.ID,1);//1代表图片
                //获取内容下所有文件的集合（不包含图片）
                List<P_File> files = server.getFilesByContentID(content.ID, 0);//0代表文件
                if (content != null)
                {
                    this.TitleLabel.Text = content.Title;//设置标题
                    if (content.Content!=null)
                    {
                        setContent(content.Content, images, files);//设置位置信息
                    }

                    
                }
                else
                {
                    showMessage("不存在id为"+key+"的内容信息！");
                }
            }
        }
        /// <summary>
        /// 设置正文
        /// </summary>
        /// <param name="content"></param>
        /// <param name="images"></param>
        public void setContent(string content, List<P_File> images, List<P_File> files)
        {
            int []array=new int[images.Count];//存储图片应该显示的位置
            int []accord=new int[images.Count];//记录已经图片的索引 将值设为1
            for (int i = 0; i < images.Count; i++)
            {
                int location = -1;
                if (images[i].Location == "" || images[i].Location == null)
                {
                    location = 0;
                }
                else
                {
                    location = content.IndexOf(images[i].Location) + images[i].Location.Length;//图片位置
                }
                array[i] = location;
            }
            int initIndex = 0;
            for (int i = 0; i < images.Count; i++)
            {
                //获取array中的第一个最小值
                int index = getMinValue(accord,array);//最小值索引 去该索引出的图片
                string preContent = content.Substring(initIndex, array[index] - initIndex);
                this.contentdiv.InnerHtml += "<div>";
                //分割字符串
                if(preContent.Contains("|"))
                {
                    string[] contentArr = preContent.Split('|');
                    foreach (string item in contentArr)
                    {
                        this.contentdiv.InnerHtml += item + "<br />";
                    }
                }
                else
                {
                     this.contentdiv.InnerHtml +=preContent;
                }
                this.contentdiv.InnerHtml += "</div>"; //添加图片之前的文字
                this.contentdiv.InnerHtml += "<div style='text-align:center'><img style='width:60%;height:500px' src=" + "img/" + images[index].Path + " /></div>";
                initIndex=array[index];
            }
            //将剩余的内容天加到内容区域中
            if (initIndex <= content.Length)
            {
                string endcontent= content.Substring(initIndex, content.Length - initIndex);
                //分割字符串
                if (endcontent.Contains("|"))
                {
                    string[] contentArr = endcontent.Split('|');
                    foreach (string item in contentArr)
                    {
                        this.contentdiv.InnerHtml += item + "<br />";
                    }
                }
                else
                {
                    this.contentdiv.InnerHtml += endcontent;
                }
            }
            this.contentdiv.InnerHtml += "<br />";
            //天加文件下载
            for(int i=0;i<files.Count;i++)
            {
                this.contentdiv.InnerHtml += "<a href='"+"file//"+files[i].Path+"'>"+files[i].Path+"</a><br />";
            }
        }
        /// <summary>
        ///获取没有被记录的最小值的索引
        /// </summary>
        /// <param name="record"></param>
        /// <param name="array"></param>
        /// <returns></returns>
        public int getMinValue(int[] record, int[] array)
        {
            int minValue = -1;//记录没有被记录的最小值
            int minValueIndex = -1;//记录其索引
            for (int i = 0; i < array.Length; i++)
            {
                if (minValue == -1)//还没找到最小值
                {
                    if (record[i] != 1)//该位置没有被记录
                    {
                        minValue = array[i];//将当前值暂时设置为最小值
                        minValueIndex = i;
                    }
                }
                else//minValue已有值
                {
                    if (record[i] != 1)
                    {
                        if (array[i] < minValue)//发现更小的值
                        {
                            minValue = array[i];
                            minValueIndex = i;
                        }
                    }
                }
            }
            record[minValueIndex] = 1;//标记最小值的索引
            return minValueIndex;//返回最小值的索引
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