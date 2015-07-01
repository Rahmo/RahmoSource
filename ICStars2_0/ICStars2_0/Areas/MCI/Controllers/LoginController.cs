using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.Login;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.MCI.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /MCI/Login/

        [Dependency]
        public ILogin LoginEvent { get; set; }

        [Dependency]
        public IUserData UserData { get; set; }
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginStudent(LoginStudent model)
        {

            if (ModelState.IsValid)
            {
                LoginEventArgs ea = new LoginEventArgs { CampusConnectID = model.CampusConnectID, Password = model.Password, Domain = Config.Domain };
                ea.Roles = "MCI";
                if (LoginEvent.LoginStudent(ea))
                {

                    return RedirectToAction("Authorizing", "Timelog");
                }
                ModelState.AddModelError("Password", "Login failed");
            }

            return View("Index",model);
        }
    }
}
