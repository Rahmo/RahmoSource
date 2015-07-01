using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    public class CalendarController : Controller
    {
        //
        // GET: /SHTracker/Calendar/


        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }
        public ActionResult NotificationSettings()
        {
            ViewBag.Title = "Calendar Notification Settings";
            var BaseSettings = SteansSettingsFactory.CreateBaseSetings<CalendarNotificationSettings>();
            return View("EmailSendingSettings", BaseSettings);
        }

        [HttpPost]
        [ValidateInput(false)]
        public ActionResult NotificationSettings(CalendarNotificationSettings model)
        {
            ViewBag.Title = "Calendar Notification Settings";
            SteansSettingsFactory.SaveSettings(model);
            return View("EmailSendingSettings", model);
        }
    }
}
