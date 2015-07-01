using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Common;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.StudentApp
{
    [Authorize(Roles = "Student", UnauthorizedRedirectUrl = "/Account/Student/Login")]
    public partial class ViewHours_3 : System.Web.UI.Page
    {
        [Dependency]
        public IServiceHoursFactory ServiceHoursFactory { get; set; }
        [Dependency]
        public IStudentFactory StudentFactory { get; set; }

        [Dependency]
        public IStudent2CBOFactory Student2CBOFactory { get; set; }
        public IStudent2CBOCollection CBOList { get; set; }
        public IEnumerable<ServiceHours> CurrentServiceHoursCollection { get; set; }
        public Model.Student CurrentStudent { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                int courseId = 0;
                string sCourseId = string.Empty;
                string dpu_id = string.Empty;
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
                var quarterYear = Request.QueryString["q"];
                CurrentStudent = StudentFactory.Create(dpu_id, courseId);
                if (CurrentStudent.ID == 0)
                {
                    Response.Clear();
                    Response.Write("Request is not authorized or expired! <a href=\"Default.aspx\">Return</a>");
                    Response.End();
                    return;
                }
                CurrentServiceHoursCollection = ServiceHoursFactory.CreateServiceHoursCollection(1, 1000,
                                                                                                 new ServiceHoursCollectionSettings { StudentID = CurrentStudent.ID }).Where(s=>!s.ContactType.Equals("System")).OrderByDescending(c => c.ServiceDate);
                CBOList = Student2CBOFactory.CreateStudent2CBOCollection(CurrentStudent.ID);
            }
        }
    }
}