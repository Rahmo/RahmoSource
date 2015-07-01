using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using System.Web.Security;
using ICStars2_0.Mvc.Filter;
using System.Data;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
     [MvcAuthorize(Roles = "admin,admin_article,MVPadmin")]
    public class MvpSiteController : Controller
    {
         private readonly MvpDbContext db;
         public MvpSiteController() //singlton
         {
             db = new MvpDbContext();
         }

         //
        // GET: /SHTracker/MVPSite/

        public ActionResult Index()
        {
            return View(db.Sites.ToList());
        }

        //
        // GET: /MVPSite/Details/5

        public ActionResult Details(int id = 0)
        {
            MVPSite mvpsite = db.Sites.Find(id);
            if (mvpsite == null)
            {
                return HttpNotFound();
            }
            return View(mvpsite);
        }

        //
        // GET: /MVPSite/Create

        public ActionResult Create()
        {
            return View();
        }

        //
        // POST: /MVPSite/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(MVPSite mvpsite)
        {
            if (ModelState.IsValid)
            {
                mvpsite.Author = User.Identity.Name.ToString();
                db.Sites.Add(mvpsite);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(mvpsite);
        }

        //
        // GET: /MVPSite/Edit/5

        public ActionResult Edit(int id = 0)
        {
            MVPSite mvpsite = db.Sites.Find(id);
            if (mvpsite == null)
            {
                return HttpNotFound();
            }
            return View(mvpsite);
        }

        //
        // POST: /MVPSite/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(MVPSite mvpsite)
        {
            if (ModelState.IsValid)
            {
                mvpsite.Author = User.Identity.Name.ToString();
                db.Entry(mvpsite).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(mvpsite);
        }

        //
        // GET: /MVPSite/Delete/5

        public ActionResult Delete(int id = 0)
        {
            MVPSite mvpsite = db.Sites.Find(id);
            if (mvpsite == null)
            {
                return HttpNotFound();
            }
            return View(mvpsite);
        }

        //
        // POST: /MVPSite/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MVPSite mvpsite = db.Sites.Find(id);
            db.Sites.Remove(mvpsite);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }
    }
 }