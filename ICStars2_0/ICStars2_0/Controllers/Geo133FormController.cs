
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;
using ICStars2_0.BusinessLayer.GeoServices;
using System.Data;
using System.Data.Entity.Validation;  //For injections

namespace ICStars2_0.Controllers
{
    public class Geo133FormController : Controller
    {
        //
        // GET: /Geo133Form/
        [Dependency]
        public IGeoFactory geoFactory { get; set; }
        
        public ActionResult Index()
        {
           using (var db = new GeoDbContext())
            {
                return View();
         }

      
        }

        public ActionResult Main()
        {

            return View();

        }

         [HttpPost]
        public ActionResult Main(string submitButton, GEO133 model)
        {


            if (submitButton == "Save")
            {
                // delegate sending to another controller action
                return (save(model));

            }
            else if (submitButton == "Submit")
            {
                // call another action to perform the cancellation
                return (submit(model));
            }

            else if (submitButton == "Update")
             {
             return (update(model));
             
             }
            // ModelState.Clear()
            //if (ModelState.IsValid)
            //{
                geoFactory.Add(model);
            //}
                return View();

        }
        
      
        [HttpPost]
        //[ValidateAntiForgeryToken]
         private ActionResult update (GEO133 geoform){
            

                 using (var db = new GeoDbContext())
                 {
                     GEO133 Updateg = db.GEO133.Find(geoform.Id);

                     Updateg.OnlineInfo = geoform.OnlineInfo;
                     Updateg.siteData = geoform.siteData;


                     //db.Entry(geoform).State = EntityState.Modified;
                     //db.Entry(geoform.siteData).State = EntityState.Modified;
                     //db.GEO133.Attach(Updateg);
                     db.Entry(Updateg).State = EntityState.Modified;
                     //db.Entry(geoform.OnlineInfo).(p => p.siteData).Load();
                     //db.Entry(geoform).Collection(p => p.OnlineInfo).Load();
                     db.SaveChanges();

                     return RedirectToAction("Main");

                 }
             
            
            
           
             //   organization.DateCreated = DateTime.Now;
               
            
            return Main();
         
         }
            

         public JsonResult load(int DpuId)
         {
             using (var db = new GeoDbContext())
             {
               

        
                var data = (from p in db.GEO133
                            .Where(p => p.DpuId == DpuId)
                            select new
                            {
                                Id = p.Id,
                                blockNumber = p.blockNumber,
                                buildingAddress = p.buildingAddress,
                                DpuId = p.DpuId,
                                far = p.far,
                                pinNumber = p.pinNumber,
                                zipCode = p.zipCode,
                                zoning = p.zoning,
                                OnlineInfo = p.OnlineInfo,
                                siteData = p.siteData
                            }).ToList();
        //                    .Select(x => new GEO133()   
        //{  
        //                  Id = x.Id,  
        //                  blockNumber = x.blockNumber,  
        //                  buildingAddress = x.buildingAddress,
        //                  DpuId = x.DpuId,
        //                  far = x.far,
        //                  pinNumber = x.pinNumber,
        //                  zipCode = x.zipCode,
        //                  zoning = x.zoning,
        //                  OnlineInfo = x.OnlineInfo,
        //                  siteData = x.siteData,
        //} ); 
        
                    //  .Select(x => new GEO133
                      //{
                   
                      //}).ToList();
               //  GEO133 data = db.GEO133.First(a => a.DpuId == DpuId);
                 //data.blockNumber = 11111111; 
                 //               GEO133 sds = new GEO133();
                 //var geo133 = db.GEO133.SingleOrDefault(a => a.DpuId == DpuId);
                 // GEO133 geo133 = db.GEO133.SingleOrDefault(a => a.DpuId == DpuId);
              //   GEO133 model = (db.GEO133.First(i => i.DpuId == DpuId));
                // GEO133 model = (db.GEO133.First(i => i.DpuId == DpuId));
                 if (data.FirstOrDefault()==null) { return null; };
                 return Json(data.First(), JsonRequestBehavior.AllowGet);
              }
          
            
         
          
                 // it is important to put allow get 
             
             
         
         }
         private ActionResult submit(GEO133 model)
         {
             geoFactory.Add(model);
             //throw new NotImplementedException();
             return Main();
         }

        

         private ActionResult save(GEO133 model)
         {
             geoFactory.Add(model);

             return Main();
           //  throw new NotImplementedException();
         }


         public ActionResult Main2()
         {

             return View();

         }

    }
}
