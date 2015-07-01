using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.Login;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;
using ICStars2_0.Common;

namespace ICStars2_0.Areas.Account.Controllers
{
    public class LoginController : Controller
    {
        [Dependency]
        public ILogin LoginEvent { get; set; }
        [Dependency]
        public IRoleFactory RoleFactory { get; set; }
        [Dependency]
        public IMemberFactory MemberFactory { get; set; }
       
        public ActionResult Index()
        {
            return View();
        }
        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public JsonResult ValidateCCID(string campusConnectID)
        {
            if (!MemberFactory.Exists(campusConnectID))
            {
                return Json(campusConnectID + " is not valid!", JsonRequestBehavior.AllowGet);
            }
            if (MemberFactory.IsLocked(campusConnectID))
            {
                return Json(campusConnectID + " is locked, please contact with the administrator!", JsonRequestBehavior.AllowGet);
            }
            return Json(true, JsonRequestBehavior.AllowGet);
        }
        [HttpPost]
        public ActionResult LoginSHTracker(LoginSHTracker model)
        {
            if (ModelState.IsValid)
            {
                LoginEventArgs ea = new LoginEventArgs { CampusConnectID = model.CampusConnectID, Password = model.Password, Domain = Config.Domain, QuarterYear = model.Terms.ToString(",") };
               
                if (LoginEvent.Login(ea))
                {
                    string returnUrl = Request.QueryString["ReturnUrl"];

                    if (string.IsNullOrEmpty(returnUrl) == false
                        && returnUrl.IndexOf("/shtracker", StringComparison.InvariantCultureIgnoreCase) < 0)
                    {
                        return Json(new { url = returnUrl });
                    }
                    return Json(new { url = Config.SHTrackerRoot });
                }
                ViewBag.Error = "Login failed";
            }
            return PartialView(model);
        }

        [HttpPost]
        public ActionResult LoginSteansCenter(LoginSteansCenter model)
        {
            if (ModelState.IsValid)
            {
                LoginEventArgs ea = new LoginEventArgs { CampusConnectID = model.CampusConnectID, Password = model.Password, Domain = Config.Domain };

                if (LoginEvent.Login(ea))
                {
                    if (string.IsNullOrEmpty(model.ReturnUrl) == false
                        && model.ReturnUrl.IndexOf("/shtracker", StringComparison.InvariantCultureIgnoreCase) < 0)
                    {
                        return Json(new { url = model.ReturnUrl });
                    }
                    return Json(new { url = "/" });
                }
                ViewBag.Error = "Login failed";
            }
            return PartialView(model);
        }
        [HttpPost]
        public ActionResult LoginStudent(LoginStudent model)
        {

            if (ModelState.IsValid)
            {
                LoginEventArgs ea = new LoginEventArgs { CampusConnectID = model.CampusConnectID, Password = model.Password, Domain = Config.Domain };
                ea.Roles = "Student";
                if (LoginEvent.LoginStudent(ea))
                {
                    return Json(new {url = "/SHTracker/StudentApp"});
                }
                ViewBag.Error = "Login failed";
            }

            return PartialView(model);
        }
    }
}
