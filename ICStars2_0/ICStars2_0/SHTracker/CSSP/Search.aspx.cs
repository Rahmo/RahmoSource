using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.CSSP
{

    [Authorize(Roles = "admin_cssp,CSSP")]
    public partial class Search : System.Web.UI.Page
    {
        [Dependency]
        public IServiceHoursFactory ServiceHoursFactory { get; set; }
        [Dependency]
        public IStudentFactory StudentFactory { get; set; }
        [Dependency]
        public IStudent2CBOFactory Student2CBOFactory { get; set; }

        public IStudent2CBOCollection CBOList { get; set; }
        public IStudentCollection CurrentStudentCollection { get; set; }
        public Model.Student CurrentStudent { get; set; }
        public IEnumerable<ServiceHours> CurrentServiceHoursCollection { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            string quaterYear = Request.QueryString["QuaterYear"];
            string searchText = Request.QueryString["SearchText"];
            string searchType = Request.QueryString["SearchType"];
            int stuId = 0;
            if (int.TryParse(Request.QueryString["StudentID"], out stuId) && stuId > 0)
            {
                CurrentStudent = StudentFactory.Create(stuId);
                CurrentServiceHoursCollection = ServiceHoursFactory.CreateServiceHoursCollection(1, 1000,
                                                                                                 new ServiceHoursCollectionSettings { StudentID = stuId }).OrderByDescending(c => c.ServiceDate);
                CBOList = Student2CBOFactory.CreateStudent2CBOCollection(stuId);
            }

            if (string.IsNullOrEmpty(quaterYear)
                || string.IsNullOrEmpty(searchText)
                || string.IsNullOrEmpty(searchType)
                )
            {
                return;
            }

            StudentCollectionSettings settings = new StudentCollectionSettings();
            settings.QuaterYear = quaterYear;
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
            CurrentStudentCollection = StudentFactory.CreateStudentCollection(1, 1000, settings);
        }
    }
}