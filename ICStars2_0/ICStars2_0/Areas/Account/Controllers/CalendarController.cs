using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.Login;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.Account.Controllers
{
    public class CalendarController : Controller
    {
        //
        // GET: /Account/Calendar/

        [Dependency]
        public ILogin LoginEvent { get; set; }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginSteansCenter(LoginSteansCenter model)
        {
            if (ModelState.IsValid)
            {
                LoginEventArgs ea = new LoginEventArgs { CampusConnectID = model.CampusConnectID, Password = model.Password, Domain = Config.Domain };

                if (LoginEvent.Login(ea))
                {
                    return Redirect(string.IsNullOrEmpty(model.ReturnUrl) == false ? model.ReturnUrl : "/");
                }
                ViewBag.Error = "Login failed";
            }
            return View("Login",model);
        }
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
    }
}
