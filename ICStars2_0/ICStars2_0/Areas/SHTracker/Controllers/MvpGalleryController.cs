using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;
using System.Data;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    public class MvpGalleryController : Controller
    {
        //
        // GET: /SHTracker/MvpGallery/
        private MvpDbContext db = new MvpDbContext();
        public ActionResult Index()
        {
            return View(db.ImageGallery.ToList());
        }

        //
        // GET: /SHTracker/MvpGallery/Details/5

        public ActionResult Details(Guid id)
        {
            ImageGallery image = db.ImageGallery.Find(id);
            if (image == null)
            {
                return HttpNotFound();
            }
            return View(image);
        }

        //
        // GET: /SHTracker/MvpGallery/Create

        public ActionResult Create()
        {
            return View(new ImageGallery());
        }

        //
        // POST: /SHTracker/MvpGallery/Create

        [HttpPost]
        public ActionResult Create(ImageGallery image)
        {
            try
            {
                // TODO: Add insert logic here
                if (ModelState.IsValid)
                {

                    db.ImageGallery.Add(image);

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
        // GET: /SHTracker/MvpGallery/Edit/5

        public ActionResult Edit(Guid id)
        {
            ImageGallery image = db.ImageGallery.Find(id);
            if (image == null)
            {
                return HttpNotFound();
            }
           
            return View(image);
        }

        //
        // POST: /SHTracker/MvpGallery/Edit/5

        [HttpPost]
        public ActionResult Edit(ImageGallery image)
        {
            if (ModelState.IsValid)
            {
                
                db.Entry(image).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(image);
        }

        //
        // GET: /SHTracker/MvpGallery/Delete/5

        public ActionResult Delete(Guid id)
        {
            ImageGallery image = db.ImageGallery.Find(id);
            if (image == null)
            {
                return HttpNotFound();
            }
            return View(image);
        }

        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(Guid id)
        {
            ImageGallery image = db.ImageGallery.Find(id);
            db.ImageGallery.Remove(image);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            db.Dispose();
            base.Dispose(disposing);
        }

        public ActionResult UploadImage()
        {
            return View();
        }
        [HttpPost]
        public ActionResult UploadImageMethod()
        {


            //int fileSize = file.ContentLength;
            if (Request.Files.Count != 0)
            {
                for (int i = 0; i < Request.Files.Count; i++)
                {
                    HttpPostedFileBase file = Request.Files[i];

                    int fileSize = file.ContentLength;
                    string fileName = file.FileName;

                    //   string fileCaption = file.Name; 
                    file.SaveAs(Server.MapPath("~/Upload_Files/" + fileName));
                    ImageGallery imageGallery = new ImageGallery();
                    imageGallery.ID = Guid.NewGuid();
                    imageGallery.Name = fileName;
                    imageGallery.Caption = Request.Form["txtCaption"];
                    imageGallery.ImagePath = "~/Upload_Files/" + fileName;
                    db.ImageGallery.Add(imageGallery);
                    db.SaveChanges();
                }
                return Content("Success");
                return RedirectToAction("Index");
            }
            return Content("failed");
        }
    }
}
