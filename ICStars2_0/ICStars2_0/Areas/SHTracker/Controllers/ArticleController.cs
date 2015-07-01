using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.ArticleServices;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;
using log4net;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    //MVP Means  Multifaith veteran project group 
    [MvcAuthorize(Roles = "admin,admin_article,MVPadmin,admin_steans")]
    public class ArticleController : Controller
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(ArticleController));
        //
        // GET: /SHTracker/Article/


        [Dependency]
        public IArticleFactory ArticleFactory { get; set; }
        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public JsonResult ValidateUrlTitle(string urlTitle)
        {
            using (var db = new ArticleDbContext())
            {
                if (!db.Articles.Any(a => a.UrlTitle.Equals(urlTitle, StringComparison.InvariantCultureIgnoreCase)))
                {
                    return Json(true, JsonRequestBehavior.AllowGet);
                }
            }

            return Json("[" + urlTitle + "] is already in use!", JsonRequestBehavior.AllowGet);
        }

        public ActionResult Create()
        {
            using (var db = new ArticleDbContext())
            {
                ViewBag.CategorySelectListItems =
                    new[] { new SelectListItem { Text = "Select Category", Value = "0" } }.Union(
                        db.Categories.ToList()
                            .Select(
                                c =>
                                    new SelectListItem
                                    {
                                        Text = c.Name,
                                        Value = c.ID.ToString()
                                    }));
                   
                   
                ViewBag.MVPlist =
                 new[] { new SelectListItem { Text = "Select Category", Value = "0" } }.Union(
                        db.Categories.ToList()
                            .Select(
                                c =>
                                    new SelectListItem
                                    {
                                        Text = c.Name,
                                        Value = c.ID.ToString()
                                    }).Where(c=>c.Text =="Event"));//this is the value from the database of the Event catagory
            }
           // Where(c => c.SiteId == id).ToList()
            return View();
        }
        [HttpPost]
        public ActionResult Create(Article article,int category)
        {
            if (ModelState.IsValid)
            {
                using (var db = new ArticleDbContext())
                {
                    db.Articles.Add(article);
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            #region =Article2Category=

                            var a2c = new Article2Category {ArticleID = article.ID, CategoryID = category};
                            db.Article2Categories.Add(a2c);
                            db.SaveChanges();
                            #endregion
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
            return View(article);
        }
        public ActionResult Edit(int id)
        {
            using (var db = new ArticleDbContext())
            {
                var article = db.Articles.First(n => n.ID == id);
                var categoryIds = db.Article2Categories.Where(a2c => a2c.ArticleID == id).ToList();
                ViewBag.CategorySelectListItems =
                    new[] {new SelectListItem {Text = "Select Category", Value = "0"}}.Union(
                        db.Categories.ToList()
                            .Select(
                                c =>
                                    new SelectListItem
                                    {
                                        Text = c.Name,
                                        Value = c.ID.ToString(),
                                        Selected = categoryIds.Any(a2c => a2c.CategoryID == c.ID)
                                    
                                    }));

                ViewBag.MVPlist =
                 new[] { new SelectListItem { Text = "Select Category", Value = "0" } }.Union(
                        db.Categories.ToList()
                            .Select(
                                c =>
                                    new SelectListItem
                                    {
                                        Text = c.Name,
                                        Value = c.ID.ToString()
                                    }).Where(c => c.Text == "Event"));
                return View(ReflectionHelper.Fill(article,
                        new ArticleForUpdate()));
            }
        }
        [HttpPost]
        public ActionResult Edit(Article article,int category)
        {
            if (ModelState.IsValid)
            {
                using (var db = new ArticleDbContext())
                {
                    db.Entry(article).State = EntityState.Modified;
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            #region =Article2Category=
                            //here must be changed when one article has mutiple categories!
                            var a2c = db.Article2Categories.FirstOrDefault(a=>a.ArticleID==article.ID);
                            if (a2c != null)
                            {
                                a2c.CategoryID = category;
                                db.Entry(a2c).State = EntityState.Modified;
                            }
                            else
                            {
                                a2c = new Article2Category {ArticleID = article.ID, CategoryID = category};
                                db.Article2Categories.Add(a2c);
                            }
                            db.SaveChanges();
                            #endregion
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
            return View(ReflectionHelper.Fill(article,
                        new ArticleForUpdate()));
        }



        public ActionResult Delete(int id = 0)
        {
            using (var db = new ArticleDbContext())
            {
                Article article = db.Articles.Find(id);
                if (article == null)
                {
                    return HttpNotFound();
                }
                return View(article);
            }
        }

        //
        // POST: /MVPSite/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            using (var db = new ArticleDbContext())
            {
                Article article = db.Articles.Find(id);
                db.Articles.Remove(article);
                db.SaveChanges();
                return RedirectToAction("List");
            }
        }

        public ActionResult List(int page=1)
        {
           if (User.IsInRole("MVPadmin") && (!(User.IsInRole("admin_steans")) || !(User.IsInRole("admin_article")) || !(User.IsInRole("admin_article")) || !(User.IsInRole("admin")) ))
            {
                return View(ArticleFactory.BuildEvents(50, page)); 
            }
            else
            {
                return View(ArticleFactory.BuildArticles(50, page));
            }
            return View();
        }

        [ValidateInput(false)]
        [HttpPost]
        public JsonResult UpdateContent(int id, string content)
        {
            using (var db = new ArticleDbContext())
            {
                var article = db.Articles.Find(id);
                article.Content = content;
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
                    throw exp;
#endif
                    Log4NetHelper.WriteLog(exp, Logger);
                }
            }
            return Json(false);
        }
    }
}
