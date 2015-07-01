using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using Commengdpu.BusinessLayer.Settings;
using Commengdpu.BusinessLayer.Settings.Models;
using Microsoft.Practices.Unity;

namespace Commengdpu.Controllers
{
    public class AboutController : Controller
    {
        //
        // GET: /About/

        [Dependency]
        public IPageSettingsFactory PageSettingsFactory { get; set; }
        public ActionResult Index()
        {
            ViewBag.IsEditing = Roles.GetRolesForUser(User.Identity.Name)
                .Any(r => r.Equals("admin") || r.Equals("admin_webpage"));
            return View("~/Views/Home/Index.cshtml",PageSettingsFactory.BuildPageSettings<AboutPageSettings>());
        }
        public ActionResult ContactUs()
        {
            ViewBag.IsEditing = Roles.GetRolesForUser(User.Identity.Name)
                .Any(r => r.Equals("admin") || r.Equals("admin_webpage"));
            return View("~/Views/Home/Index.cshtml", PageSettingsFactory.BuildPageSettings<ContactUsPageSettings>());
        }
    }
}
