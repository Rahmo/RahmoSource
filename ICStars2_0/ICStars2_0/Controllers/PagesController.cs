using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ICStars2_0.Controllers
{


    /// <summary>
    /// Class PagesController./
    /// This controller is for pages the is Single page contents with separate menus 
    /// </summary>
    public class PagesController : Controller
    {
        //
        // GET: /Pages/

        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Faculty()
        {
            return View();
        }
    }
}
