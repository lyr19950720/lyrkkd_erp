using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.train
{
    public partial class CheckGrade : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            dbDataContext db1 = new dbDataContext();
            var departmentInfo = db1.GetTable<S_Department_Info>();
            var departmentid = from t in departmentInfo
                                where t.DepartmentName == "培训部"
                                select t.id;
            foreach (var i in departmentid)
            {
            //    Response.Write(i);
                HiddenField1.Value =i.ToString();   

            }
          
        }
        protected void RefreshBtn_Click(object sender, EventArgs e)
        {
            gridEditList.DataBind();
            gridEditList1.DataBind();
        }
    }
}