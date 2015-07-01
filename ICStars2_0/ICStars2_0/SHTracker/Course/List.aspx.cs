using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Course
{
    [Authorize(Roles = "admin,admin_course,SLC,Staff,CSSP")]
    public partial class List : System.Web.UI.Page
    {
        private ICourseFactory _courseFactory;
        [Dependency]
        public ICourseFactory CourseFactory
        {
            get { return _courseFactory; }
            set { _courseFactory = value; }
        }

        public bool IsAuthorized { get; set; }

        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            IsAuthorized = User.IsInRole("admin") || User.IsInRole("admin_course") || User.IsInRole("CSSP");
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            CourseCollectionSettings settings = new CourseCollectionSettings();
            if (User.IsInRole("CSSP"))
            {
                settings.CourseType = CourseType.CSSP;
                
            }
            if (!string.IsNullOrEmpty(Request.QueryString["t"]) && Request.QueryString["t"].Equals("1"))
            {
                settings.CourseType = CourseType.CSSP;
            }
            rptList.DataSource = CourseFactory.CreateCourseCollection(1, 1000,settings);
            rptList.DataBind();
        }
        protected void lbtDeleteMember_Click(object sender, EventArgs e)
        {

            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            CourseFactory.Delete(id);
            Response.Redirect("List.aspx");
        }
        //
    }
}