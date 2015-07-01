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
    [Authorize]
    public class HomeController : Controller
    {
        //
        // GET: /Home/

        [Dependency]
        public IPageSettingsFactory PageSettingsFactory { get; set; }
        public ActionResult Index()
        {
            ViewBag.IsEditing = Roles.GetRolesForUser(User.Identity.Name)
                .Any(r => r.Equals("admin") || r.Equals("admin_webpage"));
            return View(PageSettingsFactory.BuildPageSettings<HomePageSettings>());
        }

    }
}
