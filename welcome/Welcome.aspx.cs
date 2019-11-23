using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DigitalSystem.welcome;

namespace DigitalSystem
{
    public partial class Welcome : System.Web.UI.Page
    {
        FirstPageDBServer server = new FirstPageDBServer();
        protected void Page_Load(object sender, EventArgs e)
        {
            //获取所有可用区域
            List<P_Area> areas = server.getAreas();
            //获取区域样式
            string style = server.getAreaStyle();
            //判断区域个数是否样式数字之和一致，若不一致，则提示用户进入配置界面配置样式
            if (judgeStyle(areas.Count, style))
            {
                //展示页面
                setWelcome(areas, style);
            }
            else
            {
                showMessage("请进入配置界面更新样式！");
            }
        }
        /// <summary>
        /// 根据样式和所给区域展示样式
        /// </summary>
        /// <param name="areas"></param>
        /// <param name="style"></param>
        public void setWelcome(List<P_Area> areas,string style)
        {
            int index = 0;//记录当前未被显示区域的索引
            int maxcontentnumber = 6;//每个区域最多显示6条纪录
            for (int i = 0; i < style.Length; i++)
            {
                int cols = Convert.ToInt32((style[i]+""));//第一行div个数
                //--------------------区域table开始-------------------
                this.maindiv.InnerHtml += "<table class='divtable'><tr>";
                for (int j = index; j <index+ cols; j++)
                {
                    this.maindiv.InnerHtml += "<td class='divtd' style='width:"+areas[j].Width+"'>";//列的宽度等于区域的宽度
                    if (areas[j].Name != "login")//不是登录所在的div
                    {
                        //获取该区域下第一个可用的功能名称

                        P_Function function = server.getFirstEnableFunction(areas[j].ID);
                        if (function != null)//找到该功能，将该功能下可显示的内容加进来
                        {
                            //设置区域功能标题
                            //---------内容table开始---------------------
                            this.maindiv.InnerHtml += "<div class='contentdiv'><table class='contenttable'><tr class='functiontr'><td colspan=2 class='functiontd'>" + function.Name + "</td></tr>";
                            List<P_Content> contents = server.getEnableContents(function.ID);
                            if (contents.Count > 0)//有可显示内容，将内容天加到页面中区
                            {
                                for (int k = 0; k < contents.Count; k++)
                                {
                                    if (k < maxcontentnumber)//正常显示纪录
                                    {
                                        this.maindiv.InnerHtml += "<tr class='contenttr'><td class='titletd' style='width:90%'><a href='configure/ShowContent.aspx?key=" + contents[k].ID + "'>" + contents[k].Title + "</a></td>";//添加内容标题 标题以超链接的形式展示
                                        this.maindiv.InnerHtml += "<td class='timetd' style='width:10%'><span class='timespan'>" + (contents[k].Time + "").Split(' ')[0] + "</span></td></tr>";//添加内容时间
                                    }
                                    else//给出more超链接，
                                    {
                                        this.maindiv.InnerHtml += "<td class='moretd' colspan=2><a href='MoreInfo.aspx?functionID=" + function.ID + "&functionName="+function.Name+"'><-- more --></a></td></tr>";//添加内容时间
                                        break;//退出循环，不再加载数据
                                    }
                                 }
                            }
                            this.maindiv.InnerHtml += "</table></div>";
                            //----------内容table结束--------------------
                        }
                    }
                    else
                    {
                       this.maindiv.InnerHtml+="<iframe class='loginiframe' src='../NewLogin.aspx'></iframe>";
                    }
                    this.maindiv.InnerHtml += "</td>";//结束47行td
                }
                this.maindiv.InnerHtml += "</tr></table>";
                //-----------区域table结束----------------------------------------
                index += cols;
            }
        }
        /// <summary>
        /// 判断样式是否是新的，即样式中数字之和等于区域个数
        /// </summary>
        /// <param name="length"></param>
        /// <param name="style"></param>
        /// <returns></returns>
        public bool judgeStyle(int length, string style)
        {
            int sum = 0;
            for (int i = 0; i < style.Length; i++)
            {
                sum += Convert.ToInt32((style[i] + ""));
            }
            if (sum == length)
            {
                return true;
            }
            else
            {
                return false;
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