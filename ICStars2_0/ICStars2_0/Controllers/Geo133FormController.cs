using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.WebPages;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using DocumentFormat.OpenXml.Wordprocessing;
using ICStars2_0.BusinessLayer.GeoServices;
using ICStars2_0.Common;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using Microsoft.Practices.Unity;
using PagedList;
using ICStars2_0.Mvc.Filter;
using Color = System.Drawing.Color;
using OfficeOpenXml;
using OfficeOpenXml.Style;

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
             
                    
                

            }
   

            if (submitButton == "Save")
            {
                return update(model);
            }

           
            return View();
        }
        public ActionResult Details(int id)
        {
            using (var db = new GeoDbContext())
            {
                GEO133 model =  db.GEO133.Find(id);
                if (model == null || model.OnlineInfo == null || model.siteData == null)
                {
                    return HttpNotFound();
                }
                return View(model);
            }
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
                Updateg.buildingNumber = geoform.buildingNumber;
                Updateg.buildingStreet = geoform.buildingStreet;
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
                TempData["Response"] = "Your changes has been saved succefully! ";
                return Main();
            }

            TempData["Response"] = "Your data has not been save please make sure of you inputs ! ";
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
                        p.buildingNumber,
                        p.buildingStreet,
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
            //Response.Cookies.Remove("Euan2016");
            FormsAuthentication.SignOut();
            return View();
        }

       

        [HttpPost]
        public ActionResult Login(LoginTeacher m)
        {

            if ((m.UserName.Equals("Ehague12") && (m.Password.Equals("geo133dpu"))))
            {
           
            FormsAuthentication.SetAuthCookie("Ehague12", true);

                return RedirectToAction("List");
               // return View("List");
            }
            return View("teacher");
        }

      
        public ActionResult Export()
        {
            return View();
        }
        
        [MvcAuthorize(UnauthorizedRedirectUrl = "", Users = "Ehague12", IsRedirectOnly = true) ]
       // [Authorize(url = "/Geo133Form/teacher", Users = "Euan2016")]
        public ActionResult List(string sortOrder, string currentFilter, string searchString, int? page)
        {
          
            //    ExportToExcel();
            using (var db = new GeoDbContext())
            {
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
                if (!String.IsNullOrEmpty(searchString))
                {
                    Resources = Resources.Where(s => s.DpuId.Contains(searchString)).OrderBy(s => s.Id);
                }
                var pageSize = 10;
                var pageNumber = page ?? 1;
                return View(Resources.ToPagedList(pageNumber, pageSize));
            }
        }

        public void ExportToExcel(string dpuId)
        {

            using (var db = new GeoDbContext())
            {
                var data = (from p in db.GEO133
                    .Where(p => p.DpuId == dpuId)
                    select new
                    {
                        p.Id,
                        p.blockNumber,
                        p.buildingNumber,
                        p.buildingStreet,
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
                                             buildingNumber = x.buildingNumber,
                                             buildingStreet = x.buildingStreet,
                                             DpuId = x.DpuId,
                                             far = x.far,
                                             pinNumber = x.pinNumber,
                                             zipCode = x.zipCode,
                                             zoning = x.zoning,
                                             OnlineInfo = x.OnlineInfo,
                                             siteData = x.siteData,
                                         }).ToList();
                
                var products = new DataTable("teste");
                
              //  products.Columns.Add("dd");

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

                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + "Value_L");


                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + "Value_B");

                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-2))+"total");

                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-1)) + "Value_L");

                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-1)) + "Value_B");

                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-1))+"total");

                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + "_Est_Mkt_val");

                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-1)) + "_Est_Mkt_val");

                products.Columns.Add("byear");

                products.Columns.Add("Census Tract");
                products.Columns.Add("Pccode");
                products.Columns.Add("#stories");
                products.Columns.Add("Building Sq. Foot");
                products.Columns.Add("Land Sq. Foot");
                products.Columns.Add("Property Description (A-G)");
                products.Columns.Add("Age");
              
                products.Columns.Add("Exemption Reason");
                products.Columns.Add("Homeowner "+ string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) );
                products.Columns.Add("Senior Citizen Prev Year");
                products.Columns.Add("Previous Year Exemption Total");
                products.Columns.Add("Senior Freeze Prev Year");
                products.Columns.Add("Name_taxpayer_"+ string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) );
                products.Columns.Add("#TP_"+ string.Format("{0:yyyy}", DateTime.Today.AddYears(-2))+"_Address Number");
                products.Columns.Add("TP_" + string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + "_Address Street");
                products.Columns.Add("TP_" + string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + "_Address City");
                products.Columns.Add("TP_" + string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + "_Address state");
                products.Columns.Add("TP_" + string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + "_Address zip");
                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + "pptax");
                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + "owed");
                products.Columns.Add("Same");
                products.Columns.Add("Name_taxpayer_"+string.Format("{0:yyyy}", DateTime.Today.AddYears(-1)) );
                products.Columns.Add("TP_" + string.Format("{0:yyyy}", DateTime.Today.AddYears(-1)) + "_Address Number");
                products.Columns.Add("TP_" + string.Format("{0:yyyy}", DateTime.Today.AddYears(-1)) + "_Address Street");
                products.Columns.Add("TP_" + string.Format("{0:yyyy}", DateTime.Today.AddYears(-1)) + "_Address City");
                products.Columns.Add("TP_" + string.Format("{0:yyyy}", DateTime.Today.AddYears(-1)) + "_Address state");
                products.Columns.Add("TP_" + string.Format("{0:yyyy}", DateTime.Today.AddYears(-1)) + "_Address zip");
                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + " in_TIF");
                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + " TIF %");
                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + " Education %");
                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + " School Building %");
                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + " Park District %");
                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + " Library %");
                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-1)) + " Sale");
                products.Columns.Add(string.Format("{0:yyyy}", DateTime.Today.AddYears(-1)) + "saledate");
                products.Columns.Add("Price at "+string.Format("{0:yyyy}", DateTime.Today.AddYears(-1)) + " Sale ($)");
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
                products.Columns.Add("Assessed Value % change (1999-"+string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + ")");
                products.Columns.Add("Assessed Value % change (1999-2001)");
                products.Columns.Add("Assessed Value % change (2001-2013)");
                products.Columns.Add("Assessed Value % change (2001-" + string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + ")");
                products.Columns.Add("Assessed Value % change (2013-" + string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + ") Number");
                products.Columns.Add("Est. Mkt. Value % Change (2013-" + string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + ") Street");
                products.Columns.Add("Est. Mkt. Value $ Change (2013-" + string.Format("{0:yyyy}", DateTime.Today.AddYears(-2)) + ") City");
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

                    


                    try
                    {

                        products.Rows.Add( model.pinNumber, model.buildingNumber, model.buildingStreet
                            , model.zipCode, model.zoning, model.far,
                            model.siteData.mainStreetFacade, model.siteData.exterior, model.siteData.overallViability,
                            model.siteData.numberOfStories
                            , model.siteData.facadeType, model.siteData.patchesExposed, model.siteData.GardenActivity,
                            model.siteData.EvidenceOfGardenType
                            , model.siteData.SignPostedOnBuilding, model.siteData.FirstUse,
                            model.siteData.FirstOccupancy,
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
                            model.OnlineInfo.AssessedValuesTotalPlus, string.Format("{0:C}", double.Parse(model.OnlineInfo.AssessedValuesEstMkt)),
                           string.Format("{0:C}", double.Parse(model.OnlineInfo.AssessedValuesEstMktPlus)),
                           string.Format("{0:yyyy}", model.OnlineInfo.yearBuild) , model.OnlineInfo.censusTract, model.OnlineInfo.propertyClass,
                            model.OnlineInfo.Stories, model.OnlineInfo.BuildingSquareFootage
                            , model.OnlineInfo.LandSquareFootage, model.OnlineInfo.propertyDescription,
                            model.OnlineInfo.age // Check
                            , model.OnlineInfo.TaxExemptionsStatus, model.OnlineInfo.TreasurerSiteHomeowner,
                            model.OnlineInfo.TreasurerSeniorCitizen, string.Format("{0:C}", model.OnlineInfo.PropertyTaxExemptions) , model.OnlineInfo.TreasurerSiteSeniorFreeze
                            , model.OnlineInfo.taxPayerName, model.OnlineInfo.taxpayerStreetNumber,
                            model.OnlineInfo.taxpayerStreetName, model.OnlineInfo.taxpayerCity
                            , model.OnlineInfo.taxpayerstate, model.OnlineInfo.taxpayerZip,
                           string.Format("{0:C}", double.Parse(model.OnlineInfo.PreviousYearPropertyTax))
                            , string.Format("{0:C}", model.OnlineInfo.CurrentYearTaxesOwed), model.OnlineInfo.isCurrentYearAsPrev,
                            model.OnlineInfo.CurrentYrTaxPayerName
                            , model.OnlineInfo.CurrentYrTaxpayerStreetNumber,
                            model.OnlineInfo.CurrentYrtaxpayerStreetName, model.OnlineInfo.CurrentYrtaxpayerCity,
                            model.OnlineInfo.CurrentYrtaxpayerstate
                            , model.OnlineInfo.CurrentYrtaxpayerZip, model.OnlineInfo.isInTifDistrict,
                            model.OnlineInfo.TifArea,
                            model.OnlineInfo.BoardOfEducation
                            , model.OnlineInfo.SchoolImprovments, model.OnlineInfo.ParkDistrict,
                            model.OnlineInfo.LibraryFund, model.OnlineInfo.isPropertySoldInCurrentYear
                            , model.OnlineInfo.saleDate, model.OnlineInfo.salePrice, model.OnlineInfo.unitNumber,
                            model.OnlineInfo.isForSale, model.OnlineInfo.listedPrice
                            , model.OnlineInfo.bedroomsNumber, model.OnlineInfo.isOrange,
                            model.OnlineInfo.isPhotoDownloaded,
                            model.OnlineInfo.PhotoDate, model.OnlineInfo.isFollowingYPhotoTaken
                            , model.OnlineInfo.StudentPhotoDate
                            ,
                            double.Parse(CheckNull(model.far))*
                            double.Parse(CheckNull(model.OnlineInfo.LandSquareFootage))
                            ,
                            (double.Parse(CheckNull(model.far))*
                            double.Parse(CheckNull(model.OnlineInfo.LandSquareFootage)) -
                             double.Parse(CheckNa(CheckNull(model.OnlineInfo.BuildingSquareFootage)))),
                            ((double.Parse(CheckNull(model.OnlineInfo.AssessedValuesTotalPlus)) -
                             (double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotal__)))))/
                            double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotal__))))*100
                            ,
                            ((double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotal_))) -
                              (double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotal__)))))/
                             double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotal__))))*100,

                            ((double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotal))) -
                              (double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotal_)))))/
                             double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotal_))))*100
                             ,
                            ((double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotalPlus))) -
                              (double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotal_)))))/
                             double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotal_))))*100,

                            ((double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotalPlus))) -
                             (double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotal)))))/
                            double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesTotal))))*100
                            ,
                            ((double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesEstMktPlus))) -
                              (double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesEstMkt)))))/
                             double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesEstMkt))))*100
                             ,

                             string.Format("{0:C}", ((double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesEstMktPlus))) -
                              (double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesEstMkt)))))))
                              ,
                            string.Format("{0:C}", ((CheckNull(model.OnlineInfo.TifArea))) * (double.Parse(CheckNa(CheckNull(checkSign(model.OnlineInfo.PreviousYearPropertyTax))))
                             ) / 100)
                             ,
                           string.Format("{0:C}", ((double.Parse(CheckNa(CheckNull(model.OnlineInfo.PreviousYearPropertyTax)))) *
                             (CheckNull(model.OnlineInfo.BoardOfEducation))) /
                            100)
                            ,
                             string.Format("{0:C}", ((double.Parse(CheckNa(CheckNull(model.OnlineInfo.PreviousYearPropertyTax)))) *
                             (CheckNull(model.OnlineInfo.SchoolImprovments))) /
                            100),
                            string.Format("{0:C}", ((double.Parse(CheckNa(CheckNull(model.OnlineInfo.PreviousYearPropertyTax)))) *
                             (CheckNull(model.OnlineInfo.ParkDistrict))) / 100),
                             string.Format("{0:C}",((double.Parse(CheckNa(CheckNull(model.OnlineInfo.PreviousYearPropertyTax)))) *
                             (CheckNull(model.OnlineInfo.LibraryFund))) / 100),
                             string.Format("{0:C}", (double.Parse(CheckNa(CheckNull(model.OnlineInfo.AssessedValuesEstMktPlus))) / 4))
                            );
                      

                    }

                    catch (System.FormatException e)
                    {

                        Console.WriteLine(e.Message + e.Source, e.StackTrace, e.Data, e.InnerException);
                    }
                    catch (Exception e)
                    {
                        Console.WriteLine(e.Message + e.Source, e.StackTrace, e.Data, e.InnerException);
                    }



                }


                // This function goes into each cell in the data table and update the cell from true and false to yes and no
                for (int i = 0; i < products.Rows.Count; i++)
                {
                    DataRow row = products.Rows[i];
                    object[] array = row.ItemArray;
                    for (int j = 0; j < array.Length; j++)
                    {
                        object cell = array[j];
                        if (products.Rows[i][j].ToString() == "True")
                        {
                            products.Rows[i][j] = "YES";
                        }
                        else if (products.Rows[i][j].ToString() == "False")
                        {
                            products.Rows[i][j] = "NO";
                        }
                        if (products.Rows[i]["Historic Rating"].ToString()== "True")
                        {
                            products.Rows[i]["Historic Rating"] = "Orange";
;                        }
                        else if (products.Rows[i]["Historic Rating"].ToString() == "False")
                        {

                            products.Rows[i]["Historic Rating"] = "None";
                        }

                    }
                }


                //old code
                  GetExcel(products);
                // 
               // ExportToExcelOpen(products);
                Response.Flush();
                Response.End();
                Response.Close();
                return ;
        } }

        private double CheckNull(double? s)
        {
            try
            {
                double nom = 0; 
                if (s == null)
                {
                    return nom;
                }

                return (double) s;
            }
            catch (Exception exception)
            {

                throw exception;
            }
        }

        public static List<SelectListItem> States = new List<SelectListItem>()
    {
        new SelectListItem() {Text="Alabama", Value="AL"},
        new SelectListItem() { Text="Alaska", Value="AK"},
        new SelectListItem() { Text="Arizona", Value="AZ"},
        new SelectListItem() { Text="Arkansas", Value="AR"},
        new SelectListItem() { Text="California", Value="CA"},
        new SelectListItem() { Text="Colorado", Value="CO"},
        new SelectListItem() { Text="Connecticut", Value="CT"},
        new SelectListItem() { Text="District of Columbia", Value="DC"},
        new SelectListItem() { Text="Delaware", Value="DE"},
        new SelectListItem() { Text="Florida", Value="FL"},
        new SelectListItem() { Text="Georgia", Value="GA"},
        new SelectListItem() { Text="Hawaii", Value="HI"},
        new SelectListItem() { Text="Idaho", Value="ID"},
        new SelectListItem() { Text="Illinois", Value="IL"},
        new SelectListItem() { Text="Indiana", Value="IN"},
        new SelectListItem() { Text="Iowa", Value="IA"},
        new SelectListItem() { Text="Kansas", Value="KS"},
        new SelectListItem() { Text="Kentucky", Value="KY"},
        new SelectListItem() { Text="Louisiana", Value="LA"},
        new SelectListItem() { Text="Maine", Value="ME"},
        new SelectListItem() { Text="Maryland", Value="MD"},
        new SelectListItem() { Text="Massachusetts", Value="MA"},
        new SelectListItem() { Text="Michigan", Value="MI"},
        new SelectListItem() { Text="Minnesota", Value="MN"},
        new SelectListItem() { Text="Mississippi", Value="MS"},
        new SelectListItem() { Text="Missouri", Value="MO"},
        new SelectListItem() { Text="Montana", Value="MT"},
        new SelectListItem() { Text="Nebraska", Value="NE"},
        new SelectListItem() { Text="Nevada", Value="NV"},
        new SelectListItem() { Text="New Hampshire", Value="NH"},
        new SelectListItem() { Text="New Jersey", Value="NJ"},
        new SelectListItem() { Text="New Mexico", Value="NM"},
        new SelectListItem() { Text="New York", Value="NY"},
        new SelectListItem() { Text="North Carolina", Value="NC"},
        new SelectListItem() { Text="North Dakota", Value="ND"},
        new SelectListItem() { Text="Ohio", Value="OH"},
        new SelectListItem() { Text="Oklahoma", Value="OK"},
        new SelectListItem() { Text="Oregon", Value="OR"},
        new SelectListItem() { Text="Pennsylvania", Value="PA"},
        new SelectListItem() { Text="Rhode Island", Value="RI"},
        new SelectListItem() { Text="South Carolina", Value="SC"},
        new SelectListItem() { Text="South Dakota", Value="SD"},
        new SelectListItem() { Text="Tennessee", Value="TN"},
        new SelectListItem() { Text="Texas", Value="TX"},
        new SelectListItem() { Text="Utah", Value="UT"},
        new SelectListItem() { Text="Vermont", Value="VT"},
        new SelectListItem() { Text="Virginia", Value="VA"},
        new SelectListItem() { Text="Washington", Value="WA"},
        new SelectListItem() { Text="West Virginia", Value="WV"},
        new SelectListItem() { Text="Wisconsin", Value="WI"},
        new SelectListItem() { Text="Wyoming", Value="WY"}
    };
        private void GetExcel(DataTable tbl)
        {
           
          

            using (ExcelPackage pck = new ExcelPackage())
            {
      
                //Create the worksheet
                ExcelWorksheet ws = pck.Workbook.Worksheets.Add("demo");



                //Load the datatable into the sheet, starting from cell A1. Print the column names on row 1
                ws.Cells["A1"].LoadFromDataTable(tbl, true);
                //  ws.Cells["D1"].Formula = "=INT(0.5)";
                // ws.Cells.Style.Numberformat.Format = "0.0%";
                ws.Column(1).Style.HorizontalAlignment = ExcelHorizontalAlignment.Right;


                // The following is to style with no decimal 
                ws.Column(1).Style.Numberformat.Format = "0";
                //2 3  5 11 28 29 30-39  43 45-47 49 56 60 88 89    
                //1 2  4 10 27 28 29-38  42 44-46 48 55 59 87 88
                ws.Column(2).Style.Numberformat.Format = "0";
                ws.Column(4).Style.Numberformat.Format = "0";
                ws.Column(10).Style.Numberformat.Format = "0";
                ws.Column(27).Style.Numberformat.Format = "0";
                ws.Column(28).Style.Numberformat.Format = "0";
                ws.Column(29).Style.Numberformat.Format = "0";
                ws.Column(30).Style.Numberformat.Format = "0";
                ws.Column(31).Style.Numberformat.Format = "0";
                ws.Column(32).Style.Numberformat.Format = "0";
                ws.Column(33).Style.Numberformat.Format = "0";
                ws.Column(34).Style.Numberformat.Format = "0";
                ws.Column(35).Style.Numberformat.Format = "0";
                ws.Column(36).Style.Numberformat.Format = "0";
                ws.Column(37).Style.Numberformat.Format = "0";
                ws.Column(38).Style.Numberformat.Format = "0";
                ws.Column(42).Style.Numberformat.Format = "0";
                ws.Column(44).Style.Numberformat.Format = "0";
                ws.Column(45).Style.Numberformat.Format = "0";
                ws.Column(46).Style.Numberformat.Format = "0";
                ws.Column(48).Style.Numberformat.Format = "0";
                ws.Column(55).Style.Numberformat.Format = "0";
                ws.Column(59).Style.Numberformat.Format = "0";
                ws.Column(87).Style.Numberformat.Format = "0";
                ws.Column(88).Style.Numberformat.Format = "0";

                // To style the element with one decimal in place 
                ws.Column(6).Style.Numberformat.Format = "0.0";

                // 76 - 71  89 - 94
                // 75-70    88 = 93
                // to style with 10 decimal in place 
                ws.Column(70).Style.Numberformat.Format = "0.0000000000";
                ws.Column(71).Style.Numberformat.Format = "0.0000000000";
                ws.Column(72).Style.Numberformat.Format = "0.0000000000";
                ws.Column(73).Style.Numberformat.Format = "0.0000000000";
                ws.Column(74).Style.Numberformat.Format = "0.0000000000";
                //ws.Column(75).Style.Numberformat.Format = "0.0000000000";
                //ws.Column(88).Style.Numberformat.Format = "0.0000000000";
                ws.Column(89).Style.Numberformat.Format = "0.0000000000";
                ws.Column(90).Style.Numberformat.Format = "0.0000000000";
                ws.Column(91).Style.Numberformat.Format = "0.0000000000";
                ws.Column(92).Style.Numberformat.Format = "0.0000000000";
                ws.Column(93).Style.Numberformat.Format = "0.0000000000";
                ws.Column(94).Style.Numberformat.Format = "0.0000000000";

                // To style as currency "$0.00";
                ws.Column(39).Style.Numberformat.Format = "$0.00";
                ws.Column(40).Style.Numberformat.Format = "$0.00";
               
                ws.Column(52).Style.Numberformat.Format = "$0.00";
                ws.Column(60).Style.Numberformat.Format = "$0.00";
                ws.Column(61).Style.Numberformat.Format = "$0.00";
                ws.Column(77).Style.Numberformat.Format = "$0.00";
                ws.Column(80).Style.Numberformat.Format = "$0.00";
                ws.Column(95).Style.Numberformat.Format = "$0.00";
                ws.Column(96).Style.Numberformat.Format = "$0.00";
                ws.Column(97).Style.Numberformat.Format = "$0.00";
                ws.Column(98).Style.Numberformat.Format = "$0.00";
                ws.Column(99).Style.Numberformat.Format = "$0.00";
                ws.Column(100).Style.Numberformat.Format ="$0.00";
                ws.Column(101).Style.Numberformat.Format = "$0.00";


                //date
                //ws.Column(41).Style.Numberformat.Format = "yyyy"
               //TO HAVE THE DATE AS YEAR FORMAT ONLY 
                ws.Column(41).Style.Numberformat.Format = "yyyy;@";

                ws.Column(1).Style.ShrinkToFit = true;
              
                ws.Column(4).Style.Numberformat.Format = "0";

                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                string fileName = "File" + DateTime.Now.ToString("MMddyyyy_HHmmss") + ".xlsx"; // change to xlsx
                Response.AddHeader("content-disposition", "attachment;filename=" + fileName);
                Response.BinaryWrite(pck.GetAsByteArray());
            }
        }

        private string checkSign(string str)
        {
            try
            {
                if (str == "N/A" || str == "n/a" || str == "n/A" || str == "N/a")
                {

                    return "0";
                }
                else
                {

                    int maxLength = str.Length;
                    string n = "";
                    if (!Char.IsNumber(str[0]))
                    {
                        n = str.Substring(1);

                    }
                    else
                    {
                        n = str;
                    }


                    if (!Char.IsNumber(n[maxLength - 2]))
                    {
                        n = n.Substring(0, maxLength - 2);
                    }
                    return n;
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e.InnerException);
            }
            return null ; 
        }
      
      

        internal string CheckNa(string s)
        {
          ;
            try
            {
                if (s == "N/A" || s == "n/a" || s == "n/A" || s == "N/a")
                {
                    string ZeroChar = "0";
                    return ZeroChar;
                }
                
                return s;
            }
            catch (Exception exception)
            {

                throw exception;
            }
        }
        static string CheckNull(string s)
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
               
                throw exception.InnerException;
            }
        }
       
        private ActionResult Create(GEO133 model)
        {
            try
            {
               geoFactory.Add(model);
                TempData["Response"] = "Your form has been created succefully! ";
                return RedirectToAction("Main");
            }
            catch (Exception exception)
            {

                Console.WriteLine("IOException source: {0}", exception.Source);
            }
            

            return View();
            //  throw new NotImplementedException();
        }

        public void ExportToExcelOpen(DataTable tbl)
        {
            // Create a spreadsheet document by supplying the filename
            // By default, AutoSave = true, Editable = true, and Type = xlsx

          Response.ClearHeaders();
          Response.ClearContent();
           Response.Clear();
           Response.Buffer = true;
            string fileName = "File" + DateTime.Now.ToString("MMddyyyy_HHmmss") + ".xlsx";
            Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
            Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
           Response.Charset = "";

            MemoryStream ms = new MemoryStream();

            using (var objSpreadsheet = SpreadsheetDocument.Create(ms, DocumentFormat.OpenXml.SpreadsheetDocumentType.Workbook))
            {
                var workbookPart = objSpreadsheet.AddWorkbookPart();
                objSpreadsheet.WorkbookPart.Workbook = new DocumentFormat.OpenXml.Spreadsheet.Workbook();
                objSpreadsheet.WorkbookPart.Workbook.Sheets = new DocumentFormat.OpenXml.Spreadsheet.Sheets();

                uint sheetId = 1;

              
                    var sheetPart = objSpreadsheet.WorkbookPart.AddNewPart<WorksheetPart>();
                    var sheetData = new DocumentFormat.OpenXml.Spreadsheet.SheetData();
                    sheetPart.Worksheet = new DocumentFormat.OpenXml.Spreadsheet.Worksheet(sheetData);

                    DocumentFormat.OpenXml.Spreadsheet.Sheets sheets = objSpreadsheet.WorkbookPart.Workbook.GetFirstChild<DocumentFormat.OpenXml.Spreadsheet.Sheets>();
                    string relationshipId = objSpreadsheet.WorkbookPart.GetIdOfPart(sheetPart);


                    //if (sheets.Elements<DocumentFormat.OpenXml.Spreadsheet.Sheet>().Count() > 0)
                    //{
                    //    sheetId =
                    //        sheets.Elements<DocumentFormat.OpenXml.Spreadsheet.Sheet>().Select(s => s.SheetId.Value).Max() + 1;
                    //}
                    sheetId += 1;

                    DocumentFormat.OpenXml.Spreadsheet.Sheet sheet = new DocumentFormat.OpenXml.Spreadsheet.Sheet() { Id = relationshipId, SheetId = sheetId, Name = tbl.TableName };
                    sheets.Append(sheet);

                    DocumentFormat.OpenXml.Spreadsheet.Row headerRow = new DocumentFormat.OpenXml.Spreadsheet.Row();

                    List<String> columns = new List<string>();
                    foreach (DataColumn column in tbl.Columns)
                    {
                        columns.Add(column.ColumnName);

                        DocumentFormat.OpenXml.Spreadsheet.Cell cell = new DocumentFormat.OpenXml.Spreadsheet.Cell();
                        cell.DataType = DocumentFormat.OpenXml.Spreadsheet.CellValues.String;
                        cell.CellValue = new DocumentFormat.OpenXml.Spreadsheet.CellValue(column.ColumnName);
                        headerRow.AppendChild(cell);
                    }

                    sheetData.AppendChild(headerRow);

                foreach (DataRow dsrow in tbl.Rows)
                {
                    DocumentFormat.OpenXml.Spreadsheet.Row newRow = new DocumentFormat.OpenXml.Spreadsheet.Row();

                    foreach (String col in columns)
                    {
                        DocumentFormat.OpenXml.Spreadsheet.Cell cell = new DocumentFormat.OpenXml.Spreadsheet.Cell();

                        //if (IsDouble(dsrow[col].ToString()))
                        //{
                            cell.DataType = DocumentFormat.OpenXml.Spreadsheet.CellValues.Number;
                       // }
                        //else
                        //{
                        //    cell.DataType = DocumentFormat.OpenXml.Spreadsheet.CellValues.String;
                        //}
                        cell.CellValue = new DocumentFormat.OpenXml.Spreadsheet.CellValue(dsrow[col].ToString());

                        newRow.AppendChild(cell);
                    }

                    sheetData.AppendChild(newRow);
                }


                objSpreadsheet.Close();
                ms.WriteTo(Response.OutputStream);
                ms.Close();

             
            }

        }
        public  bool IsDouble(string s)
        {
            double dOutput = 0;
            if (Double.TryParse(s, out dOutput))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}