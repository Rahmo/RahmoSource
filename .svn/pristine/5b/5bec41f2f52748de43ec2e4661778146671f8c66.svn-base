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
using ICStars2_0.Components;
using ICStars2_0.Model;
using ICStars2_0.Model.Items;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Student
{
    [Authorize(Roles = "admin,admin_student,Staff,SLC,CSSP")]
    public partial class ReportHours : System.Web.UI.Page
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
        public IEnumerable<SelectListItem> CBONameList { get; set; }
        public Model.Course CurrentCourse { get; set; }
        public Model.ServiceHours CurrentServiceHours { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                ddlHoursServed.Items.Add(new ListItem("Select Hours", "", true));
                ddlHoursServed.Items.Add(new ListItem("0.0", "0.0"));
                for (int i = 0; i < 30; i++)
                {
                    ddlHoursServed.Items.Add(new ListItem(i + ".5", i + ".5"));
                    ddlHoursServed.Items.Add(new ListItem(i + 1 + "", i + 1 + ""));
                }
            }
            int id = 0;
            int sid = 0;
            if (int.TryParse(Request.QueryString["id"], out id))
            {
                CurrentServiceHours = ServiceHoursFactory.Create(id);
                sid = CurrentServiceHours.StudentID;
                if (!IsPostBack)
                {
                    btnSubmit.Text = "Edit";
                    txtServiceDate.Text = CurrentServiceHours.ServiceDate.ToString("MM/dd/yyyy");
                    ddlHoursServed.SelectedValue = CurrentServiceHours.HoursServed.ToString();
                    ddlContactType.SelectedValue = CurrentServiceHours.ContactType;
                    txtNotes.Text = CurrentServiceHours.Notes;
                }
            }
            else
            {
                int.TryParse(Request.QueryString["sid"], out sid);
            }
            CurrentStudent = StudentFactory.Create(sid);
            if (User.IsInRole("SLC") && !CurrentStudent.SLC.Equals(User.Identity.Name))
            {
                Response.Clear();
                Response.Write("You are not allowed to report hours for this student because you are not her/his SLC!");
                Response.End();
                return;
            }
            CurrentCourse = CourseFactory.Create(CurrentStudent.CourseID);
            if (!IsPostBack)
            {

                var cboList = Student2CBOFactory.CreateStudent2CBOCollection(sid);
                CBONameList = cboList.Select(c => new SelectListItem
                    {
                        Text = c.CBOName,
                        Value = c.CBOID.ToString()
                    });
                txtCourse.Text = string.Format("{0}-{1}{2}", CurrentCourse.Subject, CurrentCourse.CatalogNumber,
                                               CurrentCourse.InstructorName);
            }
        }
        protected void btnSubmit_Click(object sender,EventArgs e)
        {
            Model.ServiceHours sh;
            if (CurrentServiceHours == null)
            {
                sh = new ServiceHours();
                sh.CBO_ID = Convert.ToInt32(Request.Form["CBOID"]);
                sh.CourseID = CurrentCourse.ID;
                sh.StudentID = CurrentStudent.ID;
                sh.Quater_Year = Request.QueryString["Quarter"];
            }else
            {
                sh = CurrentServiceHours;
            }

            sh.ServiceDate = Convert.ToDateTime(txtServiceDate.Text);
            sh.HoursServed = float.Parse(ddlHoursServed.SelectedValue);
            sh.ContactType = ddlContactType.SelectedValue;
            sh.Notes = txtNotes.Text;
            ServiceHoursFactory.Update(sh);
            Response.Redirect("ReporthoursSuccess.htm");
        }
    }
}