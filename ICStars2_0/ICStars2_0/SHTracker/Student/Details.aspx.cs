using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.CBOServices;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.BusinessLayer.ProgramServices;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model;
using ICStars2_0.Model.Items;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Student
{
    [Authorize(Roles = "admin,admin_student,Staff,SLC")]
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
        [Dependency]
        public IStudent2ProgramFactory Student2ProgramFactory { get; set; }
        [Dependency]
        public IProgramFactory ProgramFactory { get; set; }
        public IStudent2CBOCollection Student2CboCollection { get; set; }
        public IEnumerable<SelectListItem> CBONameList { get; set; }
        public IEnumerable<SelectListItem> CourseNameList { get; set; }
        public IEnumerable<Student2Program> Student2Programs { get; set; }
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

            Student2Programs = Student2ProgramFactory.CreateList(CurrentStudent.ID);
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
                cbxPrograms.Items.AddRange(ProgramFactory.CreateList().Select(p => new ListItem(p.Name, p.ID.ToString()) { Selected = Student2Programs.Any(s2p => s2p.ProgramID == p.ID) }).ToArray());
                
                Title = string.Format("{0} {1}", CurrentStudent.FirstName, CurrentStudent.LastName);
                ltlSLC.Text = string.IsNullOrEmpty(CurrentStudent.SLC) ? "N/A" : CurrentStudent.SLC;
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
                if (CurrentStudent.Expected_Graduation_Date != null)
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
    }
}