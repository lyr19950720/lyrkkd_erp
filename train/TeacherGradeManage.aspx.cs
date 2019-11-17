using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.train
{
    public partial class TeacherGradeManage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void RefreshBtn_Click(object sender, EventArgs e)
        {
            gridEditList.DataBind();
        }
    }
}