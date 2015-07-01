using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ICStars2_0.Areas.ServiceSpeaks.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /ServiceSpeaks/Home/

        public ActionResult Index()
        {
            return View();
        }
        public ActionResult About()
        {
            return View();
        }
        public ActionResult Speakers()
        {
            return View();
        }
        public ActionResult Schedule()
        {
            return View();
        }
        public ActionResult FAQ()
        {
            return View();
        }
    }
}
