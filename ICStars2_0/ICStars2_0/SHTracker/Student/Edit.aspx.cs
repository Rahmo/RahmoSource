using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.CBOServices;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.BusinessLayer.ProgramServices;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Components;
using ICStars2_0.Model;
using ICStars2_0.Model.Items;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Student
{
    [Authorize(Roles = "admin,admin_student,Staff,SLC")]
    public partial class Edit : System.Web.UI.Page
    {

        [Dependency]
        public IUserData UserData { get; set; }
        private ICBOFactory _cboFactory;
        [Dependency]
        public ICBOFactory CBOFactory
        {
            get { return _cboFactory; }
            set { _cboFactory = value; }
        }
        private ICourseFactory _courseFactory;
        [Dependency]
        public ICourseFactory CourseFactory
        {
            get { return _courseFactory; }
            set { _courseFactory = value; }
        }

        [Dependency]
        public IStudent2ProgramFactory Student2ProgramFactory { get; set; }
        [Dependency]
        public IProgramFactory ProgramFactory { get; set; }
        [Dependency]
        public IStudentFactory StudentFactory { get; set; }
        [Dependency]
        public IStudent2CBOFactory Student2CBOFactory { get; set; }
        [Dependency]
        public IMemberFactory MemberFactory { get; set; }

        public IStudent2CBOCollection Student2CboCollection { get; set; }
        public IEnumerable<SelectListItem> CBONameList { get; set; }
        public IEnumerable<SelectListItem> CourseNameList { get; set; }
        public IEnumerable<SelectListItem> SLCList { get; set; }
        public IEnumerable<Student2Program> Student2Programs { get; set; }

        public Model.Student CurrentStudent { get; set; }
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            int id = 0;
            int.TryParse(Request.QueryString["id"], out id);
            CurrentStudent = StudentFactory.Create(id);
            //all CBOs
            CBONameList = new[]
                              {
                                  new SelectListItem
                                      {
                                          Text = "Select CBO",
                                          Value = "",
                                          Selected = true
                                      }
                              }.Union(CBOFactory.BuildCBOSeleteListItems());
            //Course list for current quarter
            CourseNameList = new[]
                                 {
                                     new SelectListItem
                                         {
                                             Text = "Select Course",
                                             Value = "",
                                             Selected = true
                                         }
                                 }.Union(CourseFactory.BuildCourseSeleteListItems(CurrentStudent.CourseID));
            if (CurrentStudent.ID > 0)
            {
                //get all sites related to this student
                Student2CboCollection = Student2CBOFactory.CreateStudent2CBOCollection(CurrentStudent.ID);

                Student2Programs = Student2ProgramFactory.CreateList(CurrentStudent.ID);
            }
            //when administrator or staff is updating this, let them be able to update SLC
            if (User.IsInRole("admin") || User.IsInRole("Staff") || User.IsInRole("SLC"))
            {
                SLCList =
                    new[]
                              {
                                  new SelectListItem
                                      {
                                          Text = "NO SLC",
                                          Value = "",
                                          Selected = true
                                      }
                              }.Union(MemberFactory.CreateSLCCollection(1, 1000).Where(s => s.Status)
                                 .Select(m => m.CampusConnectID)
                                 .OrderBy(m => m)
                                 .Select(m => new SelectListItem {Text = m, Value = m}));
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //any id for a student must be greater than 0
                if(this.CurrentStudent.ID==0)
                {
                    Response.Clear();
                    Response.Write("This student is deleted!");
                    Response.End();
                    return;
                }
                //if (User.IsInRole("SLC") && !CurrentStudent.SLC.Equals(User.Identity.Name))
                //{
                //    Response.Clear();
                //    Response.Write("You are not allowed to edit this student because you are not her/his SLC!!");
                //    Response.End();
                //    return;
                //}
                cbxPrograms.Items.AddRange(ProgramFactory.CreateList().Select(p => new ListItem(p.Name, p.ID.ToString()) { Selected = Student2Programs.Any(s2p=>s2p.ProgramID==p.ID) }).ToArray());
                
                ltlSLC.Text = CurrentStudent.SLC;
                txtAvailableTime.Text = CurrentStudent.AvailableDateTime;
                txtLastname.Text = CurrentStudent.LastName;
                txtFirstName.Text = CurrentStudent.FirstName;
                txtDPUID.Text = CurrentStudent.DPU_ID;
                txtEmail.Text = CurrentStudent.Email;
                txtPrimaryPhone.Text = CurrentStudent.PrimaryPhone;
                txtAlternatePhone.Text = CurrentStudent.AlternatePhone;
                ddlReachMethod.SelectedValue = CurrentStudent.ReachMethod;
                txtPermanentAddress.Text = CurrentStudent.PermanentAddress;
                txtCity.Text = CurrentStudent.City;
                txtZipCode.Text = CurrentStudent.ZipCode;
                txtNameofEmergencyContact.Text = CurrentStudent.Name_Of_Emergency_Contact;
                txtTelephone.Text = CurrentStudent.TelephoneNumber;
                txtMajor.Text = CurrentStudent.Major;
                if(CurrentStudent.Expected_Graduation_Date!=null)
                {
                    txtExpectedGraduationDate.Text = ((DateTime)CurrentStudent.Expected_Graduation_Date).ToString("MM/dd/yyyy");
                }
                if (!string.IsNullOrEmpty(CurrentStudent.I_have_taken_Service_Learning_Course))
                {
                    txtOther.Text =
                        CurrentStudent.I_have_taken_Service_Learning_Course.Replace("High school", "").Replace(
                            "DePaul University", "");
                    txtOther.Text = Regex.Replace(txtOther.Text, "^,+", string.Empty);
                }
                ddlOrientation.SelectedValue = CurrentStudent.Orientation;
                ddlIsProject.SelectedValue = CurrentStudent.IsProject.ToString();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            int id = 0;
            int.TryParse(Request.QueryString["id"], out id);
            Model.Student student = StudentFactory.Create(id);
            if (User.IsInRole("SLC"))
            {
                //student.SLC = User.Identity.Name;
                student.SLC = Request.Form["SLC"];
            }
            //when administrator or staff is updating this, let them be able to update SLC
            if (User.IsInRole("admin") || User.IsInRole("Staff") || User.IsInRole("SLC"))
            {
                student.Staff = User.Identity.Name;
                student.SLC = Request.Form["SLC"];
            }
            student.AvailableDateTime = txtAvailableTime.Text.Trim();
            student.LastName = txtLastname.Text.Trim();
            student.FirstName = txtFirstName.Text.Trim();
            student.DPU_ID = txtDPUID.Text.Trim();
            student.Email = txtEmail.Text.Trim();
            student.PrimaryPhone = txtPrimaryPhone.Text.Trim();
            student.AlternatePhone = txtAlternatePhone.Text.Trim();
            student.Gender = Request.Form["Gender"];
            student.ReachMethod = ddlReachMethod.SelectedValue;
            student.PermanentAddress = txtPermanentAddress.Text.Trim();
            student.City = txtCity.Text.Trim();
            student.ZipCode = txtZipCode.Text.Trim();
            student.State = Request.Form["State"] ?? "";
            student.School = Request.Form["School"];
            student.Major = txtMajor.Text.Trim();
            if (!string.IsNullOrEmpty(txtExpectedGraduationDate.Text))
            {
                student.Expected_Graduation_Date = Convert.ToDateTime(txtExpectedGraduationDate.Text);
            }
            student.ClassStanding = Request.Form["ClassStanding"];
            student.CourseID = Convert.ToInt32(Request.Form["CourseID"]);
            student.CommunityServiceStudies = Request.Form["CommunityServiceStudies"];
            student.I_have_taken_Service_Learning_Course = Request.Form["ServiceLearningcourse"];
            if (!string.IsNullOrEmpty(student.I_have_taken_Service_Learning_Course))
            {
                student.I_have_taken_Service_Learning_Course += ",";
            }
            student.I_have_taken_Service_Learning_Course += txtOther.Text.Trim();
            student.I_would_like_to_add_my_email_to_Steans_Center_listserv = Convert.ToBoolean(Request.Form["YesNo"]);
            student.Orientation = ddlOrientation.SelectedValue;
            student.IsProject = Convert.ToBoolean(ddlIsProject.SelectedValue);
            student.LastUpdateTime = DateTime.Now;
            
            //Check unique constraint
            if (StudentFactory.Exist(student.ID,student.CourseID, student.DPU_ID))
            {
                ltlError.Text = "the combination of Course and DPU ID exists! See more details, <a href=\"List.aspx?SearchType=3&SearchText=" + student.DPU_ID + "\">Click Me</a>.";
                return;
            }
            #region =Student2CBO=

            string[] cboIdArray = Request.Form["MoreSites"].Split(',');
            string[] quarterYearArray = Request.Form["MoreQuarters"].Split(',');
            string[] requiredHoursArray = Request.Form["MoreRequiredHours"].Split(',');

            List<Student2CBO> s2cCollection = new List<Student2CBO>();
            for (int i = 0; i < cboIdArray.Length; i++)
            {
                int cboid = Convert.ToInt32(cboIdArray[i]);
                var s2c = student.Student2CBOList.FirstOrDefault(s => s.CBOID == cboid && s.Quater_Year.Equals(quarterYearArray[i]));
                if (s2c == null)
                {
                    s2c = new Student2CBO();
                    s2c.CBOID = cboid;
                    s2c.Quater_Year = quarterYearArray[i];
                }
                s2c.StudentID = student.ID;
                s2c.RequiredHours = Convert.ToInt32(requiredHoursArray[i]);
                s2cCollection.Add(s2c);

            }
            student.Student2CBOList = s2cCollection;
            #endregion
            #region =Student2Program=

            student.Student2ProgramList = cbxPrograms.Items.Cast<ListItem>().Where(i => i.Selected).Select(item => new Student2Program
            {
                ProgramID = Convert.ToInt32(item.Value),
                StudentID=student.ID
            }).ToList();

            #endregion
            var m = StudentFactory.Update(student);
            //If successed, m.ID should be greater than 0
            if (m.ID < 1)
            {
                ltlError.Text = "System Error! Please contact the administrator!";
                return;
            }
            Response.Redirect("List.aspx?IsMine=1");
        }
    }
}