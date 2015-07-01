using System;
using System.Collections.Generic;
using System.Dynamic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    public static class Ext
    {
        public static IHtmlString Raw(this HtmlHelper helper,string value, bool isConvertEnteryToHtml)
        {
            if (string.IsNullOrEmpty(value)) return default(IHtmlString);
            if (!isConvertEnteryToHtml) return helper.Raw(value);
            return helper.Raw(Regex.Replace(value, "\n", "<br />"));
        }
    }

    #region = CBOForReport =

    public class CBOForReport
    {

        #region = Properties =

        public int ID { get; set; }

        [DbField(Size = 200)]
        public string CBOName { get; set; }
        [DbField(Size = 200)]
        public string ServiceTask { get; set; }

        [DbField(Size = 500)]
        public string Class1 { get; set; }


        [DbField(Size = 500)]
        public string Class2 { get; set; }


        [DbField(Size = 500)]
        public string Class3 { get; set; }

        [DbField(Size = 500)]
        public string Class4 { get; set; }

        [DbField(Size = 200)]
        public string SteansStaff { get; set; }
        [DbField(Size = 50)]
        public string SLC { get; set; }

        public int TotalSlots { get; set; }
        [DbField(Size = 200)]
        public string CBOWebsite { get; set; }
        [DbField(Size = 200)]
        public string CBOAddress { get; set; }

        [DbField(Size = 1000)]
        public string ServiceDescription { get; set; }
        [DbField(Size = 1000)]
        public string CBOServiceSchedule { get; set; }
        [DbField(Size = 1000)]
        public string OrientationDetails { get; set; }
        [DbField(Size = 100)]
        public string TimeAvailability { get; set; }
        [DbField(Size = 100)]
        public string DayAvailability { get; set; }
        [DbField(Size = 50)]
        public string ContactSalutation { get; set; }
        [DbField(Size = 50)]
        public string ContactFirst { get; set; }
        [DbField(Size = 50)]
        public string ContactLast { get; set; }
        [DbField(Size = 50)]
        public string ContactPhone { get; set; }
        [DbField(Size = 250)]
        public string ContactEmail { get; set; }
        [DbField(Size = 100)]
        public string PublicTransportation { get; set; }
        [DbField(Size = 1000)]
        public string TransportationDetails { get; set; }
        [DbField(Size = 100)]
        public string BackgroundCheck { get; set; }
        [DbField(Size = 100)]
        public string ConfidentialityAgreement { get; set; }
        [DbField(Size = 100)]
        public string Fingerprints { get; set; }
        [DbField(Size = 100)]
        public string TBTest { get; set; }
        [DbField(Size = 50)]
        public string Term { get; set; }

        public int Class1SlotsTaken { get; set; }
        public int Class2SlotsTaken { get; set; }
        public int Class3SlotsTaken { get; set; }
        public int Class4SlotsTaken { get; set; }

        public string Description { get; set; }
        #endregion


        #region = Constructor =

        public CBOForReport() { }

        #endregion
        
    }

    #endregion


    #region = CourseForReport =

    public class CourseForReport
    {

        #region = Properties =

        public int ID { get; set; }

        [DbField(Size = 200)]
        public string CourseName { get; set; }

        [DbField(Size = 100)]
        public string Status { get; set; }

        [DbField(Size = 100)]
        public string Enrolled { get; set; }
        public DateTime PlacementDate { get; set; }
        [DbField(Size = 200)]
        public string ClassLocation { get; set; }
        [DbField(Size = 100)]
        public string ServiceLearning { get; set; }
        [DbField(Size = 100)]
        public string FacultyW { get; set; }
        [DbField(Size = 100)]
        public string Reflection { get; set; }
        [DbField(Size = 100)]
        public string DiversityW { get; set; }
        [DbField(Size = 1000)]
        public string Evaluations { get; set; }
        [DbField(Size = 100)]
        public string Designation { get; set; }
        [DbField(Size = 100)]
        public string AssignedStaff { get; set; }
        [DbField(Size = 100)]
        public string PlacementSLC { get; set; }

        public string PlacementDateString { get; set; }
        public string Room { get; set; }
        public string CourseTitle { get; set; }
        #endregion

        #region = Constructor =

        public CourseForReport() { }

        #endregion
        
    }

    #endregion


    public class ReportItem
    {
        public CourseForReport Course { get; set; }
        public CBOForReport CBO { get; set; }
    }

    [MvcAuthorize(Roles="admin,admin_sitegrid")]
    public class SiteGridController : Controller
    {
        //
        // GET: /SHTracker/SiteGrid/
        [Dependency]
        public IMemberFactory MemberFactory { get; set; }

        [Dependency]
        public IUserData UserData { get; set; }

        [Dependency]
        public ICourseFactory CourseFactory { get; set; }
        public ActionResult Index()
        {
            return View();
        }
        #region =New Report Building=

        public ActionResult SelectCourse()
        {
            return View(CourseFactory.CreateCourseCollection(1, 1000).OrderBy(c=>c.FullName));
        }
        [HttpPost]
        public ActionResult BuildReport(int courseId)
        {
            using (var db = new SHTrackerDbContext())
            {
                var course = db.Courses.Find(courseId);
                var cboCollection =
                    db.CboTasks.Where(
                        t => db.Course2CboTasks.Any(c2c => c2c.CourseID == courseId && c2c.CBOTaskID == t.ID))
                        .Join(db.Cbos, t => t.CBOID, c => c.ID, (t, c) => new {t, c})
                        .Select(t => new {t.t, t.c, slc = db.Members.FirstOrDefault(m => m.ID == t.t.SLCID)})
                        .Select(
                            m =>
                                new CBOForReport()
                                {
                                    CBOName = m.c.Name,
                                    CBOAddress = m.t.ServSiteAddress,
                                    CBOWebsite = m.t.Website,
                                    ContactFirst = m.t.ServFirstName,
                                    ContactLast = m.t.ServLastname,
                                    ContactEmail = m.t.ServEmail,
                                    ContactPhone = m.t.ServPhone,
                                    ContactSalutation = m.t.ServSalutation,
                                    SLC = m.slc.FirstName + " " + m.slc.LastName+"+Ph:"+m.slc.Phone+"+Em:"+m.slc.Email,
                                    ServiceDescription=m.c.Mission,
                                    OrientationDetails=m.t.Orientation,
                                    Class1=course.FullName,
                                    Class1SlotsTaken=m.t.ServSlots,
                                    BackgroundCheck=m.t.BackgroundCheck?"Yes":"No",
                                    Fingerprints=m.t.Fingerprints?"Yes":"No",
                                    ConfidentialityAgreement=m.t.ConfidentialityAgreement?"Yes":"No",
                                    TBTest=m.t.TBTest?"Yes":"No",
                                    TransportationDetails=m.t.OtherDetails,
                                    Description=m.t.Description
                                }).ToList();
                ViewBag.Term = UserData.QuarterYear;
                ViewBag.Course = new CourseForReport
                {
                    CourseName = course.FullName,
                    ClassLocation = course.Location,
                    PlacementDateString = course.PlacementDate,
                    Room=course.FacilityRoom,
                    CourseTitle=course.Title
                };
                return View("Index", cboCollection);
            }
        }
        #endregion
        [HttpPost]
        public ActionResult Upload(string Term)
        {
            var cbofile = Request.Files["CBORequest"];
            var coursesfile = Request.Files["Courses"];
            if ((cbofile == null || cbofile.ContentLength==0 || coursesfile == null || coursesfile.ContentLength==0)
                && (string.IsNullOrEmpty(Request.Form["rdoCboRequest"])|| string.IsNullOrEmpty(Request.Form["rdoCourse"]))
                )
            {
                ViewBag.Error = "No file has been chosen!";
                return View();
            }
            var cboPath = Request["rdoCboRequest"];
            if (cbofile.ContentLength > 0)
            {
                string tmpName = string.Format("CBO Request {0}", DateTime.Now.ToString("MM-dd-yyyy"));
                FileInfo fi = new FileInfo(cbofile.FileName);
                cboPath = string.Format("{0}/{1}{2}", Server.MapPath("/App_Data/Settings/SiteGrid/cbo"), tmpName,
                                                fi.Extension);
                cbofile.SaveAs(cboPath);
            }
            var coursePath = Request.Form["rdoCourse"];
            if (coursesfile.ContentLength > 0)
            {
                
                string tmpName = string.Format("Courses {0}", DateTime.Now.ToString("MM-dd-yyyy"));
                FileInfo fi = new FileInfo(coursesfile.FileName);
                coursePath = string.Format("{0}/{1}{2}", Server.MapPath("/App_Data/Settings/SiteGrid/course"), tmpName, fi.Extension);
                coursesfile.SaveAs(coursePath);

            }
            
            return RedirectToAction("ChooseCourse", new {Term = Term, cboPath = cboPath, coursePath = coursePath});
            
        }

        public ActionResult Upload()
        {
            return View();
        }

        [HttpPost]
        public ActionResult ChooseCourse(string term, string course, string cboPath, string coursePath)
        {

            var cboCollection = GetCBOForReportCollection(cboPath);
            var courseCollection = GetCourseForReportCollection(coursePath);
            //var reportcollection = BuildReportCollection(courseCollection, cboCollection);
            ViewBag.Term = term;
            ViewBag.Course = courseCollection.FirstOrDefault(c => c.CourseName.Equals(course));
            return View("Index", cboCollection.Where(m => 
                (!string.IsNullOrEmpty(m.Class1) && m.Class1.Equals(course,StringComparison.InvariantCultureIgnoreCase))
                || (!string.IsNullOrEmpty(m.Class2) && m.Class2.Equals(course, StringComparison.InvariantCultureIgnoreCase))
                || (!string.IsNullOrEmpty(m.Class3) && m.Class3.Equals(course, StringComparison.InvariantCultureIgnoreCase))
                || (!string.IsNullOrEmpty(m.Class4) && m.Class4.Equals(course, StringComparison.InvariantCultureIgnoreCase))
            ).OrderBy(m => m.CBOName));
        }

        public ActionResult ChooseCourse(string term, string cboPath,string coursePath)
        {
            var courseCollection = GetCourseForReportCollection(coursePath);
            ViewBag.CourseSelectItems =
                courseCollection.OrderBy(c=>c.CourseName).Select(c => new SelectListItem() {Text = c.CourseName, Value = c.CourseName});
            return View();
        }
        IEnumerable<ReportItem> BuildReportCollection(IEnumerable<CourseForReport> courseCollection,IEnumerable<CBOForReport> cboCollection)
        {
            var collection = new List<ReportItem>();
            foreach (var course in courseCollection)
            {
                collection.AddRange(cboCollection.Select(cbo => new ReportItem {CBO = cbo, Course = course}));
            }
            return collection;
        }
            IEnumerable<CourseForReport> GetCourseForReportCollection(string filePath)
        {
            List<CourseForReport> collection = new List<CourseForReport>();
            using (var doc =
                 SpreadsheetDocument.Open(filePath, false))
            {
                Sheet sheet = doc.WorkbookPart.Workbook.Descendants<Sheet>().FirstOrDefault();

                var worksheetPart = (WorksheetPart)doc.WorkbookPart.GetPartById(sheet.Id);

                var headers = worksheetPart.Worksheet.Descendants<Row>()
                                           .FirstOrDefault(x => x.RowIndex == 1);
                SheetData sheetData = worksheetPart.Worksheet.GetFirstChild<SheetData>();
                var allRows = sheetData.Elements<Row>()
                                           .Where(x => x.RowIndex > 1).ToList();
                var headerCells = headers.Descendants<Cell>().ToList();
                var headerCellReferences = headerCells.Select(c => Regex.Replace(c.CellReference, @"\d+", string.Empty)).ToArray();
                var tablePart = doc.WorkbookPart.SharedStringTablePart;
                SharedStringTablePart sstPart = doc.WorkbookPart.GetPartsOfType<SharedStringTablePart>().First();
                SharedStringTable ssTable = sstPart.SharedStringTable;

                WorkbookStylesPart workbookStylesPart = doc.WorkbookPart.GetPartsOfType<WorkbookStylesPart>().First();

                CellFormats cellFormats = workbookStylesPart.Stylesheet.CellFormats;
                var headerStrings = headerCells.Select(c => ProcessCellValue(c, ssTable, cellFormats));

                foreach (Row row in allRows)
                {
                    var newa = row.Elements<Cell>().Select(c => c.CellReference);

                    var cellValues = row.Elements<Cell>().Select(c => ProcessCellValue(c, ssTable, cellFormats)).ToArray();
                    var arrayValue = new object[headerCells.Count];
                    for (int i = 0; i < arrayValue.Length; i++)
                    {

                        arrayValue[i] =
                            ProcessCellValue(
                                row.Elements<Cell>()
                                   .FirstOrDefault(
                                       c =>
                                       Regex.Replace(c.CellReference, @"\d+", string.Empty) == headerCellReferences[i]),
                                ssTable, cellFormats);
                    }
                    CourseForReport course = new CourseForReport();
                    ReflectionHelper.Fill(arrayValue, course);
                    collection.Add(course);

                }


            }
            return collection;
        } 
       IEnumerable<CBOForReport> GetCBOForReportCollection(string filePath)
        {
            List<CBOForReport> collection = new List<CBOForReport>();
           using (var doc =
                SpreadsheetDocument.Open(
                    filePath, false))
           {
               Sheet sheet = doc.WorkbookPart.Workbook.Descendants<Sheet>().FirstOrDefault();
               //.FirstOrDefault(s => s.Name == "Winter 2013 Courses");

               var worksheetPart = (WorksheetPart)doc.WorkbookPart.GetPartById(sheet.Id);

               var headers = worksheetPart.Worksheet.Descendants<Row>()
                                          .FirstOrDefault(x => x.RowIndex == 1);
               SheetData sheetData = worksheetPart.Worksheet.GetFirstChild<SheetData>();
               var allRows = sheetData.Elements<Row>()
                                          .Where(x => x.RowIndex > 1).ToList();
               var headerCells = headers.Descendants<Cell>().ToList();
               var headerCellReferences = headerCells.Select(c => Regex.Replace(c.CellReference, @"\d+", string.Empty)).ToArray();
               var tablePart = doc.WorkbookPart.SharedStringTablePart;
               SharedStringTablePart sstPart = doc.WorkbookPart.GetPartsOfType<SharedStringTablePart>().First();
               SharedStringTable ssTable = sstPart.SharedStringTable;

               WorkbookStylesPart workbookStylesPart = doc.WorkbookPart.GetPartsOfType<WorkbookStylesPart>().First();

               CellFormats cellFormats = workbookStylesPart.Stylesheet.CellFormats;
               var headerStrings = headerCells.Select(c => ProcessCellValue(c, ssTable, cellFormats));
               
               foreach (Row row in allRows)
               {
                   var newa = row.Elements<Cell>().Select(c => c.CellReference);

                   var cellValues = row.Elements<Cell>().Select(c => ProcessCellValue(c, ssTable, cellFormats)).ToArray();
                   var arrayValue = new object[headerCells.Count];
                   for (int i = 0; i < arrayValue.Length; i++)
                   {

                       arrayValue[i] =
                           ProcessCellValue(
                               row.Elements<Cell>()
                                  .FirstOrDefault(
                                      c =>
                                      Regex.Replace(c.CellReference, @"\d+", string.Empty) == headerCellReferences[i]),
                               ssTable, cellFormats);
                   }
                       CBOForReport cbo=new CBOForReport();
                       ReflectionHelper.Fill(arrayValue, cbo);
                       collection.Add(cbo);
                   
               }


           }
           return collection;
       } 
        /// <summary>
        /// Get the data using the first row as columns and the rest of the rows as data
        /// </summary>
        /// <param name="data"></param>
        /// <param name="worksheet"></param>
        /// <param name="ssTable"></param>
        /// <param name="cellFormats"></param>
        private static void ExtractRowsData(List<ExpandoObject> data, Worksheet worksheet, SharedStringTable ssTable, CellFormats cellFormats)
        {
            var columnHeaders = worksheet.Descendants<Row>().First().Descendants<Cell>().Select(c => Convert.ToString(ProcessCellValue(c, ssTable, cellFormats))).ToArray();
            var columnHeadersCellReference = worksheet.Descendants<Row>().First().Descendants<Cell>().Select(c => c.CellReference.InnerText.Replace("1", string.Empty)).ToArray();
            var spreadsheetData = from row in worksheet.Descendants<Row>()
                                  where row.RowIndex > 1
                                  select row;
 
            foreach (var dataRow in spreadsheetData)
            {
                dynamic row = new ExpandoObject();
                Cell[] rowCells = dataRow.Descendants<Cell>().ToArray();
                for (int i = 0; i < columnHeaders.Length; i++)
                {
                    // Find and add the correct cell to the row object
                    Cell cell = dataRow.Descendants<Cell>().Where(c => c.CellReference == columnHeadersCellReference[i] + dataRow.RowIndex).FirstOrDefault();
                    if (cell != null)
                        ((IDictionary<String, Object>)row).Add(new KeyValuePair<String, Object>(columnHeaders[i], ProcessCellValue(cell, ssTable, cellFormats)));
                }
                data.Add(row);
            }
        }
        public string Filter(string s)
        {
            s = s.Replace("/", "");
            s = s.Replace(" ", "");
            s = s.Replace("1st", "First");
            s = s.Replace(".", "");
            return s;
        }
        /// <summary>
        /// Process the valus of a cell and return a .NET value
        /// </summary>
        private static Func<Cell, SharedStringTable, CellFormats, Object> ProcessCellValue =
            (c, ssTable, cellFormats) =>
                {
                    if (c == null) return null;
                    // If there is no data type, this must be a string that has been formatted as a number
                    if (c.DataType == null)
                    {
                        if (c.CellValue == null) return string.Empty;
                        if (c.StyleIndex == null) return c.CellValue.Text;
                        CellFormat cf =
                            cellFormats.Descendants<CellFormat>()
                                       .ElementAt<CellFormat>(Convert.ToInt32(c.StyleIndex.Value));
                        if (cf.NumberFormatId >= 0 && cf.NumberFormatId <= 13) // This is a number
                            return Convert.ToDecimal(c.CellValue.Text);
                        else if (cf.NumberFormatId >= 14 && cf.NumberFormatId <= 22) // This is a date
                            return DateTime.FromOADate(Convert.ToDouble(c.CellValue.Text));
                        else
                            return c.CellValue.Text;
                    }

                    switch (c.DataType.Value)
                    {
                        case CellValues.SharedString:
                            return ssTable.ChildElements[Convert.ToInt32(c.CellValue.Text)].InnerText;
                        case CellValues.Boolean:
                            return c.CellValue.Text == "1" ? true : false;
                        case CellValues.Date:
                            return DateTime.FromOADate(Convert.ToDouble(c.CellValue.Text));
                        case CellValues.Number:
                            return Convert.ToDecimal(c.CellValue.Text);
                        default:
                            if (c.CellValue != null)
                                return c.CellValue.Text;
                            return string.Empty;
                    }
                };
    }
}
