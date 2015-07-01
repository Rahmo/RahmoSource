using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Model.DbContexts;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    public class MeridaController : Controller
    {
        //
        // GET: /SHTracker/Merida/

        public ActionResult SpringExtensionApplications()
        {
            using (var db = new OtherDbContext())
            {
                return View(db.MeridaExtensionApplications.ToList());
            }
        }

        public ActionResult SpringExtensionApplicationDetails(int id)
        {
            using (var db = new OtherDbContext())
            {
                return View(db.MeridaExtensionApplications.Find(id));
            }
        }
    }
}
