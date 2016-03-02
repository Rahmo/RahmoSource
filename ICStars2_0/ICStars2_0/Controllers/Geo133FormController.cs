using System;
using System.Data;
using System.Drawing;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebPages;
using ICStars2_0.BusinessLayer.GeoServices;
using ICStars2_0.Common;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using Microsoft.Practices.Unity;
using PagedList;
//For injections

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
            GEO133 model = new GEO133();
            model.OnlineInfo = new  GeoOnlineInformation();
            model.siteData = new GeoSiteData();
            return View(model);
        }

        [HttpPost]
        public ActionResult Main(string submitButton, GEO133 model)
        {

            if (!ModelState.IsValid)
            {
            
                return View();
            }
            if (submitButton == "Create")
            {
       
                if (ModelState.IsValid)
                {
                   
                    return Create(model);
                }
             
                    return View();
                

            }
   

            if (submitButton == "Save")
            {
                return update(model);
            }
       
            return View();
        }


        [HttpPost]
        //[ValidateAntiForgeryToken]
        private ActionResult update(GEO133 geoform)
        {
            using (var db = new GeoDbContext())
            {
                var Updateg = db.GEO133.Find(geoform.Id);
                //Updateg = geoform; 

                Updateg.blockNumber = geoform.blockNumber;
                Updateg.buildingAddress = geoform.buildingAddress;
                Updateg.far = geoform.far;
                Updateg.pinNumber = geoform.pinNumber;
                Updateg.zipCode = geoform.zipCode;
                Updateg.zoning = geoform.zoning;
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


        public JsonResult load(string DpuId,string pinNo)
        {
            
            using (var db = new GeoDbContext())
            {
                var data = (from p in db.GEO133
                    .Where(p => p.DpuId == DpuId && p.pinNumber == pinNo )
                    select new
                    {
                        p.Id,
                        p.blockNumber,
                        p.buildingAddress,
                        p.DpuId,
                        p.far,
                        p.pinNumber,
                        p.zipCode,
                        p.zoning,
                        p.OnlineInfo,
                        p.siteData
                    }).ToList();

                //the code to assign the result to an object
               

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
                if (data.FirstOrDefault() == null)
                {
                    return null;
                }
                ;
                return Json(data.First(), JsonRequestBehavior.AllowGet);
            }


            // it is important to put allow get 
        }

    

        public ActionResult student()
        {
            return View();
        }

        public ActionResult teacher()
        {
            return View();
        }

        public ActionResult Export()
        {
            return View();
        }

        public ActionResult List(string sortOrder, string currentFilter, string searchString, int? page)
        {
          //    ExportToExcel();
            using (var db = new GeoDbContext())
            {
                // return View(db.GEO133.ToList());
                ViewBag.CurrentSort = sortOrder;
                ViewBag.NameSortParm = string.IsNullOrEmpty(sortOrder) ? "name_desc" : "";
                ViewBag.DateSortParm = sortOrder == "Date" ? "date_desc" : "Date";

                if (searchString != null)
                {
                    page = 1;
                }
                else
                {
                    searchString = currentFilter;
                }

                ViewBag.CurrentFilter = searchString;

                var Resources = from s in db.GEO133
                    orderby s.Id
                    select s;

                var pageSize = 10;
                var pageNumber = page ?? 1;
                return View(Resources.ToPagedList(pageNumber, pageSize));
            }
        }

        public ActionResult ExportToExcel(string dpuId)
        {

            using (var db = new GeoDbContext())
            {
                var data = (from p in db.GEO133
                    .Where(p => p.DpuId == dpuId)
                    select new
                    {
                        p.Id,
                        p.blockNumber,
                        p.buildingAddress,
                        p.DpuId,
                        p.far,
                        p.pinNumber,
                        p.zipCode,
                        p.zoning,
                        p.OnlineInfo,
                        p.siteData
                    }).ToList()
                    ///the part below have the result as an object GEO because without that LINQ retuns IMMUTABLE object
                                         .Select(x => new GEO133()
                                         {
                                             Id = x.Id,
                                             blockNumber = x.blockNumber,
                                             buildingAddress = x.buildingAddress,
                                             DpuId = x.DpuId,
                                             far = x.far,
                                             pinNumber = x.pinNumber,
                                             zipCode = x.zipCode,
                                             zoning = x.zoning,
                                             OnlineInfo = x.OnlineInfo,
                                             siteData = x.siteData,
                                         }).ToList();

                    var products = new DataTable("teste");
                products.Columns.Add("dd");

                products.Columns.Add("PIN");
                products.Columns.Add("Address Number");
                products.Columns.Add("Address Name");
                products.Columns.Add("Zip Code");
                products.Columns.Add("Zoning");
                products.Columns.Add("FAR");
                products.Columns.Add("Facade");
                products.Columns.Add("Exterior");



                products.Columns.Add("Overall");
                products.Columns.Add("Stories");
                products.Columns.Add("Ftype (A-F)");
                products.Columns.Add("Esoil");
                products.Columns.Add("Garden");
                products.Columns.Add("Gtype");
                products.Columns.Add("Signs (A-D)");

                products.Columns.Add("1use");

                products.Columns.Add("1occu");


                products.Columns.Add("2use");

                products.Columns.Add("2occu");

                products.Columns.Add("3use");

                products.Columns.Add("3occu");

                products.Columns.Add("4use");


                products.Columns.Add("4occu");

                products.Columns.Add("back(use)");

                products.Columns.Add("back(occ)");

                products.Columns.Add("Stru_class (A-F)");

                products.Columns.Add("1999Value_L");

                products.Columns.Add("1999Value_B");

                products.Columns.Add("1999total");




                products.Columns.Add("2001Value_L");

                products.Columns.Add("2001Value_B");

                products.Columns.Add("2001total");

                products.Columns.Add("2014Value_L");


                products.Columns.Add("2014Value_B");

                products.Columns.Add("2014total");

                products.Columns.Add("2015Value_L");

                products.Columns.Add("2015Value_B");

                products.Columns.Add("2015total");

                products.Columns.Add("2014_Est_Mkt_val");

                products.Columns.Add("2015_Est_Mkt_val");

                products.Columns.Add("byear");

                products.Columns.Add("Census Tract");
                products.Columns.Add("Pccode");
                products.Columns.Add("#stories");
                products.Columns.Add("Building Sq. Foot");
                products.Columns.Add("Land Sq. Foot");
                products.Columns.Add("Property Description (A-G)");
                products.Columns.Add("Age");
                products.Columns.Add("Previous Year Exemption Total");
                products.Columns.Add("Exemption Reason");
                products.Columns.Add("Homeowner 2014");
                products.Columns.Add("Senior Citizen Prev Year");
                products.Columns.Add("Senior Freeze Prev Year");
                products.Columns.Add("Name_taxpayer_2014");
                products.Columns.Add("#TP_2014_Address Number");
                products.Columns.Add("TP_2014_Address Street");
                products.Columns.Add("TP_2014_Address City");
                products.Columns.Add("TP_2014_Address state");
                products.Columns.Add("TP_2014_Address zip");
                products.Columns.Add("2014pptax");
                products.Columns.Add("2014owed");
                products.Columns.Add("Same");
                products.Columns.Add("Name_taxpayer_2015");
                products.Columns.Add("TP_2015_Address Number");
                products.Columns.Add("TP_2015_Address Street");
                products.Columns.Add("TP_2015_Address City");
                products.Columns.Add("TP_2015_Address state");
                products.Columns.Add("TP_2015_Address zip");
                products.Columns.Add("2014 in_TIF");
                products.Columns.Add("2014 TIF %");
                products.Columns.Add("2014 Education %");
                products.Columns.Add("2014 School Building %");
                products.Columns.Add("2014 Park District %");
                products.Columns.Add("2014 Library %");
                products.Columns.Add("2015 Sale");
                products.Columns.Add("2015saledate");
                products.Columns.Add("Price at 2015 Sale ($)");
                products.Columns.Add("Unit Number");
                products.Columns.Add("For Sale Now");
                products.Columns.Add("Price");
                products.Columns.Add("Bedrooms");
                products.Columns.Add("Historic Rating");
                products.Columns.Add("Assessor Photo");
                products.Columns.Add("Assessor Photo Date");
                products.Columns.Add("Your Photo");
                products.Columns.Add("Your Photo Date");
                products.Columns.Add("Maximum Building Sq. Foot");
                products.Columns.Add("Available Sq. Ft.");
                products.Columns.Add("Assessed Value % change (1999-2014)");
                products.Columns.Add("Assessed Value % change (1999-2001)");
                products.Columns.Add("Assessed Value % change (2001-2013)");
                products.Columns.Add("Assessed Value % change (2001-2014)");
                products.Columns.Add("Assessed Value % change (2013-2014) Number");
                products.Columns.Add("Est. Mkt. Value % Change (2013-2014) Street");
                products.Columns.Add("Est. Mkt. Value $ Change (2013-2014) City");
                products.Columns.Add("TIF ($)");
                products.Columns.Add("Education $");
                products.Columns.Add("School Building $");
                products.Columns.Add("Parks ($)");
                products.Columns.Add("Library ($)");
                products.Columns.Add("HD25% ($)");

              
                foreach (GEO133 model in data)
                {

                    //Setup 
                    //Now we can change the values
            
                    if (!model.far.IsDecimal())
                    {
                        model.far = 0.ToString();
                    }








                   
                    products.Rows.Add(1, model.pinNumber, model.buildingAddress, model.buildingAddress
                        , model.zipCode, model.zoning, model.far,
                        model.siteData.mainStreetFacade, model.siteData.exterior, model.siteData.overallViability,
                        model.siteData.numberOfStories
                        , model.siteData.facadeType, model.siteData.patchesExposed, model.siteData.GardenActivity,
                        model.siteData.EvidenceOfGardenType
                        , model.siteData.SignPostedOnBuilding, model.siteData.FirstUse, model.siteData.FirstOccupancy,
                        model.siteData.SecondUse
                        , model.siteData.SecondOccupancy, model.siteData.ThirdUse, model.siteData.ThirdOccupancy
                        , model.siteData.FirstUse, model.siteData.FourthOccupancy, model.siteData.BackRearUse,
                        model.siteData.BackRearOccupancy
                        , model.siteData.StructureClassification, model.OnlineInfo.AssessedValuesLand__,
                        model.OnlineInfo.AssessedValuesBuilding__,
                        model.OnlineInfo.AssessedValuesTotal__, model.OnlineInfo.AssessedValuesLand_,
                        model.OnlineInfo.AssessedValuesBuilding_
                        , model.OnlineInfo.AssessedValuesTotal_, model.OnlineInfo.AssessedValuesLand,
                        model.OnlineInfo.AssessedValuesBuilding,
                        model.OnlineInfo.AssessedValuesTotal, model.OnlineInfo.AssessedValuesLandPlus,
                        model.OnlineInfo.AssessedValuesBuildingPlus,
                        model.OnlineInfo.AssessedValuesTotalPlus, model.OnlineInfo.AssessedValuesEstMkt,
                        model.OnlineInfo.AssessedValuesEstMktPlus,
                        model.OnlineInfo.yearBuild, model.OnlineInfo.censusTract, model.OnlineInfo.propertyClass,
                        model.OnlineInfo.Stories, model.OnlineInfo.BuildingSquareFootage
                        , model.OnlineInfo.LandSquareFootage, model.OnlineInfo.propertyDescription, model.OnlineInfo.age,
                        model.OnlineInfo.PropertyTaxExemptions
                        , model.OnlineInfo.TaxExemptionsStatus, model.OnlineInfo.TreasurerSiteHomeowner,
                        model.OnlineInfo.TreasurerSeniorCitizen, model.OnlineInfo.TreasurerSiteSeniorFreeze
                        , model.OnlineInfo.taxPayerName, model.OnlineInfo.taxpayerMailing,
                        model.OnlineInfo.taxpayerMailing, model.OnlineInfo.taxpayerMailing
                        , model.OnlineInfo.taxpayerMailing, model.OnlineInfo.taxpayerMailing,
                        model.OnlineInfo.PreviousYearPropertyTax
                        , model.OnlineInfo.CurrentYearTaxesOwed, model.OnlineInfo.isCurrentYearAsPrev,
                        model.OnlineInfo.TaxPayerInfo
                        , model.OnlineInfo.TaxPayerInfo, model.OnlineInfo.TaxPayerInfo, model.OnlineInfo.TaxPayerInfo,
                        model.OnlineInfo.TaxPayerInfo
                        , model.OnlineInfo.TaxPayerInfo, model.OnlineInfo.isInTifDistrict, model.OnlineInfo.TifArea,
                        model.OnlineInfo.BoardOfEducation
                        , model.OnlineInfo.SchoolImprovments, model.OnlineInfo.ParkDistrict,
                        model.OnlineInfo.LibraryFund, model.OnlineInfo.isPropertySoldInCurrentYear
                        , model.OnlineInfo.saleDate, model.OnlineInfo.salePrice, model.OnlineInfo.unitNumber,
                        model.OnlineInfo.isForSale, model.OnlineInfo.listedPrice
                        , model.OnlineInfo.bedroomsNumber, model.OnlineInfo.isOrange, model.OnlineInfo.isPhotoDownloaded,
                        model.OnlineInfo.PhotoDate, model.OnlineInfo.isFollowingYPhotoTaken
                        , model.OnlineInfo.StudentPhotoDate,

                        double.Parse(CheckNull(model.far))*double.Parse(CheckNull(model.OnlineInfo.LandSquareFootage))
                        ,
                        double.Parse(CheckNull(model.far))*double.Parse(CheckNull(model.OnlineInfo.LandSquareFootage)),
                        ((double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotalPlus)) -
                          (double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotal__))))/
                         double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotal__)))*100,
                        ((double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotal_)) -
                          (double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotal__))))/
                         double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotal__)))*100,

                        ((double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotal)) -
                          (double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotal_))))/
                         double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotal_)))*100,
                        ((double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotalPlus)) -
                          (double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotal_))))/
                         double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotal_)))*100,

                        ((double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotalPlus)) -
                          (double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotal))))/
                         double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotal)))*100,
                        ((double.Parse(CheckNull(model.OnlineInfo.AssessedValuesEstMktPlus)) -
                          (double.Parse(CheckNull(model.OnlineInfo.AssessedValuesEstMkt))))/
                         double.Parse(CheckNull(model.OnlineInfo.AssessedValuesEstMkt)))*100,

                        ((double.Parse(CheckNull(model.OnlineInfo.AssessedValuesEstMktPlus)) -
                          (double.Parse(CheckNull(model.OnlineInfo.AssessedValuesEstMkt))))),
                        ((double.Parse(CheckNull(model.OnlineInfo.PreviousYearPropertyTax))*(CheckNull(model.OnlineInfo.TifArea))))/100,
                        ((double.Parse(CheckNull(model.OnlineInfo.PreviousYearPropertyTax)))*(CheckNull(model.OnlineInfo.BoardOfEducation)))/
                        100,
                        ((double.Parse(CheckNull(model.OnlineInfo.PreviousYearPropertyTax)))*(CheckNull(model.OnlineInfo.SchoolImprovments)))/
                        100,
                        ((double.Parse(CheckNull(model.OnlineInfo.PreviousYearPropertyTax)))*(CheckNull(model.OnlineInfo.ParkDistrict)))/100,
                        ((double.Parse(CheckNull(model.OnlineInfo.PreviousYearPropertyTax)))*(CheckNull(model.OnlineInfo.LibraryFund)))/100,
                        (double.Parse(CheckNull(model.OnlineInfo.AssessedValuesEstMktPlus))/4)
                        );

                   
                }
                var grid = new GridView();
                grid.DataSource = products;
                grid.DataBind();
                grid.BackColor = Color.Beige;
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment; filename=MyExcelFile.xls");
                Response.ContentType = "application/ms-excel";

                Response.Charset = "";
                var sw = new StringWriter();
                var htw = new HtmlTextWriter(sw);

                grid.RenderControl(htw);

                Response.Output.Write(sw.ToString());
                Response.Flush();
                Response.End();
                return View("MyView");
        } }

        private double? CheckNull(double? s)
        {
            try
            {
                if (s == null)
                {
                    s = 0;
                }
                return s;
            }
            catch (Exception exception)
            {

                throw exception;
            }
        }

        internal string CheckNull(string s)
        {
            try
            {
                if (s == null)
                {
                    s = "0"; 
                }
                return s;
            }
            catch (Exception exception)
            {
               
                throw exception;
            }
        }
       
        private ActionResult Create(GEO133 model)
        {
            try
            {
               geoFactory.Add(model);
                TempData["Response"] = "Your form has been saved succefully! ";
                return RedirectToAction("Main");
            }
            catch (Exception exception)
            {

                Console.WriteLine("IOException source: {0}", exception.Source);
            }
            

            return View();
            //  throw new NotImplementedException();
        }


    }
}