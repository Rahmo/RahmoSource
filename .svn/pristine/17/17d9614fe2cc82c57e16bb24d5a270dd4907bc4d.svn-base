using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Commengdpu.BusinessLayer.Authentication;
using Commengdpu.BusinessLayer.Provider;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;

namespace Commengdpu.Areas.Admin.Controllers
{
    [AdminAuthorize]
    public class HomeController : Controller
    {
        //
        // GET: /Admin/Home/

        [Dependency]
        public IUserData UserData { get; set; }
        public ActionResult Index()
        {
            return View();
        }
    }
}
