using System;
using ICStars2_0.BusinessLayer.ArticleServices;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;
//using System.Web.
using System.Linq;

using System.Web.Mvc;
using ICStars2_0.BusinessLayer;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using log4net.Repository.Hierarchy;
using System.IO;
using System.Web;

namespace ICStars2_0.Controllers
{
    public class MvProjectController : Controller
    {
        //
        // GET: /MvpProject/
        private readonly MvpDbContext _db;

        public MvProjectController()
        {
            _db = new MvpDbContext();
        }

        [Dependency]
        public IArticleFactory ArticleFactory { get; set; }
        public ActionResult Home()
        {

            return View();
       
            
        }
        public ActionResult Events()
        {
     

            var model = ArticleFactory.BuildArticles(5, 1, new ArticleCollectionSettings() { CategoryName = "Event", IsVisible = true });
            ViewBag.Event = ArticleFactory.BuildArticles(7, 1, new ArticleCollectionSettings() { CategoryName = "Event", IsVisible = true });


            
            return View(model);
        }

        public ActionResult Partners()
        {
            ViewBag.Organization = _db.Organizations.Where(c => c.SiteId == c.OrgId).ToList(); 


            return View((_db.Sites.ToList()));
        }

        public ActionResult SiteOrganizations(int id)
        {
            ViewBag.Organization = _db.Organizations.Where(c => c.SiteId == id).ToList(); 
           
            return View();
        }
      
        public ActionResult ContactUs()
        {
            TempData["message"] = null;
            Inquiring model = new Inquiring();
           

            return View(model);
         
        }
        [HttpPost]
        public ActionResult ContactUs(Inquiring model)
        {
            if (ModelState.IsValid)
            {
                try
                {


                    var v = "<h3> Name: " + model.FirstName + " " + model.LastName + " <h3> " +
                        "Title: "+ model.FirstName + " " + model.LastName + " from the organization " + model.Organization + " " + 
                           " <br/> Email: " + model.EmailAddress +" <br/> Organization: " + model.Organization
                            + " <br/> Address: " + model.Address
                            + " <br/> City: " + model.City
                            + " <br/> State: " + model.State
                            + " <br/> Zip Code: " + model.ZipCode
                            + " <br/> Phone Number: " + model.PhoneNumber +
                              "<br/> Sent the following:  " +
                            model.Comment 
                        ;


                    //egan@depaul.edu

                    EmailService.SendEmail("reminder.dpu@gmail.com", "egan@depaul.edu", model.FirstName + " " + model.LastName + " " + model.Organization,
                        v, true);
                    TempData["message"] = "Message sent";
                    ModelState.Clear();

                }
                catch (Exception exp)
                {

                }
            }

            return View("ContactUs");
        }


     

        public ActionResult Gallery()
        {
            var imagesModel = new ImageGallery();
            var imageFiles = Directory.GetFiles(Server.MapPath("~/Upload_Files/"));
            foreach (var item in imageFiles)
            {
                imagesModel.ImageList.Add(Path.GetFileName(item));
                
            }
            //here
            using (var db = new MvpDbContext())
            {
                var r = from s in db.ImageGallery
                        select
                             s;
                            ViewBag.images= r.ToList();
            //end
            return View(imagesModel);
        }}
    
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
                    _db.ImageGallery.Add(imageGallery);
                    _db.SaveChanges();
                }
                return Content("Success");
            }
            return Content("failed");
        }

        public ActionResult StoryBoard()
        {


            //var model = ArticleFactory.BuildStoryboard();
            var model = _db.Storyboards.ToList();
           // var model = ArticleFactory.BuildArticles(5, 1, new ArticleCollectionSettings() { CategoryName = "Event", IsVisible = true });
            //ViewBag.Event = ArticleFactory.BuildArticles(7, 1, new ArticleCollectionSettings() { CategoryName = "Event", IsVisible = true });



            return View(model);
           
        }



    }
}
