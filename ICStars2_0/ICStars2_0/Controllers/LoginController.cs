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
using CampusConnect.MediatorLibrary;

namespace ICStars2_0.Controllers
{
    public class LoginController : Controller
    {
        //
        // GET: /MCI/Login/

          [Dependency]
        public ILogin LoginEvent { get; set; }
           [Dependency]
        public IUserData UserData { get; set; }
        public ActionResult form()
        {
            return View();
        }
        [HttpPost]
        public ActionResult LoginStudent(LoginStudent model)
        {
            //Changed in 1/9/2015
            if (ModelState.IsValid)
            {
                LoginEventArgs ea = new LoginEventArgs { CampusConnectID = model.CampusConnectID, Password = model.Password, Domain = Config.Domain };
                //ea.Roles = "Admin";

                if (LoginEvent.LoginWithoutRoles(ea)) 
                {
                    return RedirectToAction("SpringExtension", "Merida");
             
                }
                ModelState.AddModelError("Password", "Login failed");
            }

            return View("Index",model);
        }
    }
}
