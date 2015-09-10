using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
      [MvcAuthorize(Roles = "admin,admin_article,MVPadmin")]
    public class MvpOrganizationController : Controller
    {
        private MvpDbContext db = new MvpDbContext();

        //
        // GET: /MvpOrganization/

        public ActionResult Index()
        {
           
            //var query = from o in db.Organizations
            //            join s in db.Sites on o equals s.Organizations into gj
            //            from x in gj.DefaultIfEmpty()
            //            select new
            //            {
            //                UsergroupID = u.UsergroupID,
            //                UsergroupName = u.UsergroupName,
            //                Price = (x == null ? String.Empty : x.Price)
            //         .Include(o => o.Site)   };

            return View(db.Organizations.Where(x=>x.SiteId==x.Site.SiteId).ToList());
        }

        //
        // GET: /MvpOrganization/Details/5
     
        public ActionResult Details(int id = 0)
        {
            Organization organization = db.Organizations.Find(id);
            if (organization == null)
            {
                return HttpNotFound();
            }
            return View(organization);
        }

        //
        // GET: /MvpOrganization/Create

        public ActionResult Create()
        {


            ViewBag.x = new SelectList(db.Sites.ToList(), "SiteId", "SiteName") as IEnumerable<SelectListItem>;
           // ViewBag.x2 = new SelectList(db.Sites, "Id", "SiteName") ;
            return View(new Organization { DateCreated = DateTime.Now });
        }

        //
        // POST: /MvpOrganization/Create

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Organization organization)
        {
            //organization.SiteId = organization.Site.Id;
            if (ModelState.IsValid)
            {
                organization.DateCreated = DateTime.Now;
                db.Organizations.Add(organization);
                
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(organization);
        }
       
        //
        // GET: /MvpOrganization/Edit/5

        public ActionResult Edit(int id = 0)
        {
            Organization organization = db.Organizations.Find(id);
            if (organization == null)
            {
                return HttpNotFound();
            }
            ViewBag.x = new SelectList(db.Sites, "SiteId", "SiteName") as IEnumerable<SelectListItem>;
            return View(organization);
        }

        //
        // POST: /MvpOrganization/Edit/5

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(Organization organization)
        {
            if (ModelState.IsValid)
            {
                organization.DateCreated = DateTime.Now;
                db.Entry(organization).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(organization);
        }

        //
        // GET: /MvpOrganization/Delete/5

        public ActionResult Delete(int id = 0)
        {
            Organization organization = db.Organizations.Find(id);
            if (organization == null)
            {
                return HttpNotFound();
            }
            return View(organization);
        }

        //
        // POST: /MvpOrganization/Delete/5

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Organization organization = db.Organizations.Find(id);
            db.Organizations.Remove(organization);
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
