using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.CSSP
{
    [Authorize(Roles = "admin_cssp,CSSP")]
    public partial class List : System.Web.UI.Page
    {
        [Dependency]
        public IStudentFactory StudentFactory { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            StudentCollectionSettings settings = new StudentCollectionSettings();
            settings.StudentType = StudentType.CSSP;
            if (!string.IsNullOrEmpty(Request.QueryString["studentType"]) && Request.QueryString["studentType"].Equals("all"))
            {
                settings.StudentType = StudentType.All;
            }
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
            if (!string.IsNullOrEmpty(Request.QueryString["ordertype"])
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
            var sc = StudentFactory.CreateStudentCollection(pageBar1.CurrentIndex, pageBar1.Size, settings);

            rptList.DataSource = sc;
            pageBar1.Total = sc.Count;
            rptList.DataBind();
        }
        protected void lbtDeleteMember_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            StudentFactory.Delete(id);
            Response.Redirect("List.aspx");
        }
    }
}