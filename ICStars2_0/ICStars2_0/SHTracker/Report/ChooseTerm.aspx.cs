using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.Common.Attributes;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Report
{
    [Authorize(Roles = "admin,admin_report,Staff,Professor,CSSP,SLC")]
    public partial class ChooseTerm : System.Web.UI.Page
    {

        [Dependency]
        public IUserData UserData { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (User.IsInRole("CSSP"))
            {
                Response.Redirect("MyCourse.aspx");
            }
        }
        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyCourse.aspx?term=" + Server.UrlEncode(Request.Form["ddlQuarterYear"]));
        }
    }
}