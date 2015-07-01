using System;
using System.Linq;
using System.Threading;
using System.Web;
using ICStars2_0.BusinessLayer.CBOServices;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Settings;
using log4net;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.TimerEvent.Events
{
    internal class StudentNotificationEvent : NotificationEvent, INotification, IWeakReferenceRegister
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(StudentNotificationEvent));
        protected override string FilePath {
            get { return HttpContext.Current.Server.MapPath("/App_Data/Settings/Notification/StudentEventTriggerDateTimeList.xml"); }
        }
        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }

        [Dependency]
        public IStudentFactory StudentFactory { get; set; }

        [Dependency]
        public IStudent2CBOFactory Student2CBOFactory { get; set; }
        [Dependency]
        public ICBOFactory CBOFactory { get; set; }
        [Dependency]
        public IMemberFactory MemberFactory { get; set; }

        [Dependency]
        public IServiceHoursFactory ServiceHoursFactory { get; set; }
        protected override void Process()
        {
            //Notification Email Settings
            var settings =
                            SteansSettingsFactory.CreateBaseSetings<StudentNotificationSettings>();

            var quarterSettings = SteansSettingsFactory.CreateStandardSetings<QuarterListSettings>();
            
            var errmsg = "";
#if !DEBUG
            //get all placement students who entrolled in current quarter and haven't reported their hours for a week(IsToBeCalled).
            var students= StudentFactory.CreateStudentCollection(1, 10000, new StudentCollectionSettings
                {
                    QuaterYear = quarterSettings.CurrentQuarter,
                    StudentType=StudentType.Placement,
                    IsToBeCalled=true
                });
            foreach (var student in students)
            {
                if (settings.IsSendingEmail)
                {
                    try
                    {
                        var cbolist = Student2CBOFactory.CreateStudent2CBOCollection(student.ID);
                        var student2Cbo = cbolist.FirstOrDefault();
                        if ((student.IsProject != null && student.IsProject == true) || student2Cbo.RequiredHours < 1 ||
                            student2Cbo.ServedTotalHours >= student2Cbo.RequiredHours) continue;
                        var emailbody = settings.EmailBody;
                        emailbody = emailbody.Replace("#FirstName#", student.FirstName);
                        emailbody = emailbody.Replace("#CourseName#",
                                                                        string.Format("{2} {0}--{1}--{3}",
                                                                                      student.CourseSubject,
                                                                                      student.CourseCatalogNumber,
                                                                                      student.CourseTerm,
                                                                                      student.CourseSection));
                        emailbody = emailbody.Replace("#ProfessorName#", student.CourseInstructorName);
                        var cbo = CBOFactory.Create(student2Cbo.CBOID);
                        if (student.IsProject==null || student.IsProject == false)
                        {
                            emailbody = emailbody.Replace("#RequiredHours#", student2Cbo.RequiredHours.ToString());
                        }
                        else
                        {
                            emailbody = emailbody.Replace("#RequiredHours#", "a project");
                            emailbody = emailbody.Replace("(remember hour and project) hours of service", string.Empty);
                        }
                        emailbody = emailbody.Replace("#CBOName#", cbo.Name);
                        emailbody = emailbody.Replace("#CBOAddress#", cbo.Address);
                        emailbody = emailbody.Replace("#CBOContact#", string.Format("{0} {1}",cbo.ContactFristName,cbo.ContactLastName));
                        emailbody = emailbody.Replace("#CBOPhone#", cbo.ContactPhone);
                        emailbody = emailbody.Replace("#CBOEmail#", cbo.ContactEmail);
                        if (!string.IsNullOrEmpty(student.SLC))
                        {
                            var slc = MemberFactory.Create(student.SLC);
                            emailbody = emailbody.Replace("#SLCName#",
                                                                            string.Format("{0} {1}", slc.FirstName,
                                                                                          slc.LastName));
                            emailbody = emailbody.Replace("#SLCEmail#",
                                                                            string.Format("{0}@depaul.edu", student.SLC));
                        }
                        else
                        {
                            emailbody = emailbody.Replace("#SLCName#", string.Empty);
                            emailbody = emailbody.Replace("#SLCEmail#", string.Empty);
                        }

                        emailbody = emailbody.Replace("#TodayDate#", DateTime.Now.ToString("MM/dd/yyyy"));
                        emailbody = emailbody.Replace("#ReportedHours#",
                            student2Cbo.ServedTotalHours == null ? "0" : student2Cbo.ServedTotalHours.ToString());
                        EmailService.SendEmail("reminder@depaul.edu", student.Email,
                                               settings.EmailTitle,
                                               emailbody,
                                               settings.IsHtmlEmail);
                        var sh = new ServiceHours();
                            sh.CBO_ID = cbo.ID;
                            sh.CourseID = student.CourseID;
                            sh.StudentID = student.ID;
                            sh.Quater_Year = student2Cbo.Quater_Year;


                        sh.ServiceDate = DateTime.Now.Date;
                        sh.HoursServed = 0;
                        sh.ContactType = "System";
                        sh.Notes = "Email Reminder";/*need to ask Sergio*/
                        ServiceHoursFactory.Update(sh,false);
                    }
                    catch (Exception exp)
                    {
                        Logger.Error(string.Format("Student Notifications Error: Failed to send notificatioin to student \"{0} {1}\"!", student.FirstName, student.LastName), exp);
                        errmsg = " <b>There were issues occured during sending notifications, please check on the error logs!</b>";
                    }

                }
                Thread.Sleep(1000);
            }

#endif
            if (settings.IsSendingEmail)
            {
                EmailService.SendEmail("reminder@depaul.edu", settings.ReceiverEmail,
                    settings.EmailTitle,
                    "<h2>Quarter:" + quarterSettings.CurrentQuarter +
                    "</h2><p><h2>Weekly Notifications have been sent to students who haven't report their hours for 7 days.</h2>" +
                    errmsg +
                    " You got this email because you are an administrator of SHTracker System. Below is a model of the notification :</p>" +
                    settings.EmailBody,
                    settings.IsHtmlEmail);

            }
        }
    }
}
