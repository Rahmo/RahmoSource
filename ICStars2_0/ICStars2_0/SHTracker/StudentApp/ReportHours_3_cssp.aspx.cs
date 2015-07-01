using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.CBOServices;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Common;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Items;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.StudentApp
{
    [Authorize(Roles = "Student", UnauthorizedRedirectUrl = "/Account/Student/Login")]
    public partial class ReportHours_3_cssp : System.Web.UI.Page
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
        public IServiceHoursFactory ServiceHoursFactory { get; set; }
        public Model.Student CurrentStudent { get; set; }
        public Model.Course CurrentCourse { get; set; }
        public IEnumerable<SelectListItem> CBONameList { get; set; }
        public string QuarterYear
        {
            get { return Request.QueryString["q"]; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            int courseId = 0;
            string sCourseId = string.Empty;
            string dpu_id = string.Empty;
            //Encryption in each page will be expired 30 minutes from time of login.
            try
            {
                dpu_id = Common.EncryptDecryptHelper.Decrypt(Request.QueryString["d"], Const.DynamicKey);
                sCourseId = Common.EncryptDecryptHelper.Decrypt(Request.QueryString["ci"], Const.DynamicKey);
            }
            catch
            {
                Response.Clear();
                Response.Write("Request is not authorized or expired! <a href=\"Default.aspx\">Return</a>");
                Response.End();
                return;
            }
            int.TryParse(sCourseId, out courseId);
            CurrentCourse = CourseFactory.Create(courseId);
            //This page is for CSSP only, so if it is placement course, then go to placement page.
            if (CurrentCourse.CourseType == CourseType.Placement)
            {
                Response.Redirect("ReportHours_3.aspx" + Request.Url.Query);
                return;
            }
            CurrentStudent = StudentFactory.Create(dpu_id, courseId);
            if (CurrentStudent.ID == 0)
            {
                Response.Clear();
                Response.Write("Request is not authorized or expired! <a href=\"Default.aspx\">Return</a>");
                Response.End();
                return;
            }
            if (!IsPostBack)
            {
                var cboList = Student2CBOFactory.CreateStudent2CBOCollection(CurrentStudent.ID);
                CBONameList = cboList.Where(c => c.Quater_Year.Equals(QuarterYear)).Select(c => new SelectListItem
                {
                    Text = string.Format("{0}--{1}", c.CBOName, c.Quater_Year),
                    Value = c.CBOID.ToString()
                });
                txtCourse.Text = string.Format("{0}-{1}{2}", CurrentCourse.Subject, CurrentCourse.CatalogNumber,
                                               CurrentCourse.InstructorName);
                ddlHoursServed.Items.Add(new ListItem("Select Hours", "", true));
                ddlHoursServed.Items.Add(new ListItem("0.0", "0.0"));
                for (int i = 0; i < 100; i++)
                {
                    ddlHoursServed.Items.Add(new ListItem(i + ".5", i + ".5"));
                    ddlHoursServed.Items.Add(new ListItem(i + 1 + "", i + 1 + ""));
                }
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            //double check student's information
            //Student's email address is considered as the second password
            if (!CurrentStudent.Email.Trim().Equals(txtEmail.Text.Trim(),StringComparison.InvariantCultureIgnoreCase))
            {
                var cboList = Student2CBOFactory.CreateStudent2CBOCollection(CurrentStudent.ID);
                CBONameList = cboList.Where(c => c.Quater_Year.Equals(QuarterYear)).Select(c => new SelectListItem
                {
                    Text = string.Format("{0}--{1}", c.CBOName, c.Quater_Year),
                    Value = c.CBOID.ToString()
                });
                ltlError.Text = "Your DePaul ID and Email do not match!";
                return;
            }
            Model.ServiceHours sh = new ServiceHours();
            sh.CBO_ID = Convert.ToInt32(Request.Form["CBOID"]);
            sh.CourseID = CurrentCourse.ID;
            sh.StudentID = CurrentStudent.ID;
            sh.Quater_Year = QuarterYear;
            sh.ServiceDate = Convert.ToDateTime(txtServiceDate.Text);
            sh.HoursServed = float.Parse(ddlHoursServed.SelectedValue);
            sh.EngagementDescription = txtEngagementDescription.Text;
            sh.ContactType = ddlContactType.SelectedValue;
            sh.Notes = txtNotes.Text;
            //report hours
            ServiceHoursFactory.Update(sh);
            //build simple report data for the final page
            var s2c = Student2CBOFactory.Create(CurrentStudent.ID, sh.CBO_ID, sh.Quater_Year);
            var curStu = StudentFactory.Create(CurrentStudent.ID);
            var cbo = CBOFactory.Create(sh.CBO_ID);
            var course = CourseFactory.Create(sh.CourseID);
            Response.Redirect(string.Format("ReporthoursSuccess.aspx?h={0}&th={1}&cbo={2}&course={3}",
                                      Server.UrlEncode(Common.EncryptDecryptHelper.Encrypt(sh.HoursServed.ToString(), Const.DynamicKey)),
                                      Server.UrlEncode(Common.EncryptDecryptHelper.Encrypt(s2c.ServedTotalHours.ToString(),
                                                                          Const.DynamicKey)),
                                                                          Server.UrlEncode(Common.EncryptDecryptHelper.Encrypt(cbo.Name,
                                                                          Const.DynamicKey)), Server.UrlEncode(Common.EncryptDecryptHelper.Encrypt(course.FullName,
                                                                          Const.DynamicKey))));
        }

    }
}