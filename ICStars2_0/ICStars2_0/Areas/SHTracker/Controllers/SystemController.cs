using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    [MvcAuthorize(Roles = "admin")]
    public class SystemController : Controller
    {
        //
        // GET: /SHTracker/System/

        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }
        public ActionResult QuarterYearSettings()
        {
            
            var settings = SteansSettingsFactory.CreateStandardSetings<QuarterListSettings>();
            return View(settings);
        }
        [HttpPost]
        public ActionResult SaveQuarterYearSettings(QuarterListSettings settings)
        {
            SteansSettingsFactory.SaveStandardSettings(settings);
            return View("QuarterYearSettings", settings);
        }

        [HttpPost]
        public ActionResult SetCurrentQuarter(string QuarterList)
        {
            var settings = SteansSettingsFactory.CreateStandardSetings<QuarterListSettings>();
            settings.CurrentQuarter = QuarterList;
            SteansSettingsFactory.SaveStandardSettings(settings);
            return View("QuarterYearSettings", settings);
        }
    }
}
