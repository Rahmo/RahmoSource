using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model.Enum;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Course
{
    [Authorize(Roles = "admin,admin_course,Staff,CSSP")]
    public partial class Edit : System.Web.UI.Page
    {
        private ICourseFactory _courseFactory;
        [Dependency]
        public ICourseFactory CourseFactory
        {
            get { return _courseFactory; }
            set { _courseFactory = value; }
        }

        public Model.Course CurrentCourse { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {

                int id = 0;
                int.TryParse(Request.QueryString["id"], out id);
                CurrentCourse = CourseFactory.Create(id);
                txtSubject.Text = CurrentCourse.Subject;
                txtCatalogNumber.Text = CurrentCourse.CatalogNumber;
                txtClassSection.Text = CurrentCourse.ClassSection;
                txtTitle.Text = CurrentCourse.Title;
                txtInstructorName.Text = CurrentCourse.InstructorName;
                txtBestEmail.Text = CurrentCourse.BestEmail;
                txtStaff.Text = CurrentCourse.Staff;
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int id = 0;
            int.TryParse(Request.QueryString["id"], out id);
            Model.Course course = CourseFactory.Create(id);
            if (User.IsInRole("CSSP"))
            {
                course.CourseType = CourseType.CSSP;
            }
            course.TermDescription = Request.Form["TermDescription"];
            course.Subject = txtSubject.Text.Trim();
            course.CatalogNumber = txtCatalogNumber.Text.Trim();
            course.ClassSection = txtClassSection.Text.Trim();
            course.Title = txtTitle.Text.Trim();
            course.InstructorName = txtInstructorName.Text.Trim();
            course.BestEmail = txtBestEmail.Text.Trim();
            CourseFactory.Update(course);
            Response.Redirect("List.aspx");
        }
    }
}