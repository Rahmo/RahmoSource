using System.Collections.Generic;
using System.Timers;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.BusinessLayer.TimerEvent;
using ICStars2_0.Framework;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    [MvcAuthorize(Roles="admin")]
    public class ScheduleTasksController : Controller
    {

        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }
        [Dependency]
        public INotificationEventFactory NotificationEventFactory { get; set; }
        public static DetailedTimer NotificationTimer { get; set; }
        #region =StudentNotification=

        public ActionResult StudentNotificationSettings()
        {
            INotification notification = NotificationEventFactory.BuildStudentNotificationEvent();
            
            ViewBag.Title = "Student Notification Settings";
            return View("NotificationSettings", notification.EventTriggerDateTimes);
        }
        [HttpPost]
        public ActionResult StudentNotificationSettings(IEnumerable<EventTriggerDateTime> etd)
        {
            INotification notification = NotificationEventFactory.BuildStudentNotificationEvent();

            notification.EventTriggerDateTimes = etd;
            notification.SaveToFile();
            NotificationTimer.SetNotification(notification);
            ViewBag.Title = "Student Notification Settings";
            return View("NotificationSettings", etd);
        }

        public ActionResult StudentEmailSettings()
        {
            ViewBag.Title = "Student Notification Email-Sending Settings";
            var BaseSettings = SteansSettingsFactory.CreateBaseSetings<StudentNotificationSettings>();
            return View("EmailSendingSettings", BaseSettings);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult StudentEmailSettings(StudentNotificationSettings model)
        {
            ViewBag.Title = "Student Notification Email-Sending Settings";
            SteansSettingsFactory.SaveSettings(model);
            return View("EmailSendingSettings", model);
        }
        #endregion
        #region =Database Backup=
        public ActionResult DatabaseBackupSettings()
        {
            INotification notification = NotificationEventFactory.BuildDatabasebackupEvent();

            ViewBag.Title = "Database Backup Settings";
            return View("NotificationSettings", notification.EventTriggerDateTimes);
        }
        [HttpPost]
        public ActionResult DatabaseBackupSettings(IEnumerable<EventTriggerDateTime> etd)
        {
            INotification notification = NotificationEventFactory.BuildDatabasebackupEvent();

            notification.EventTriggerDateTimes = etd;
            notification.SaveToFile();
            NotificationTimer.SetNotification(notification);
            ViewBag.Title = "Database Backup Settings";
            return View("NotificationSettings", etd);
        }
        #endregion
        #region =Timer Control=
        public ActionResult Timer()
        {
            return View(NotificationTimer);
        }
        public ActionResult StartTimer()
        {
            if (NotificationTimer == null)
            {
                NotificationTimer = new DetailedTimer(new Timer(60000));
            }
            InitNotifications();
            NotificationTimer.Start();
            return View("Timer", NotificationTimer);
        }
        public ActionResult StopTimer()
        {
            if (NotificationTimer != null)
            {
                NotificationTimer.Stop();
            }
            return View("Timer", NotificationTimer);
        }
        public static void SetTimerAtApplicationStart()
        {
            if (NotificationTimer == null)
            {
                NotificationTimer = new DetailedTimer(new Timer(60000));
            }
            InitNotifications();
            NotificationTimer.Start();
        }

        private static void InitNotifications()
        {
            var notificationEventFactory = ICStarsUnityContainer.Current.Resolve<INotificationEventFactory>();

            var notifications = notificationEventFactory.BuildNotifications();
            foreach (var notification1 in notifications)
            {
                NotificationTimer.SetNotification(notification1);
            }
        
        }
        #endregion
    }
}
