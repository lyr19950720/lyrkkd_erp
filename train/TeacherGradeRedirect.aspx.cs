using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.train
{
    public partial class TeacherGradeRedirect : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //项目编号
                if (Request.QueryString["Id"] != null)
                {
                    string pageAttr = Request.QueryString["pageAttr"].ToString();
                    string Id = Request.QueryString["Id"].ToString();
                    //跳转到响应的编辑页面
                    string redirectStr = parseRediectStr(Id, pageAttr);
                    if (redirectStr != null)
                    {
                        Response.Redirect(redirectStr);
                    }
                }
            }

        }
        //根据项目ID与项目类型ID解析出跳转的页面
        private string parseRediectStr(string Id, string pageAttr)
        {

            string rediectStr = null;
            if (pageAttr == "edit")
            {
                #region 编辑页跳转


                rediectStr = "TeacherGradeDetail.aspx?Id=" + Id;

                #endregion
            }
            return rediectStr;
        }
    }
}