using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using ICStars2_0.BusinessLayer;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;
using log4net;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    [MvcAuthorize(Roles = "admin_steans,admin_webpage")]
    public class WebPageController : Controller
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(WebPageController));
        //
        // GET: /SHTracker/WebPage/
        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public JsonResult ValidateUrl(string url)
        {
            using (var db = new WebDbContext())
            {
                if (!db.WebPages.Any(a => a.Url.Equals(url, StringComparison.InvariantCultureIgnoreCase)))
                {
                    return Json(true, JsonRequestBehavior.AllowGet);
                }
            }

            return Json("[" + url + "] is already in use!", JsonRequestBehavior.AllowGet);
        }
        public ActionResult List()
        {
            using (var db = new WebDbContext())
            {
                return View(db.WebPages.ToList());
            }
        }
        public ActionResult Create()
        {
            return View(new WebPage(){Title=Request.QueryString["Title"],Url=Request.QueryString["Url"]});
        }
        [HttpPost]
        public ActionResult Create(WebPage webPage)
        {
            if (ModelState.IsValid)
            {
                using (var db = new WebDbContext())
                {
                    webPage.Url = webPage.Url.Trim();
                    db.WebPages.Add(webPage);
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            return RedirectToAction("List");
                        }
                    }
                    catch (Exception exp)
                    {
#if DEBUG
                        throw exp;
#endif
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("Title", "System Error! Please Try it again.");
                }
            }
            return View(webPage);
        }
        public ActionResult Edit()
        {
            var url = Request.QueryString["url"];
            using (var db = new WebDbContext())
            {
                return View("Create", db.WebPages.Find(url));
            }
        }
        [HttpPost]
        public ActionResult Edit(WebPage webPage)
        {
            if (ModelState.IsValid)
            {
                using (var db = new WebDbContext())
                {
                    webPage.Url = webPage.Url.Trim();
                    db.Entry(webPage).State = EntityState.Modified;
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            return RedirectToAction("List");
                        }
                    }
                    catch (Exception exp)
                    {
#if DEBUG
                        throw exp;
#endif
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("Title", "System Error! Please Try it again.");
                }
            }
            return View("Create", webPage);
        }
        public ActionResult EditUrl()
        {
            var url = Request.QueryString["url"];
            using (var db = new WebDbContext())
            {
                return View(db.WebPages.Find(url));
            }
        }

        [HttpPost]
        public ActionResult EditUrl(WebPage model,string oldUrl)
        {
            using (var db = new WebDbContext())
            {
                var webPage = db.WebPages.AsNoTracking().FirstOrDefault(w=>w.Url.Equals(oldUrl,StringComparison.CurrentCultureIgnoreCase));
                webPage.Url = model.Url.Trim();
                db.WebPages.Add(webPage);

                var oldWebpage = new WebPage {Url = oldUrl};
                db.Entry(oldWebpage).State = EntityState.Deleted;
                try
                {
                    if (db.SaveChanges() > 0)
                    {
                        return RedirectToAction("List");
                    }
                }
                catch (Exception exp)
                {
#if DEBUG
                    throw exp;
#endif
                    Log4NetHelper.WriteLog(exp, Logger);
                }
                ModelState.AddModelError("Url", "System Error! Please Try it again.");
            }

            return View(model);
        }
        [MvcOverrideAuthorize(Users = "hli25,HROSING")]
        public ActionResult Delete(string url)
        {
            using (var db = new WebDbContext())
            {
                var p = new WebPage { Url = url };
                db.Entry(p).State = EntityState.Deleted;

                db.SaveChanges();
                return RedirectToAction("List");
            }
        }
        [ValidateInput(false)]
        [HttpPost]
        public JsonResult UpdateContent(string id, string content)
        {

            using (var db = new WebDbContext())
            {
                var webpage = db.WebPages.Find(id);
                webpage.Content = content;
                try
                {
                    if (db.SaveChanges() > 0)
                    {
                        return Json(true);
                    }
                }
                catch (Exception exp)
                {
#if DEBUG
                    throw;
#endif
                    Log4NetHelper.WriteLog(exp, Logger);
                }
            }
            return Json(false);
        }
    }
}
