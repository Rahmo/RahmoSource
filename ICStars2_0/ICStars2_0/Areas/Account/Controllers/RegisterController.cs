using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI;
using CampusConnect.MediatorLibrary;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.Account.Controllers
{
    public class RegisterController : Controller
    {

        [Dependency]
        public IMemberFactory MemberFactory { get; set; }

        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }
        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public JsonResult ValidateCCID(string campusConnectID)
        {
            if (!MemberFactory.Exists(campusConnectID))
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            return Json(campusConnectID + " is already in use!", JsonRequestBehavior.AllowGet);
        }

        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public JsonResult ValidateEmplId(string campusConnectID,string CampusConnectPassword,string EmplID)
        {

            ICampusConnectMediator ccMediaor = CampusConnectFactory.CreateCampusConnectMediaor();

            if (ccMediaor.GetEmplId(campusConnectID, CampusConnectPassword).Equals(EmplID))
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            return Json("The EmplId (" + EmplID + ") cannot match your CampusConnect ID(" + campusConnectID + ")!",
                        JsonRequestBehavior.AllowGet);
        }

        //
        // GET: /Account/Register/

        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Index(MemberForRegister model)
        {
            if (ModelState.IsValid)
            {
                var m = MemberFactory.Update(model);
                if (m.ID > 0)
                {
                    Roles.AddUserToRole(model.CampusConnectID, "Student");
                    AccountSettings settings =
                    SteansSettingsFactory.CreateBaseSetings<AccountSettings>();
                    if (settings.IsSendingEmail)
                    {
                        EmailService.SendEmail("", settings);
                    }
                    return Redirect("/Account/RegisterSuccessful.html");
                }
            }
            ModelState.AddModelError("CampusConnectID", "Failed to create new user! Please contact the administrator.");
            return View(model);
        }
    }
}
