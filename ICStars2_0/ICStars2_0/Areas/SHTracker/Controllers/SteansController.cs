using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    [MvcAuthorize(Roles = "admin_steans,admin_projectrequest")]
    public class SteansController : Controller
    {
        //
        // GET: /SHTracker/Steans/

        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }
        public ActionResult ProjectRequestList(int page=1)
        {
            int pagesize = 20;
            ViewBag.PageSize = pagesize;
            using (var db = new OtherDbContext())
            {
                ViewBag.TotalCount = db.ProjectRequestFormProfiles.Count();
                return View(db.ProjectRequestFormProfiles.OrderByDescending(m => m.ID).Skip((page-1) * pagesize).Take(pagesize).ToList());
            }
            
        }

        [MvcAuthorize(Disabled=true)]
        public ActionResult ProjectRequestDetails(int id)
        {
            if (string.IsNullOrEmpty(Request.QueryString["k"]) || 
                !Request.QueryString["k"].Equals(
                    Common.MathHelper.Md5(string.Format("{0}{1}", Common.Const.ENCRYPT_KEY, id))))
            {
                return Content("Unauthorized!");
            }
            using (var db = new OtherDbContext())
            {
                ViewBag.IsDetails = true;
                return View("~/Areas/Steans/Views/ProjectRequest/Index.cshtml",
                            db.ProjectRequestFormProfiles.First(m => m.ID == id));
            }
        }

        public ActionResult ProjectRequestSettings()
        {
            ViewBag.Title = "Project Request Email Sending Settings";
            var BaseSettings = SteansSettingsFactory.CreateBaseSetings<ProjectRequestSettings>();
            return View("EmailSendingSettings",BaseSettings);
        }
        [HttpPost]
        [ValidateInput(false)]
        public ActionResult ProjectRequestSettings(ProjectRequestSettings model)
        {
            ViewBag.Title = "Project Request Email Sending Settings";
            SteansSettingsFactory.SaveSettings(model);
            return View("EmailSendingSettings", model);
        }
    }
}
