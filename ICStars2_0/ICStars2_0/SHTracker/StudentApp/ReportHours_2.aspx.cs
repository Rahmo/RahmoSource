using System;
using System.Linq;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Common;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Items;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.StudentApp
{
    [Authorize(Roles = "Student", UnauthorizedRedirectUrl = "/Account/Student/Login")]
    public partial class ReportHours_2 : System.Web.UI.Page
    {
        [Dependency]
        public IStudentFactory StudentFactory { get; set; }
        [Dependency]
        public ICourseFactory CourseFactory { get; set; }

        public IEnumerable<SelectListItem> CourseNameList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //If view hours, change the button text to "View Hours"
            if(!string.IsNullOrEmpty(Request.QueryString["t"]) && Request.QueryString["t"].Equals("v"))
            {
                btnSubmit.Text = "View Hours";
            }
            if (!IsPostBack)
            {
                string dpu_id = string.Empty;
                //Encryption in each page will be expired 30 minutes from time of login.
                try
                {
                    dpu_id = Common.EncryptDecryptHelper.Decrypt(Request.QueryString["d"], Const.DynamicKey);
                }
                catch
                {

                    Response.Clear();
                    Response.Write("Request is not authorized or expired! <a href=\"Default.aspx\">Return</a>");
                    Response.End();
                    return;
                }
                var quarterYear = Request.QueryString["q"];
                CourseNameList = CourseFactory.BuildCourseSeleteListItems(-1,
                                                                          new CourseCollectionSettings
                                                                              {
                                                                                  Quater_Year = quarterYear,
                                                                                  DPU_ID = dpu_id,
                                                                                  CourseType = CourseType.All
                                                                              });
                //If we haven't setup courses for current quarter, it won't let students report their hours.
                if (CourseNameList.Count() == 0)
                {
                    btnSubmit.Enabled = false;
                    Panel1.Visible = true;
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            var courseid =Request.Form["CourseID"];
            //Course error
            if (string.IsNullOrEmpty(courseid))
            {
                Panel1.Visible = true;
                return;
            }
            var course = CourseFactory.Create(Convert.ToInt32(courseid));
            //If placement course, go to placement page;if CSSP, go to CSSP page.
            var pagename = course.CourseType == CourseType.CSSP ? "ReportHours_3_cssp.aspx" : "ReportHours_3.aspx";
            courseid = Server.UrlEncode(Common.EncryptDecryptHelper.Encrypt(courseid, Const.DynamicKey));
            if (!string.IsNullOrEmpty(Request.QueryString["t"]) && Request.QueryString["t"].Equals("v"))
            {
                Response.Redirect(string.Format("ViewHours_3.aspx{0}&ci={1}", Request.Url.Query, courseid));
                return;
            }
            Response.Redirect(string.Format("{2}{0}&ci={1}", Request.Url.Query, courseid, pagename));
        }
    }
}