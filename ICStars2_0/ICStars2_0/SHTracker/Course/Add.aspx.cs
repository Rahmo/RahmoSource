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
    public partial class Add : System.Web.UI.Page
    {
        private ICourseFactory _courseFactory;
        [Dependency]
        public ICourseFactory CourseFactory
        {
            get { return _courseFactory; }
            set { _courseFactory = value; }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Model.Course course = new Model.Course();
            if (User.IsInRole("CSSP"))
            {
                course.CourseType=CourseType.CSSP;
            }
            course.TermDescription = Request.Form["TermDescription"];
            course.Subject = txtSubject.Text.Trim();
            course.CatalogNumber = txtCatalogNumber.Text.Trim();
            course.ClassSection = txtClassSection.Text.Trim();
            course.Title = txtTitle.Text.Trim();
            course.InstructorName = txtInstructorName.Text.Trim();
            course.BestEmail = txtBestEmail.Text.Trim();
            course.Staff = User.Identity.Name;
            CourseFactory.Update(course);
            Response.Redirect("List.aspx");
        }
    }
}