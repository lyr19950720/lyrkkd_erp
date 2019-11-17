using DigitalSystem.train.cs;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.train
{
    public partial class CheckGradeInfo : System.Web.UI.Page
    {
        trainCourseDB coursedb = new trainCourseDB();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Pass_Click(object sender, EventArgs e)
        {
            coursedb.update_course_status(Convert.ToInt32(Request["Id"]), 3);
            Response.Write("<script>window.parent.document.getElementById('mainsplitter_RefreshBtn').click();</script>");
            
        }

        protected void No_Pass_Click(object sender, EventArgs e)
        {
            coursedb.update_course_status(Convert.ToInt32(Request["Id"]), 4,Suggest.Text);
            Response.Write("<script>window.parent.document.getElementById('mainsplitter_RefreshBtn').click();</script>");
            
        }
    }
}