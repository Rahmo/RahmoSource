using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Commengdpu.BusinessLayer;
using Commengdpu.BusinessLayer.Authentication;
using Commengdpu.BusinessLayer.RoleServices;
using Commengdpu.BusinessLayer.UserServices;
using Microsoft.Practices.Unity;

namespace Commengdpu.Controllers
{
    public class AccountController : Controller
    {
        //
        // GET: /Account/

        [Dependency]
        public ILogin LoginEvent { get; set; }
        public ActionResult Logout()
        {
            var evt = new LoginEventArgs() { Domain = Config.Domain };
            LoginEvent.Logout(evt);
            if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            {
                return RedirectToAction("Login", new { ReturnUrl = Request.QueryString["ReturnUrl"] });
            }
            return RedirectToAction("Login");
        }
        public ActionResult Login()
        {
            return View("~/Areas/Admin/Views/Account/Login.cshtml");
        }
        [HttpPost]
        public ActionResult Login(LoginEventArgs ea)
        {
            if (ModelState.IsValid)
            {
                ea.Domain = Config.Domain;

                if (LoginEvent.Login(ea))
                {
                    string returnUrl = Request.QueryString["ReturnUrl"];

                    if (string.IsNullOrEmpty(returnUrl) == false)
                    {
                        return Redirect(returnUrl);
                    }
                    return RedirectToAction("Index", "Home", new { area = "" });
                }
                ModelState.AddModelError("CampusConnectID", "Login failed");
            }
            return View("~/Areas/Admin/Views/Account/Login.cshtml",ea);
        }
    }
}
