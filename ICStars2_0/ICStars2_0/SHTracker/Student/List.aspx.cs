using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Linq;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Items;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Student
{
    [Authorize(Roles = "admin,admin_student,Staff,SLC")]
    public partial class List : System.Web.UI.Page
    {
        [Dependency]
        public IStudentFactory StudentFactory { get; set; }

        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }

        [Dependency]
        public IUserData UserData { get; set; }

        [Dependency]
        public ICourseFactory CourseFactory { get; set; }

        public IEnumerable<SelectListItem> CourseNameList { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            //course list for current quarter
            CourseNameList = new[]
                                     {
                                         new SelectListItem
                                             {
                                                 Text = "Select Course",
                                                 Value = "",
                                                 Selected = true
                                             }
                                     }.Union(CourseFactory.BuildCourseSeleteListItems().OrderBy(i => i.Text));
            var quarterSettings = SteansSettingsFactory.CreateStandardSetings<QuarterListSettings>();
            StudentCollectionSettings settings = new StudentCollectionSettings();
            if(User.IsInRole("SLC") && !string.IsNullOrEmpty(Request.QueryString["IsMine"]))
            {
                settings.SLC = User.Identity.Name;
            }
            if (UserData.QuarterYear.IndexOf(',') > -1)
            {
                settings.QuaterYearArray = UserData.QuarterYear.Split(',');
            }
            else
            {
                settings.QuaterYear = UserData.QuarterYear;
            }
            settings.StudentType = StudentType.Placement;
            settings.IsAscending = false;
            settings.IsInitalize = true;
            switch (Request.QueryString["orderby"])
            {
                case "FirstName":
                    settings.IsOrderByFirstName = true;
                    break;
                case "CBOName":
                    settings.IsOrderByCBOName = true;
                    break;
                case "Course":
                    settings.IsOrderByCourseSubject = true;
                    break;
                case "Orientation":
                    settings.IsOrderByOrientation = true;
                    break;
                case "ServedHours":
                    settings.IsOrderByServedHours = true;
                    break;
                case "SLC":
                    settings.IsOrderBySLC = true;
                    break;
            }
            if(!string.IsNullOrEmpty(Request.QueryString["ordertype"])
                && Request.QueryString["ordertype"].Equals("ASC"))
            {
                settings.IsAscending = true;
            } 
            if (!string.IsNullOrEmpty(Request.QueryString["ordertype"])
                 && Request.QueryString["ordertype"].Equals("DESC"))
            {
                settings.IsAscending = false;
            }

            string searchText = Request.QueryString["SearchText"];
            string searchType = Request.QueryString["SearchType"];
            var searchCourseID = 0;
            switch (searchType)
            {
                case "1":
                    settings.FirstNameForSearch = searchText;
                    break;

                case "2":
                    settings.LastNameForSearch = searchText;
                    break;

                case "3":
                    settings.DPU_ID = searchText;
                    break;
            }
            if (!string.IsNullOrEmpty(Request.QueryString["SearchCourseID"]) && int.TryParse(Request.QueryString["SearchCourseID"], out searchCourseID))
            {
                settings.CourseID = searchCourseID;
            }
            if (!string.IsNullOrEmpty(Request.QueryString["tobecalled"]))
            {
                settings.IsToBeCalled = true;
            }

            if (!string.IsNullOrEmpty(Request.QueryString["otherstobecalled"]))
            {
                settings.IsOthersToBeCalled = true;
                settings.IsToBeCalled = true;
            }
            var sc = StudentFactory.CreateStudentCollection(pageBar1.CurrentIndex, pageBar1.Size, settings);
            if (settings.IsToBeCalled)
            {
                if ((!string.IsNullOrEmpty(settings.QuaterYear) &&
                     !settings.QuaterYear.Equals(quarterSettings.CurrentQuarter,
                                                 StringComparison.InvariantCultureIgnoreCase))
                    ||
                    (settings.QuaterYearArray != null && settings.QuaterYearArray.Length>0 &&
                     !settings.QuaterYearArray.Contains(quarterSettings.CurrentQuarter)))
                {
                    sc = null;
                }
            }
            
            rptList.DataSource = sc;
            pageBar1.Total = sc == null ? 0 : sc.Count;
            rptList.DataBind();
        }
        protected void lbtDeleteMember_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            var student = StudentFactory.Create(id);
            if (!student.SLC.Equals(User.Identity.Name) && User.IsInRole("SLC"))
                if (!student.SLC.Equals(User.Identity.Name) && User.IsInRole("SLC"))
                {
                    Response.Clear();
                    Response.Write("You are not allowed to delete this student because you are not her/his SLC!!");
                    Response.End();
                    return;
                }
            StudentFactory.Delete(id);
            Response.Redirect("List.aspx?IsMine=1");
        }
        protected void lbtConvert_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            StudentFactory.ConvertToCSSP(id);
            Response.Redirect("List.aspx?IsMine=1");
        }
        
    }
}