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
using ICStars2_0.Model.Items;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.CSSP
{

    [Authorize(Roles = "admin_cssp,CSSP")]
    public partial class Details : System.Web.UI.Page
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

        public IStudent2CBOCollection Student2CboCollection { get; set; }
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
                                 }.Union(CourseFactory.BuildCourseSeleteListItems(CurrentStudent.CourseID));
            Student2CboCollection = Student2CBOFactory.CreateStudent2CBOCollection(id);
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
                Title = string.Format("{0} {1}", CurrentStudent.FirstName, CurrentStudent.LastName);
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
                if (CurrentStudent.Expected_Graduation_Date !=null)
                {
                    txtExpectedGraduationDate.Text = ((DateTime)CurrentStudent.Expected_Graduation_Date).ToString("MM/dd/yyyy");
                }
                ddlOrientation.SelectedValue = CurrentStudent.Orientation;
            }
        }
    }
}