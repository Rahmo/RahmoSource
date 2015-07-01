using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Commengdpu.BusinessLayer;
using Commengdpu.BusinessLayer.Authentication;
using Commengdpu.BusinessLayer.RoleServices;
using Commengdpu.BusinessLayer.UserServices;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;

namespace Commengdpu.Areas.Admin.Controllers
{
    public class AccountController : Controller
    {
        //
        // GET: /Admin/Account/
        [Dependency]
        public ILogin LoginEvent { get; set; }
        [Dependency]
        public IRoleFactory RoleFactory { get; set; }
        [Dependency]
        public IUserFactory UserFactory { get; set; }
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
            ViewBag.Title = "Staff/Faculty Login";
            return View();
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
                    return RedirectToAction("Index","Home",new{area="Admin"});
                }
                ModelState.AddModelError("CampusConnectID", "Login failed");
            }
            return View(ea);
        }
    }
}
