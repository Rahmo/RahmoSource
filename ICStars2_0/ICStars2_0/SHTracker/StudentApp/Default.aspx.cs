using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.Common.Attributes;

namespace ICStars2_0.SHTracker.StudentApp
{
    [Authorize(Roles="Student",UnauthorizedRedirectUrl="/Account/Student/Login")]
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if(ddlAction.SelectedValue.Equals("0"))
            {
                ltlError.Text = "Please select an action!";
                return;
            }
            if (ddlAction.SelectedValue.Equals("1"))
            {
                Response.Redirect("ReportHours_1.aspx");
                return;
            }
            if (ddlAction.SelectedValue.Equals("2"))
            {
                Response.Redirect("ReportHours_1.aspx?t=v");
                return;
            }
        }
    }
}