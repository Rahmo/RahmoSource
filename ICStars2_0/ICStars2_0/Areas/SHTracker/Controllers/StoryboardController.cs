using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
      [MvcAuthorize(Roles = "admin,admin_article,MVPadmin")]
    public class StoryboardController : Controller
    {
        //
        // GET: /SHTracker/Storyboard/
             private readonly MvpDbContext db;

             public StoryboardController() //singlton
         {
             db = new MvpDbContext();
         }
        public ActionResult Index()
        {
            return View(db.Storyboards.ToList());
        }

        //
        // GET: /SHTracker/Storyboard/Details/5

        public ActionResult Details(int id)
        {
            Storyboard storyboard = db.Storyboards.Find(id);
            if (storyboard == null)
            {
                return HttpNotFound();
            }
            return View(storyboard);
        }

        //
        // GET: /SHTracker/Storyboard/Create

        public ActionResult Create()
        {
            return View(new Storyboard {  PublishDate = DateTime.Now });
        }

        //
        // POST: /SHTracker/Storyboard/Create

        [HttpPost]
        public ActionResult Create(Storyboard storyboard)
        {
            if (ModelState.IsValid)
            {
                db.Storyboards.Add(storyboard);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(storyboard);
        }

        //
        // GET: /SHTracker/Storyboard/Edit/5

        public ActionResult Edit(int id)
        {
            Storyboard storyboard = db.Storyboards.Find(id);
            if (storyboard == null)
            {
                return HttpNotFound();
            }
            return View(storyboard);
        }

        //
        // POST: /SHTracker/Storyboard/Edit/5

        [HttpPost]
        public ActionResult Edit(int id, Storyboard storyboard)
        {
            if (ModelState.IsValid)
            {
                db.Entry(storyboard).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View();
        }

        //
        // GET: /SHTracker/Storyboard/Delete/5

        public ActionResult Delete(int id)
        {
            Storyboard storyboard = db.Storyboards.Find(id);
            if (storyboard == null)
            {
                return HttpNotFound();
            }
            return View(storyboard);
        }

        //
        // POST: /SHTracker/Storyboard/Delete/5

 
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Storyboard storyboard = db.Storyboards.Find(id);
            db.Storyboards.Remove(storyboard);
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
