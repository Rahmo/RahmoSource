using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.CBOServices;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.BusinessLayer.ProgramServices;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Components;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Model.Items;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;
using ICStars2_0.BusinessLayer.MemberServices;

namespace ICStars2_0.SHTracker.Student
{
    [Authorize(Roles = "admin,admin_student,Staff,SLC")]
    public partial class Add : System.Web.UI.Page
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
        public IStudentFactory StudentFactory { get; set; }
        [Dependency]
        public IMemberFactory MemberFactory { get; set; }
        [Dependency]
        public IProgramFactory  ProgramFactory { get; set; }
        [Dependency]
        public IStudent2CBOFactory Student2CBOFactory { get; set; } 
        public IEnumerable<SelectListItem> CBONameList { get; set; }
        public IEnumerable<SelectListItem> CourseNameList { get; set; }

        public IEnumerable<SelectListItem> SLCList { get; set; }
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);

            

            CBONameList = new[]
                                  {
                                      new SelectListItem
                                          {
                                              Text = "Select CBO",
                                              Value = "",
                                              Selected = true
                                          }
                                  }.Union(CBOFactory.BuildCBOSeleteListItems());

            CourseNameList = new[]
                                     {
                                         new SelectListItem
                                             {
                                                 Text = "Select Course",
                                                 Value = "",
                                                 Selected = true
                                             }
                                     }.Union(CourseFactory.BuildCourseSeleteListItems().OrderBy(i=>i.Text));
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cbxPrograms.Items.AddRange(ProgramFactory.CreateList().Select(p => new ListItem(p.Name, p.ID.ToString()){Selected=p.Abbr.Equals("SLC")}).ToArray());
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
                                     .Select(m => new SelectListItem { Text = m, Value = m }));
                }
            
            }

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Model.Student student = new Model.Student();
           // student.SLC = User.IsInRole("SLC") ? User.Identity.Name : "";
            student.SLC = Request.Form["SLC"] ?? "";
            student.Staff = User.IsInRole("Staff") ? User.Identity.Name : "";
            

            student.AvailableDateTime = txtAvailableTime.Text.Trim();
            student.LastName = txtLastname.Text.Trim();
            student.FirstName = txtFirstName.Text.Trim();
            student.DPU_ID = txtDPUID.Text.Trim();
            student.Email = txtEmail.Text.Trim();
            student.PrimaryPhone = txtPrimaryPhone.Text.Trim();
            student.AlternatePhone = txtAlternatePhone.Text.Trim();
            student.Gender = Request.Form["Gender"] ?? "";
            student.ReachMethod = ddlReachMethod.SelectedValue;
            student.PermanentAddress = txtPermanentAddress.Text.Trim();
            student.City = txtCity.Text.Trim();
            student.State = Request.Form["State"] ?? "";
            student.ZipCode = txtZipCode.Text.Trim();
            student.Name_Of_Emergency_Contact = txtNameofEmergencyContact.Text.Trim();
            student.TelephoneNumber = txtTelephone.Text.Trim();
            student.School = Request.Form["School"] ?? "";
            student.Major = txtMajor.Text.Trim();
            if (!string.IsNullOrEmpty(txtExpectedGraduationDate.Text))
            {
                student.Expected_Graduation_Date = Convert.ToDateTime(txtExpectedGraduationDate.Text);
            }
            student.ClassStanding = Request.Form["ClassStanding"]??"";
            student.CourseID = Convert.ToInt32(Request.Form["CourseID"]);
            student.CommunityServiceStudies = Request.Form["CommunityServiceStudies"]??"";
            student.I_have_taken_Service_Learning_Course = Request.Form["ServiceLearningcourse"]??"";
            if(!string.IsNullOrEmpty( student.I_have_taken_Service_Learning_Course))
            {
                student.I_have_taken_Service_Learning_Course += ",";
            }
            student.I_have_taken_Service_Learning_Course += txtOther.Text.Trim();
            student.I_would_like_to_add_my_email_to_Steans_Center_listserv = Convert.ToBoolean(Request.Form["YesNo"]);
            student.Orientation = ddlOrientation.SelectedValue;
            student.IsProject = Convert.ToBoolean(ddlIsProject.SelectedValue);
            //Check Unique Constraint
            if (StudentFactory.Exist(student.CourseID,student.DPU_ID))
            {
                ltlError.Text = "the combination of Course and DPU ID exists! See more details, <a href=\"List.aspx?SearchType=3&SearchText="+student.DPU_ID+"\">Click Me</a>.";
                return;
            }
            #region =Student2CBO=

            string[] cboIdArray = Request.Form["MoreSites"].Split(',');
            string[] quarterYearArray = Request.Form["MoreQuarters"].Split(',');
            string[] requiredHoursArray = Request.Form["MoreRequiredHours"].Split(',');


            List<Student2CBO> s2cCollection = new List<Student2CBO>();
            for (int i = 0; i < cboIdArray.Length; i++)
            {
                Student2CBO s2c = new Student2CBO();
                s2c.CBOID = Convert.ToInt32(cboIdArray[i]);
                s2c.Quater_Year = quarterYearArray[i];
                s2c.RequiredHours = Convert.ToInt32(requiredHoursArray[i]);
                s2cCollection.Add(s2c);
            }
            student.Student2CBOList = s2cCollection;
            #endregion
            #region =Student2Program=

            student.Student2ProgramList = cbxPrograms.Items.Cast<ListItem>().Where(i => i.Selected).Select(item => new Student2Program
            {
                ProgramID = Convert.ToInt32(item.Value)
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