
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Model;

namespace ICStars2_0.Controllers
{
    public class Geo133FormController : Controller
    {
        //
        // GET: /Geo133Form/

        public ActionResult Index()
        {
           using (var db = new GeoDbContext())
            {
                return View();
         }

      
        }

        public ActionResult Main()
        {

            return View();

        }

         [HttpPost]
        public ActionResult Main(GEO133 model)
        {
            if (ModelState.IsValid)
            {
                using (var db = new GeoDbContext())
                    db.GEO133.Add(model);
            }
            return View();

        }

    }
}
