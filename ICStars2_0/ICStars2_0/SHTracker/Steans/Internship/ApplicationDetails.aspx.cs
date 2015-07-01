using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.SteansServices.CommunityInternshipServices;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Steans.Internship
{
    [Authorize(Roles = "admin_steans,admin_communityinternship")]
    public partial class ApplicationDetails : System.Web.UI.Page
    {
        [Dependency]
        public ICommunityInternshipFactory CommunityInternshipFactory { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = 0;
            if (int.TryParse(Request.QueryString["id"], out id) && id > 0)
            {
                CommunityInternship model = CommunityInternshipFactory.Create(id);
                txtName.Text = model.Name;
                this.Title = string.Format("{0}'s Application", model.Name);
                ltlTerm.Text = model.QuarterYear;
                ltlName.Text = model.Name;
                txtAddress.Text = model.Address;
                txtDepaulID.Text = model.Depaul_ID_Number;
                txtDateOfBirth.Text = model.Birth_Date.ToString("MM/dd/yyyy");
                if (model.Gender.Equals("Male"))
                {
                    rbtMale.Checked = true;
                }
                if (model.Gender.Equals("Female"))
                {
                    rbtFemale.Checked = true;
                }
                txtHomePhoneNumber.Text = model.Home_Phone_Number;
                txtCellPhoneNumber.Text = model.Cell_Phone_Number;
                txtEmail.Text = model.Email;
                txtRacialBackground.Text = model.Racial_Background;
                txtDepaulExpectedGraduationDate.Text = model.DePaul_Expected_Graduation_Date.ToString("MM/dd/yyyy");

                ltlCollege.Text = model.College;

                txtMajorAreaOfAcademicFocus.Text = model.Major_Area_Of_Academic_Focus;
                txtMinorAreaOfAcademicFocus.Text = model.Minor_Area_Of_Academic_Focus;

                txtCommunityBasedServiceLearningCourses.Text =
                    model.Community_Based_Service_Learning_Courses_Previously_Taken_At_DePaul;
                txtServiceCommunityWorkInvoledAtDepaul.Text =
                    model.Service_Community_Work_Involved_Since_Enrollment_At_DePaul;
                txtHowInternshipRelatesToACourseProjectPursuit.Text =
                    model.How_Internship_Relates_To_A_Course_Research_Project_Academic_Pursuit;
                txtHowExperienceRelateToGoals.Text =
                    model.How_will_this_experience_relate_to_your_personal_academic_career_goals;
                txtSpecific_learning_goals1.Text = model.Specific_learning_goals1;
                txtSpecific_learning_goals2.Text = model.Specific_learning_goals2;
                txtSpecific_learning_goals3.Text = model.Specific_learning_goals3;
                txtReferences_Academic.Text =
                    model.References_Academic;
                txtReferences_Other.Text = model.References_Other;
                txtPreferred_Site1.Text = model.Preferred_Site1;
                txtPreferred_Site2.Text = model.Preferred_Site2;
                txtInternSign.Text = model.Intern_Sign;
                txtInternSignDate.Text = model.Intern_Sign_Date.ToString("MM/dd/yyyy");
                txtSiteSupervisor.Text = model.Site_Supervisor;
                txtSiteSupervisorDate.Text = model.Site_Supervisor_Date.ToString("MM/dd/yyyy");
                txtInstructor.Text = model.Instructor;
                txtInstructorDate.Text = model.Instructor_Date.ToString("MM/dd/yyyy");
            }
        }
    }
}