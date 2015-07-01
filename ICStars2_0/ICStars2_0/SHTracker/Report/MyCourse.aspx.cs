using System;
using System.Collections.Generic;
using ICStars2_0.BusinessLayer.CBOServices;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Items;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Report
{
    [Common.Attributes.Authorize(Roles = "admin,admin_report,Staff,Professor,CSSP")]
    public partial class MyCourse : System.Web.UI.Page
    {
        [Dependency]
        public IStudentFactory StudentFactory { get; set; }
        [Dependency]
        public ICourseFactory CourseFactory { get; set; }
        [Dependency]
        public ICBOFactory CBOFactory { get; set; }

        public IEnumerable<SelectListItem> CourseNameList { get; set; }
        public ICBOCollection CurrentCBOList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                #region =Course=

                var settings = new CourseCollectionSettings();
                if (!string.IsNullOrEmpty(Request.QueryString["term"]))
                {
                    if (Request.QueryString["term"].IndexOf(',') > -1)
                    {
                        settings.QuaterYearArray = Request.QueryString["term"].Split(',');
                    }
                    else
                    {
                        settings.Quater_Year = Request.QueryString["term"];
                    }
                }
                CourseNameList = CourseFactory.BuildCourseSeleteListItems(-1, User.IsInRole("CSSP") ? null : settings);
                #endregion
                #region =CBO=

                if (!string.IsNullOrEmpty(Request.QueryString["CourseID"]))
                {
                    int courseid = 0;
                    if (!int.TryParse(Request.QueryString["CourseID"], out courseid))
                    {
                        ltlError.Text = "Please choose a course!";
                    }
                    var cboSettings = new CBOCollectionSettings
                        {
                            CourseID = courseid
                        };
                    if (User.IsInRole("CSSP"))
                    {
                        cboSettings.StudentType = StudentType.CSSP;
                    }
                    if (!string.IsNullOrEmpty(Request.QueryString["term"]))
                    {
                        if (Request.QueryString["term"].IndexOf(',') > -1)
                        {
                            cboSettings.QuaterYearArray = Request.QueryString["term"].Split(',');
                        }
                        else
                        {
                            cboSettings.Quater_Year = Request.QueryString["term"];
                        }
                    }
                    CurrentCBOList = CBOFactory.CreateCBOCollection(1, 1000,cboSettings);
                }else
                {
                    CurrentCBOList = CBOFactory.CreateEmptyCBOCollection();
                }
                #endregion
            }
        }
        protected IStudentReportCollection BuildStudentReportCollection(int cboId,int courseId)
        {
            var settings = new StudentReportCollectionSettings
                {
                    CBOID = cboId,
                    CourseID = courseId
                };
            if (!string.IsNullOrEmpty(Request.QueryString["term"]))
            {
                if (Request.QueryString["term"].IndexOf(',') > -1)
                {
                    settings.QuaterYearArray = Request.QueryString["term"].Split(',');
                }
                else
                {
                    settings.Quater_Year = Request.QueryString["term"];
                }
            }
            if (User.IsInRole("CSSP"))
            {
                settings.StudentType = StudentType.CSSP;
            }
            return
                StudentFactory.CreateStudentReportCollection(settings);
        }
    }
}