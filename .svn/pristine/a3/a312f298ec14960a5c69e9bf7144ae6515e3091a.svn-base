using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Mvc.Filter;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using System.Data;
using System.Linq;
namespace ICStars2_0.Areas.SHTracker.Controllers
{
     [MvcAuthorize(Roles = "admin,admin_article,MVPadmin")]
    public class MvpResourcesController : Controller
    {
        //
        // GET: /SHTracker/MvpResources/
         private MvpDbContext db = new MvpDbContext();
        public ActionResult Index()
        {
            return View(db.Resources.ToList());
        }

        //
        // GET: /SHTracker/MvpResources/Details/5

        public ActionResult Details(int id)
        {
            MvpResource res = db.Resources.Find(id);
           
            if (res == null)
            {
                return HttpNotFound();
            }
            return View(res);
        }

        //
        // GET: /SHTracker/MvpResources/Create

        public ActionResult Create()
        {
            return View(new MvpResource());
        }

        //
        // POST: /SHTracker/MvpResources/Create

        [HttpPost]
        public ActionResult Create(MvpResource res)
        {
            try
            {
                res.CreatedDate = DateTime.Now;
                // TODO: Add insert logic here
                if (ModelState.IsValid)
                {
                    
                    db.Resources.Add(res);

                    db.SaveChanges();
                    return RedirectToAction("Index");
                }

                return RedirectToAction("Index");
            }
            catch
            {
                return View();
            }
        }
        //
        // GET: /SHTracker/MvpResources/Edit/5

        public ActionResult Edit(int id)
        {
            MvpResource res = db.Resources.Find(id);
            if (res == null)
            {
                return HttpNotFound();
            }

            return View(res);
        }

        //
        // POST: /SHTracker/MvpResources/Edit/5

        [HttpPost]
        public ActionResult Edit(MvpResource res)
        {
            res.CreatedDate = DateTime.Now;
            if (ModelState.IsValid)
            {
                
                db.Entry(res).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(res);
        }

        //
        // GET: /SHTracker/MvpResources/Delete/5

        public ActionResult Delete(int id)
        {
            MvpResource res = db.Resources.Find(id);
            if (res == null)
            {
                return HttpNotFound();
            }
            return View(res);
        }

        //
        // POST: /SHTracker/MvpResources/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MvpResource res = db.Resources.Find(id);
            db.Resources.Remove(res);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}
