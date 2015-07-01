using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.Login;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Controllers
{
    public class LogoutController : Controller
    {
        //
        // GET: /MCI/Logout/

        [Dependency]
        public ILogin LoginEvent { get; set; }
        public ActionResult Index()
        {
            var evt = new LoginEventArgs() { Domain = Config.Domain };
            LoginEvent.Logout(evt);
            Session.Abandon();
            Session.Clear();
            return RedirectToAction("Index", "Login");
        }

    }
}
