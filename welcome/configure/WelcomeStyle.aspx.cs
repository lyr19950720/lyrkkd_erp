using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.welcome.configure
{
    public partial class WelcomeStyle : System.Web.UI.Page
    {
        FirstPageDBServer server = new FirstPageDBServer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count > 0)
            {
                string style = Convert.ToString(Request.QueryString["style"]).Trim();
                //将该值存入数据库
                server.saveAreaStyle(style);
                setStyle(style);
            }
        }
        public void setStyle(string style)
        {
            //获取所有的区域
            List<P_Area> areas = server.getAreas();
            int index = 0;//记录用到的区域索引
            //获取每一位数字，来确定每一行的列数,设置stylediv的内容
            for (int i = 0; i < style.Length; i++)
            {
                int value = Convert.ToInt32(style[i]+"");//每一位数字
                if (i == 0)//登录div所在行
                {
                    this.stylediv.InnerHtml += "<table class='logintable'><tr>";
                }
                else
                {
                    this.stylediv.InnerHtml += "<table class='contenttable'><tr>";
                }
                for (int j = index; j < index+value; j++)//配置每行的div
                {
                    this.stylediv.InnerHtml += "<td style='width:" + areas[j].Width + "'><div style='text-align:center;' id='" + areas[j].Name + "'>" + areas[j].Name + "</div></td>";
                }
                index += value;
                this.stylediv.InnerHtml += "</tr></table>";
            }


        }
    }
}