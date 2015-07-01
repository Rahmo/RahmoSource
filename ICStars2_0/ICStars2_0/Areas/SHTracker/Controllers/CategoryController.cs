using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;
using log4net;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    [MvcAuthorize(Roles = "admin,admin_article_category")]
    public class CategoryController : Controller
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(CategoryController));
        //
        // GET: /SHTracker/Category/

        public ActionResult List()
        {
            using (var db = new ArticleDbContext())
            {
                return View(db.Categories.ToList());
            }
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Category category)
        {
            if (ModelState.IsValid)
            {
                using (var db = new ArticleDbContext())
                {
                    db.Categories.Add(category);
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
                    ModelState.AddModelError("Name", "System Error! Please Try it again.");
                }
            }
            return View(category);
        }
        public ActionResult Edit(int id)
        {
            using (var db = new ArticleDbContext())
            {
                return View("Create", db.Categories.First(n => n.ID == id));
            }
        }
        [HttpPost]
        public ActionResult Edit(Category category)
        {
            if (ModelState.IsValid)
            {
                using (var db = new ArticleDbContext())
                {
                    db.Entry(category).State = EntityState.Modified;
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
                    ModelState.AddModelError("Name", "System Error! Please Try it again.");
                }
            }
            return View("Create", category);
        }
        public ActionResult Delete(int id)
        {
            using (var db = new ArticleDbContext())
            {
                var c = new Category() { ID = id };
                db.Entry(c).State = EntityState.Deleted;

                db.SaveChanges();
                return RedirectToAction("List");
            }
        }

    }
}
