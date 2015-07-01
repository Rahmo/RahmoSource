using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    [MvcAuthorize(Roles = "admin,admin_cbo")]
    public class CBOController : Controller
    {
        //
        // GET: /SHTracker/CBO/

        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public JsonResult GetCboJsonResult(int id)
        {
            using (var db = new SHTrackerDbContext())
            {
                var cbo = db.Cbos.Find(id);
                return Json(new {cbo.Address,cbo.ContactFristName,cbo.ContactLastName,cbo.ContactPhone,cbo.ContactEmail},JsonRequestBehavior.AllowGet);
            }
        }

    }
}
