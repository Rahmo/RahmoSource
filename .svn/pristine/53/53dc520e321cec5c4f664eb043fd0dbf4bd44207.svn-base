using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Commengdpu.BusinessLayer;
using Commengdpu.BusinessLayer.Authentication;
using Commengdpu.BusinessLayer.Settings;
using Commengdpu.BusinessLayer.Settings.Models;
using ICStars2_0.Common.ConfigSections;
using ICStars2_0.Common.Reflection;
using log4net;
using Microsoft.Practices.Unity;

namespace Commengdpu.Areas.Admin.Controllers
{
    [AdminAuthorize(Roles = "admin,admin_webpage")]
    public class WebPageController : Controller
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(WebPageController));
        //
        // GET: /Admin/WebPage/
        [Dependency]
        public IPageSettingsFactory PageSettingsFactory { get; set; }
        public ActionResult HomePage()
        {
            return View(PageSettingsFactory.BuildPageSettings<HomePageSettings>());
        }

        [HttpPost]
        public ActionResult HomePage(HomePageSettings model)
        {
            if (ModelState.IsValid)
            {
                if (model is HomePageSettings)
                {
                    PageSettingsFactory.SavePageSettings(PageSettingsFactory.BuildPageSettings<HomePageSettings>(),
                        model);
                }
            }
            return View(model);
        }

        [ValidateInput(false)]
        [HttpPost]
        public JsonResult UpdateContent(string id, string content)
        {
            try
            {
                if (id.Equals(Url.Action("Index", "Home", new {area = ""})))
                {
                    var originalSettings = PageSettingsFactory.BuildPageSettings<HomePageSettings>();
                    var targetSettings = ReflectionHelper.Clone(originalSettings);
                    targetSettings.Content = content;
                    PageSettingsFactory.SavePageSettings(originalSettings, targetSettings);
                    return Json(true);
                }
                if (id.Equals(Url.Action("Index", "About", new { area = "" })))
                {
                    var originalSettings = PageSettingsFactory.BuildPageSettings<AboutPageSettings>();
                    var targetSettings = ReflectionHelper.Clone(originalSettings);
                    targetSettings.Content = content;
                    PageSettingsFactory.SavePageSettings(originalSettings, targetSettings);
                    return Json(true);
                }
                if (id.Equals(Url.Action("ContactUs", "About", new { area = "" })))
                {
                    var originalSettings = PageSettingsFactory.BuildPageSettings<ContactUsPageSettings>();
                    var targetSettings = ReflectionHelper.Clone(originalSettings);
                    targetSettings.Content = content;
                    PageSettingsFactory.SavePageSettings(originalSettings, targetSettings);
                    return Json(true);
                }
                if (id.Equals(Url.Action("Index", "Reports", new { area = "" })))
                {
                    var originalSettings = PageSettingsFactory.BuildPageSettings<ReportsPageSettings>();
                    var targetSettings = ReflectionHelper.Clone(originalSettings);
                    targetSettings.Content = content;
                    PageSettingsFactory.SavePageSettings(originalSettings, targetSettings);
                    return Json(true);
                }

            }
            catch (Exception exp)
            {
#if DEBUG
                throw;
#endif
                Log4NetHelper.WriteLog(exp, Logger);
            }

            return Json(false);
        }
    }
}
