using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.Login;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.Account.Controllers
{
    public class LogoutController : Controller
    {

        [Dependency]
        public ILogin LoginEvent { get; set; }
        public ActionResult Index()
        {
            var evt = new LoginEventArgs() { Domain = Config.Domain };
            LoginEvent.Logout(evt);
            if (!string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]))
            {
                return RedirectToAction("Index", "Login", new {ReturnUrl = Request.QueryString["ReturnUrl"]});
            }
            return RedirectToAction("Index","Login");
        }

    }
}
