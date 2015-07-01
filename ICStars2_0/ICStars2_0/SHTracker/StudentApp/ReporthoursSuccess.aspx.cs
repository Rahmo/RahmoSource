using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.Common;
using ICStars2_0.Common.Attributes;

namespace ICStars2_0.SHTracker.StudentApp
{
    [Authorize(Roles = "Student", UnauthorizedRedirectUrl = "/Account/Student/Login")]
    public partial class ReporthoursSuccess : System.Web.UI.Page
    {
        public string ReportedHours { get; set; }
        public string TotalReortedHours { get; set; }
        public string CBOName { get; set; }
        public string CourseName { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //Encryption in each page will be expired 30 minutes from time of login.
            try
            {
                ReportedHours = EncryptDecryptHelper.Decrypt(Request.QueryString["h"], Const.DynamicKey);
                TotalReortedHours = EncryptDecryptHelper.Decrypt(Request.QueryString["th"], Const.DynamicKey);
                CBOName = EncryptDecryptHelper.Decrypt(Request.QueryString["cbo"], Const.DynamicKey);
                CourseName = EncryptDecryptHelper.Decrypt(Request.QueryString["course"], Const.DynamicKey);
            }catch
            {

                Response.Clear();
                Response.Write("Request is not authorized or expired! <a href=\"Default.aspx\">Return</a>");
                Response.End();
                return;
            }
        }
    }
}