using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.Login;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.Account.Controllers
{
    public class StudentController : Controller
    {
        //
        // GET: /Account/Student/

        [Dependency]
        public ILogin LoginEvent { get; set; }
        public ActionResult Login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Login(LoginStudent model)
        {

            if (ModelState.IsValid)
            {
                var ea = new LoginEventArgs
                {
                    CampusConnectID = model.CampusConnectID,
                    Password = model.Password,
                    Domain = Config.Domain,
                    Roles = "Student"
                };
                if (LoginEvent.LoginStudent(ea))
                {

                    return Redirect("/SHTracker/StudentApp");
                }
                ModelState.AddModelError("Password", "Login failed");
            }

            return View(model);
        }
        public ActionResult Logout()
        {
            var evt = new LoginEventArgs() { Domain = Config.Domain };
            LoginEvent.Logout(evt);
            return RedirectToAction("Login");
        }
    }
}
