using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.train
{
    public partial class LessonRedirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //项目编号
                if (Request.QueryString["lessonId"] != null)
                {
                    string pageAttr = Request.QueryString["pageAttr"].ToString();
                    string lessonId = Request.QueryString["lessonId"].ToString();
                    //跳转到响应的编辑页面
                    string redirectStr = parseRediectStr(lessonId, pageAttr);
                    if (redirectStr != null)
                    {
                        Response.Redirect(redirectStr);
                    }
                }
            }

        }
        //根据项目ID与项目类型ID解析出跳转的页面
        private string parseRediectStr(string lessonId, string pageAttr)
        {

            string rediectStr = null;
            if (pageAttr == "edit")
            {
                #region 编辑页跳转


                rediectStr = "LessonDetail.aspx?lessonId=" + lessonId;

                #endregion
            }
            return rediectStr;
        }
    }
}