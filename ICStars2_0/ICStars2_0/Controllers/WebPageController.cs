using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using ICStars2_0.BusinessLayer.NavigationServices;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using log4net;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Controllers
{
    public class WebPageController : Controller
    {

        private static readonly ILog Logger = LogManager.GetLogger(typeof(WebPageController));
        //
        // GET: /WebPage/
        [Dependency]
        public INavigationFactory NavigationFactory { get; set; }
        public ActionResult Index()
        {
            WebPage webpage = null;
            using (var db = new WebDbContext())
            {
                webpage = db.WebPages.Find(Request.Url.AbsolutePath);
            }
            #region =If Redirect=

            if (!string.IsNullOrEmpty(webpage.RedirectUrl))
            {
                return Redirect(webpage.RedirectUrl);
            }
            if (!string.IsNullOrEmpty(webpage.Redirect301Url))
            {
                return RedirectPermanent(webpage.Redirect301Url);
            }
            #endregion
            //save cost of connecting to database in the production environment
#if !DEBUG
            if (Request.IsSecureConnection)
#endif
            {
                ViewBag.IsEditing =
                    Roles.GetRolesForUser(User.Identity.Name)
                        .Any(r => r.Equals("admin_steans") || r.Equals("admin_webpage"));
            }
            
            return View("WebPage", webpage);
        }

    }
}
