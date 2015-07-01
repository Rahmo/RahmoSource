using System;
using System.Configuration;
using System.Text.RegularExpressions;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.SteansServices.CommunityInternshipServices;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Students.ServiceOpportunities
{
    public partial class InternshipApplication : System.Web.UI.Page
    {
        public static log4net.ILog Logger = log4net.LogManager.GetLogger(typeof(InternshipApplication));
        [Dependency]
        public ICommunityInternshipFactory CommunityInternshipFactory { get; set; }
        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            CommunityInternship model = new CommunityInternship();
            #region =Validation=
            if (string.IsNullOrEmpty(txtName.Text))
            {
                ltlError.Text = "Name can not be empty!";
                return;
            }
            if (string.IsNullOrEmpty(txtAddress.Text))
            {
                ltlError.Text = "Address can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtCellPhoneNumber.Text))
            {
                ltlError.Text = "Cell Phone Number can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtCommunityBasedServiceLearningCourses.Text))
            {
                ltlError.Text = "community-based service learning courses previously taken at DePaul can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtDateOfBirth.Text))
            {
                ltlError.Text = "Date of birth can not be empty!";
                return;
            } 
            
            if (string.IsNullOrEmpty(txtDepaulExpectedGraduationDate.Text))
            {
                ltlError.Text = "DePaul Expected Graduation Date can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtDepaulID.Text))
            {
                ltlError.Text = "Depaul ID can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtEmail.Text))
            {
                ltlError.Text = "Email can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtHomePhoneNumber.Text))
            {
                ltlError.Text = "Home Phone Number can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtHowExperienceRelateToGoals.Text))
            {
                ltlError.Text = "\"How will this experience relate to your personal, academic and career goals\" can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtHowInternshipRelatesToACourseProjectPursuit.Text))
            {
                ltlError.Text = "\"how this internship relates to a course, research project or academic pursuit\" can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtInstructor.Text))
            {
                ltlError.Text = "Instructor can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtInstructorDate.Text))
            {
                ltlError.Text = "Instructor date can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtInternSign.Text))
            {
                ltlError.Text = "Intern sign can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtInternSignDate.Text))
            {
                ltlError.Text = "Intern sign date can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtMajorAreaOfAcademicFocus.Text))
            {
                ltlError.Text = "Major area of academic focus can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtMinorAreaOfAcademicFocus.Text))
            {
                ltlError.Text = "Minor area of academic focus can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtRacialBackground.Text))
            {
                ltlError.Text = "Racial background can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtReferences_Academic.Text))
            {
                ltlError.Text = "Reference of academic can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtReferences_Other.Text))
            {
                ltlError.Text = "Other reference can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtServiceCommunityWorkInvoledAtDepaul.Text))
            {
                ltlError.Text = "\"What types of service and/or community work have you been involved with since your enrollment at DePaul\" can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtSiteSupervisor.Text))
            {
                ltlError.Text = "Site supervisor can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtSiteSupervisorDate.Text))
            {
                ltlError.Text = "Site supervisor date can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtSpecific_learning_goals1.Text))
            {
                ltlError.Text = "specific learning goals 1 can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtSpecific_learning_goals2.Text))
            {
                ltlError.Text = "specific learning goals 2 can not be empty!";
                return;
            } if (string.IsNullOrEmpty(txtSpecific_learning_goals3.Text))
            {
                ltlError.Text = "specific learning goals 3 can not be empty!";
                return;
            } 
            if(rbtFemale.Checked==false && rbtMale.Checked==false)
            {
                ltlError.Text = "Gender can not be empty!";
                return;
            }
            if(!cbxCommerce.Checked
                && !cbxCommunication.Checked
                && !cbxComputingDigitalMedia.Checked
                && !cbxEducation.Checked
                && !cbxLaw.Checked
                && !cbxLiberalArtsSocialSciences.Checked
                && !cbxMusic.Checked
                && !cbxNewLearning.Checked
                && !cbxScienceHealth.Checked
                && !cbxTheatre.Checked)
            {
                ltlError.Text = "School or College must be checked!";
                return;
            }
            #endregion

            model.Name = txtName.Text;
            model.QuarterYear = ddlQuarterYear.SelectedValue;
            string tmp =
                model.QuarterYear.Replace("Spring", "").Replace("Summer", "").Replace("Fall", "").Replace("Winter", "").
                    Replace(" ", "");
            if(model.QuarterYear.IndexOf("Spring")>-1)
            {
                tmp += "03";
            }
            if (model.QuarterYear.IndexOf("Summer") > -1)
            {
                tmp += "06";
            }
            if (model.QuarterYear.IndexOf("Fall") > -1)
            {
                tmp += "09";
            }
            if (model.QuarterYear.IndexOf("Winter") > -1)
            {
                tmp += "12";
            }
            model.QuarterYearOrder = Convert.ToInt32(tmp);
            model.Address = txtAddress.Text;
            model.Depaul_ID_Number = txtDepaulID.Text;
            DateTime birthDate;
            if(DateTime.TryParse(txtDateOfBirth.Text,out birthDate)==false)
            {
                ltlError.Text = "Please type the right format of Birth Date!";
                return;
            }
            model.Birth_Date = birthDate;
            model.Gender = rbtMale.Checked ? "Male" : "Female";
            model.Gender = rbtFemale.Checked ? "Female" : "Male";
            model.Home_Phone_Number = txtHomePhoneNumber.Text;
            model.Cell_Phone_Number = txtCellPhoneNumber.Text;
            model.Email = txtEmail.Text;
            model.Racial_Background = txtRacialBackground.Text;
            DateTime depaulGraDate;
            if (DateTime.TryParse(txtDepaulExpectedGraduationDate.Text, out depaulGraDate) == false)
            {
                ltlError.Text = "Please type the right format of DePaul Expected Graduation Date!";
                return;
            }
            model.DePaul_Expected_Graduation_Date = depaulGraDate;
            model.College = string.Format("{0}|{1}|{2}|{3}|{4}|{5}|{6}|{7}|{8}|{9}",
                                          cbxCommerce.Checked ? "Commerce" : "",
                                          cbxCommunication.Checked ? "Communication" : "",
                                          cbxComputingDigitalMedia.Checked ? "Computing and Digital Media" : "",
                                          cbxEducation.Checked ? "Education" : "", cbxLaw.Checked ? "Law" : "",
                                          cbxLiberalArtsSocialSciences.Checked
                                              ? "Liberal Arts and Social Sciences"
                                              : "",
                                          cbxMusic.Checked ? "Music" : "",
                                          cbxNewLearning.Checked ? "New Learning" : "",
                                          cbxScienceHealth.Checked ? "Science and Health" : "",
                                          cbxTheatre.Checked ? "Theatre" : "");
            model.College = Regex.Replace(model.College, "\\|+", "|");
            model.College = Regex.Replace(model.College, "^\\|", "");
            model.College = Regex.Replace(model.College, "\\|$", "");
            model.Major_Area_Of_Academic_Focus = txtMajorAreaOfAcademicFocus.Text;
            model.Minor_Area_Of_Academic_Focus = txtMinorAreaOfAcademicFocus.Text;
            model.Community_Based_Service_Learning_Courses_Previously_Taken_At_DePaul =
                txtCommunityBasedServiceLearningCourses.Text;
            model.Service_Community_Work_Involved_Since_Enrollment_At_DePaul =
                txtServiceCommunityWorkInvoledAtDepaul.Text;
            model.How_Internship_Relates_To_A_Course_Research_Project_Academic_Pursuit =
                txtHowInternshipRelatesToACourseProjectPursuit.Text;
            model.How_will_this_experience_relate_to_your_personal_academic_career_goals =
                txtHowExperienceRelateToGoals.Text;
            model.Specific_learning_goals1 = txtSpecific_learning_goals1.Text;
            model.Specific_learning_goals2 = txtSpecific_learning_goals2.Text;
            model.Specific_learning_goals3 = txtSpecific_learning_goals3.Text;
            model.References_Academic = txtReferences_Academic.Text;
            model.References_Other = txtReferences_Other.Text;
            model.Preferred_Site1 = txtPreferred_Site1.Text;
            model.Preferred_Site2 = txtPreferred_Site2.Text;
            model.Intern_Sign = txtInternSign.Text;
            DateTime internSignDate;
            if (DateTime.TryParse(txtInternSignDate.Text, out internSignDate) == false)
            {
                ltlError.Text = "Please type the right format of Intern Sign Date!";
                return;
            }
            model.Intern_Sign_Date = internSignDate;
            model.Site_Supervisor = txtSiteSupervisor.Text;
            DateTime site_Supervisor_Date;
            if (DateTime.TryParse(txtSiteSupervisorDate.Text, out site_Supervisor_Date) == false)
            {
                ltlError.Text = "Please type the right format of Site Supervisor Date!";
                return;
            }
            model.Site_Supervisor_Date = site_Supervisor_Date;
            model.Instructor = txtInstructor.Text;
            DateTime instructor_Date;
            if (DateTime.TryParse(txtInstructorDate.Text, out instructor_Date) == false)
            {
                ltlError.Text = "Please type the right format of Instructor Date!";
                return;
            }
            model.Instructor_Date = instructor_Date;

            int result = 0;
            try
            {
                result = CommunityInternshipFactory.Update(model).ID;
            }
            catch (Exception exp)
            {
                Log4NetHelper.WriteLog(exp, Logger);
                ltlError.Text = "System Error! Please contact administrator or retry.";
            }
            if (result > 0)
            {
                CommunityInternshipSettings settings =
                    SteansSettingsFactory.CreateBaseSetings<CommunityInternshipSettings>();
                if (settings.IsSendingEmail)
                {
                    EmailService.SendEmail("", settings);
                }
                Response.Redirect("InternshipApplicationSuccess.aspx");
            }

        }
        protected void ddlQuarterYear_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
}
}