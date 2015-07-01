using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.CBOServices;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Items;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.CSSP
{
    [Authorize(Roles = "admin_cssp,CSSP")]
    public partial class Add : System.Web.UI.Page
    {

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
        public IStudent2CBOFactory Student2CBOFactory { get; set; }
        public IEnumerable<SelectListItem> CBONameList { get; set; }
        public IEnumerable<SelectListItem> CourseNameList { get; set; }
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
                                     }.Union(CourseFactory.BuildCourseSeleteListItems(-1,new CourseCollectionSettings(){CourseType=CourseType.CSSP}));
        }
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Model.Student student = new Model.Student();
            student.SLC = User.IsInRole("SLC") ? User.Identity.Name : "";
            student.StudentType = StudentType.CSSP;
            student.Staff = User.IsInRole("Staff") ? User.Identity.Name : "";
            

            student.LastName = txtLastname.Text.Trim();
            student.FirstName = txtFirstName.Text.Trim();
            student.DPU_ID = txtDPUID.Text.Trim();
            student.Email = txtEmail.Text.Trim();
            student.PrimaryPhone = txtPrimaryPhone.Text.Trim();
            student.Gender = Request.Form["Gender"] ?? "";
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
            student.ClassStanding = Request.Form["ClassStanding"] ?? "";
            student.CourseID = Convert.ToInt32(Request.Form["CourseID"]);
            student.Orientation = ddlOrientation.SelectedValue;

            if (StudentFactory.Exist(student.CourseID, student.DPU_ID))
            {
                ltlError.Text = "the combination of Course and DPU ID exists! Please Choose another DPU ID or Course.";
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
                s2c.StudentID = student.ID;
                s2c.CBOID = Convert.ToInt32(cboIdArray[i]);
                s2c.Quater_Year = quarterYearArray[i];
                s2c.RequiredHours = Convert.ToInt32(requiredHoursArray[i]);
                s2cCollection.Add(s2c);
            }
            student.Student2CBOList = s2cCollection;
            #endregion
            var m = StudentFactory.Update(student);
            if (m.ID < 1)
            {
                ltlError.Text = "System Error! Please contact the administrator!";
                return;
            }
            Response.Redirect("List.aspx");
        }
    }
}