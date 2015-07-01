using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
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
    public partial class Edit : System.Web.UI.Page
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
        public Model.Student CurrentStudent { get; set; }
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            int id = 0;
            int.TryParse(Request.QueryString["id"], out id);
            CurrentStudent = StudentFactory.Create(id);
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
                }.Union(CourseFactory.BuildCourseSeleteListItems(CurrentStudent.CourseID,
                                                                 new CourseCollectionSettings()
                                                                     {
                                                                         CourseType = CourseType.CSSP
                                                                     }));

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (this.CurrentStudent.ID == 0)
                {
                    Response.Clear();
                    Response.Write("This student is deleted!");
                    Response.End();
                    return;
                }
                ltlSLC.Text = CurrentStudent.SLC;
                txtLastname.Text = CurrentStudent.LastName;
                txtFirstName.Text = CurrentStudent.FirstName;
                txtDPUID.Text = CurrentStudent.DPU_ID;
                txtEmail.Text = CurrentStudent.Email;
                txtPrimaryPhone.Text = CurrentStudent.PrimaryPhone;
                txtPermanentAddress.Text = CurrentStudent.PermanentAddress;
                txtCity.Text = CurrentStudent.City;
                txtZipCode.Text = CurrentStudent.ZipCode;
                txtNameofEmergencyContact.Text = CurrentStudent.Name_Of_Emergency_Contact;
                txtTelephone.Text = CurrentStudent.TelephoneNumber;
                txtMajor.Text = CurrentStudent.Major;
                if (CurrentStudent.Expected_Graduation_Date != null)
                {
                    txtExpectedGraduationDate.Text = ((DateTime)CurrentStudent.Expected_Graduation_Date).ToString("MM/dd/yyyy");
                }
                ddlOrientation.SelectedValue = CurrentStudent.Orientation;
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            int id = 0;
            int.TryParse(Request.QueryString["id"], out id);
            Model.Student student = StudentFactory.Create(id);
            if (User.IsInRole("SLC"))
            {
                student.SLC = User.Identity.Name;
            }
            student.StudentType = StudentType.CSSP;
            if (User.IsInRole("Staff"))
            {
                student.Staff = User.Identity.Name;
            }
            
            student.LastName = txtLastname.Text.Trim();
            student.FirstName = txtFirstName.Text.Trim();
            student.DPU_ID = txtDPUID.Text.Trim();
            student.Email = txtEmail.Text.Trim();
            student.PrimaryPhone = txtPrimaryPhone.Text.Trim();
            student.Gender = Request.Form["Gender"];
            student.PermanentAddress = txtPermanentAddress.Text.Trim();
            student.City = txtCity.Text.Trim();
            student.ZipCode = txtZipCode.Text.Trim();
            student.School = Request.Form["School"];
            student.Major = txtMajor.Text.Trim();
            if (!string.IsNullOrEmpty(txtExpectedGraduationDate.Text))
            {
                student.Expected_Graduation_Date = Convert.ToDateTime(txtExpectedGraduationDate.Text);
            }
            student.ClassStanding = Request.Form["ClassStanding"];
            student.CourseID = Convert.ToInt32(Request.Form["CourseID"]);
            
            student.Orientation = ddlOrientation.SelectedValue;
            student.LastUpdateTime = DateTime.Now;


            if (StudentFactory.Exist(student.ID, student.CourseID, student.DPU_ID))
            {
                ltlError.Text = "the combination of Course and DPU ID exists! Please Choose anthor DPU ID or Course.";
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