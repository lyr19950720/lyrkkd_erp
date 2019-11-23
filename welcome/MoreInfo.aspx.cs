using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace DigitalSystem.welcome
{
    public partial class MoreInfo : System.Web.UI.Page
    {
        FirstPageDBServer server = new FirstPageDBServer();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.QueryString.Count > 0)
            {
                int functionID = Convert.ToInt32(Request.QueryString["functionID"]);
                string functionName = Convert.ToString(Request.QueryString["functionName"]);
                List<P_Content> contents = server.getEnableContents(functionID);
                this.maindiv.InnerHtml += "<table><tr class='functiontr'><td colspan=2>"+functionName+"</td></tr>";
                for (int i = 0; i < contents.Count; i++)
                {
                    this.maindiv.InnerHtml += "<tr><td class='titletd' style='width:90%'><a href='configure/ShowContent.aspx?key=" + contents[i].ID + "'>" + contents[i].Title + "</td>";
                    this.maindiv.InnerHtml += "<td class='timetd' style='width:10%'><span class='timespan'>"+(contents[i].Time+"").Split(' ')[0]+"</span></td></tr>";
                }
            }
        }
    }
}