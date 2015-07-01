using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;
using ICStars2_0.Framework.HttpSecurity;

namespace ICStars2_0.Controllers
{

 
   [MvcAuthorize(UnauthorizedRedirectUrl = "/Login/form",IsRedirectOnly=true)]
    
    public class MeridaController : Controller
    {
        //
        // GET: /Merida/


        public ActionResult SpringExtension()
        {
            ViewBag.UserName = "Welcome: " + User.Identity.Name;  
             
                return View(new MeridaExtensionApplication());

        }
        [HttpPost]
        public ActionResult SpringExtension(MeridaExtensionApplication model)
        {
            ViewBag.UserName = "Welcome: " + User.Identity.Name; 
            if (ModelState.IsValid)
            {
                using (var db = new OtherDbContext())
                {
                   model.CampusConnectID = User.Identity.Name;
                  
                    db.MeridaExtensionApplications.Add(model);
                    if (db.SaveChanges() > 0)
                    {
                        return RedirectToAction("Success");
                    }
                    ModelState.AddModelError("Name", "Sorry! Please contact the administrator to proceed!");
              
                }
            }
            return View(model);
        }
        public ActionResult Success()
        {
         
            return View();
        }
    }
}
