using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.NavigationServices;
using ICStars2_0.Common;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;
using log4net;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    [MvcAuthorize(Roles = "admin_steans,admin_menu")]
    public class MenuController : Controller
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(MenuController));
        //
        // GET: /SHTracker/Menu/
        [Dependency]
        public INavigationFactory NavigationFactory { get; set; }
        public ActionResult Details(int id)
        {
            using (var db = new WebDbContext())
            {
                return View(db.WebsiteNavProfiles.Find(id));
            }
        }
        public ActionResult List()
        {
            return
                    View(NavigationFactory.BuildRootNavigationNodes().SelectMany(n => n.BuildNodesForDropDown()));
            
        }
        
        public ActionResult Create()
        {
            var sortedList = NavigationFactory.BuildRootNavigationNodes().SelectMany(n => n.BuildNodesForDropDown());
            ViewBag.ParentDropdown =
                sortedList.Select(n => new SelectListItem() {Text = n.Name, Value = n.ID.ToString()});

            return View(new WebsiteNav());
        }

        public ActionResult Edit(int id)
        {
            using (var db = new WebDbContext())
            {
                var sortedList = NavigationFactory.BuildRootNavigationNodes().SelectMany(n => n.BuildNodesForDropDown());
                ViewBag.ParentDropdown =
                    sortedList.Select(n => new SelectListItem() { Text = n.Name, Value = n.ID.ToString() });
                return View(db.WebsiteNavProfiles.Find(id));
            }
        }
        private void RecursivelyDelete(WebDbContext db, WebsiteNav nav)
        {
            var childnavs = db.WebsiteNavProfiles.Where(n => n.ParentID == nav.ID).ToList();
            if (childnavs.Any())
            {
                foreach (WebsiteNav websiteNav in childnavs)
                {
                    RecursivelyDelete(db, websiteNav);
                }
            }
            db.WebsiteNavProfiles.Remove(nav);
        }
        public ActionResult Delete(int id)
        {
            using (var db = new WebDbContext())
            {
                var nav = db.WebsiteNavProfiles.Find(id);
                RecursivelyDelete(db, nav);
                //WebsiteNav nav = new WebsiteNav {ID = id};
                //db.Entry(nav).State = EntityState.Deleted;

                db.SaveChanges();
                return RedirectToAction("List");
            }
        }
        [HttpPost]
        public ActionResult Edit(WebsiteNav nav)
        {
            if (ModelState.IsValid)
            {
                using (var db = new WebDbContext())
                {
                    nav.Link = nav.Link.Trim();
                    if (!nav.Link.StartsWith("/") && !nav.Link.StartsWith("http", StringComparison.InvariantCultureIgnoreCase))
                    {
                        nav.Link = "/" + nav.Link;
                    }
                    db.Entry(nav).State=EntityState.Modified;
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            return RedirectToAction("List");
                        }
                    }
                    catch (Exception exp)
                    {
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("Name", "System Error! Please Try it again.");
                }
            }
            return View();
        }
        [HttpPost]
        public ActionResult Create(WebsiteNav nav)
        {
            if (ModelState.IsValid)
            {
                using (var db = new WebDbContext())
                {
                    nav.Link = nav.Link.Trim();
                    if (!nav.Link.StartsWith("/") && !nav.Link.StartsWith("http",StringComparison.InvariantCultureIgnoreCase))
                    {
                        nav.Link = "/" + nav.Link;
                    }
                    db.WebsiteNavProfiles.Add(nav);
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            return RedirectToAction("List");
                        }
                    }
                    catch (Exception exp)
                    {
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("Name","System Error! Please Try it again.");
                }
            }
            return View();
        }
    }
}
