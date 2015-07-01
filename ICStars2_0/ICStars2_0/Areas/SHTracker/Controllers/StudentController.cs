using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web.Mvc;
using DocumentFormat.OpenXml;
using DocumentFormat.OpenXml.Office2010.ExcelAc;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Common;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;
using log4net;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    [MvcAuthorize(Roles = "admin,admin_student,Staff,SLC")]
    public class StudentController : Controller
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(StudentController));
        public class ModelForDownload
        {
            [Required]
            public string CBO { get; set; }

            [Required]
            public string Course { get; set; }
            [Required]
            public float RequiredServeHours { get; set; }
            [Required]
            public int StudentNumber { get; set; }

            public bool IsProject { get; set; }
        }
        //
        // GET: /SHTracker/Student/

        [Dependency]
        public IStudentFactory StudentFactory { get; set; }
        [Dependency]
        public IStudent2CBOFactory Student2CboFactory { get; set; }
        [Dependency]
        public IUserData UserData { get; set; }


        [Dependency]
        public ICourseFactory CourseFactory { get; set; }

        [Dependency]
        public IServiceHoursFactory ServiceHoursFactory { get; set; }
        public ActionResult TobeCalled()
        {
            return View();
        }
        public ActionResult Upload()
        {
            InitTemplateViewBag();
            return View();
        }

        private void InitTemplateViewBag()
        {
            ViewBag.StudentNumberList = new[]
            {
                new SelectListItem
                {
                    Text = "# of Students in Class",
                    Value = "",
                    Selected = true
                }
            }.Union(
                Enumerable.Range(0, 100).Select(i => new SelectListItem() { Text = i.ToString(), Value = i.ToString() }));
            ViewBag.HoursList = new[]
            {
                new SelectListItem
                {
                    Text = "Select Required Serve Hours",
                    Value = "",
                    Selected = true
                }
            }.Union(
                Enumerable.Range(0, 100).Select(i => new SelectListItem() { Text = i.ToString(), Value = i.ToString() }));
            ViewBag.CourseSelectListItems = new[]
            {
                new SelectListItem
                {
                    Text = "Select Course",
                    Value = "",
                    Selected = true
                }
            }.Union(
                CourseFactory.CreateCourseCollection(1, 1000)
                    .OrderBy(c => c.FullName)
                    .Select(c => new SelectListItem() { Text = c.FullName, Value = string.Format("{0}|#|{1}", c.ID, c.FullName) }));
            using (var db = new SHTrackerDbContext())
            {
                ViewBag.CBONameIDList = new[]
                {
                    new SelectListItem
                    {
                        Text = "Select CBO",
                        Value = "",
                        Selected = true
                    }
                }.Union(
                    db.Cbos.Select(c => new { c.ID, c.Name }).ToList()
                        .OrderBy(c => c.Name)
                        .Select(c => new SelectListItem() { Text = c.Name, Value = string.Format("{0}|#|{1}", c.ID, c.Name) }));
            }
        }
        public ActionResult DownloadTemplate()
        {
            InitTemplateViewBag();
            return View();
        }

        [HttpPost]
        public ActionResult DownloadTemplate(ModelForDownload model)
        {
            if (!ModelState.IsValid)
            {
                InitTemplateViewBag();
                return View(model);
            }
            var file = Request.Files["Students"];
            if (file == null || file.ContentLength == 0)
            {
                InitTemplateViewBag();
                ViewBag.Error = "No file has been chosen!";
                return View(model);
            }
            var table = BuildTableFromOrginalCopy(file.InputStream);
            var students = ExcelHelper.BuildList<Student>(table).ToArray();
            
            var c = new[] { "|#|" };
            var CBOID = model.CBO.Split(c, StringSplitOptions.None)[0];

            var CBOName = model.CBO.Split(c, StringSplitOptions.None)[1];
            var CourseID = model.Course.Split(c, StringSplitOptions.None)[0];
            var CourseName = model.Course.Split(c, StringSplitOptions.None)[1];
            var stream = new MemoryStream();

            using (SpreadsheetDocument spreadSheet = SpreadsheetDocument.Create(
                stream,
                SpreadsheetDocumentType.Workbook))
            {
                // create the workbook
                spreadSheet.AddWorkbookPart();
                spreadSheet.WorkbookPart.Workbook = new Workbook(); // create the worksheet
                spreadSheet.WorkbookPart.AddNewPart<WorksheetPart>();
                var sheet = new Worksheet();
                spreadSheet.WorkbookPart.WorksheetParts.First().Worksheet = sheet;

                // create sheet data
                sheet.AppendChild(new SheetData());

                // create row
                var firstRow = new Row();
                // create cell with data
                firstRow.Append(new OpenXmlElement[]
                {
                    new Cell() {CellValue = new CellValue("CourseID"),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell() {CellValue = new CellValue("CourseName"),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue("CBOID"),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue("CBOName"),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue("Is Project"),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue("Required Serve Hours"),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue("Orientation"),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue("DPU_ID"),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue("Last Name"),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue("First Name"),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue("Email"),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue("Primary Phone"),DataType=new EnumValue<CellValues>(CellValues.String)},
                });
                sheet.First().AppendChild(firstRow);
                for (int i = 0; i < students.Length; i++)
                {
                    var newrow = new Row();
                    newrow.Append(new OpenXmlElement[]
                {
                    new Cell() {CellValue = new CellValue(CourseID),DataType=new EnumValue<CellValues>(CellValues.Number)},
                    new Cell() {CellValue = new CellValue(CourseName),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue(CBOID),DataType=new EnumValue<CellValues>(CellValues.Number)},
                    new Cell {CellValue = new CellValue(CBOName),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue("FALSE"),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue(model.RequiredServeHours.ToString()),DataType=new EnumValue<CellValues>(CellValues.Number)},
                    new Cell {CellValue = new CellValue("No"),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue(students[i].DPU_ID),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue(students[i].LastName),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue(students[i].FirstName),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue(students[i].Email),DataType=new EnumValue<CellValues>(CellValues.String)},
                    new Cell {CellValue = new CellValue(""),DataType=new EnumValue<CellValues>(CellValues.String)},
                });
                    sheet.First().AppendChild(newrow);
                }


                // save worksheet
                sheet.Save();

                // create the worksheet to workbook relation
                spreadSheet.WorkbookPart.Workbook.AppendChild(new Sheets());
                spreadSheet.WorkbookPart.Workbook.GetFirstChild<Sheets>().AppendChild(new Sheet()
                {
                    Id = spreadSheet.WorkbookPart.GetIdOfPart(spreadSheet.WorkbookPart.WorksheetParts.First()),
                    SheetId = 1,
                    Name = "Template For Uploading"
                });

                spreadSheet.WorkbookPart.Workbook.Save();
            }
            stream.Seek(0, SeekOrigin.Begin);
            return File(stream, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "StudentTemplate.xlsx");

        }
        private static object[,] BuildTableFromOrginalCopy(Stream inputStream)
        {
            object[,] table = null;
            using (var doc =
                SpreadsheetDocument.Open(
                    inputStream, false))
            {
                Sheet sheet = doc.WorkbookPart.Workbook.Descendants<Sheet>().FirstOrDefault();

                var worksheetPart = (WorksheetPart)doc.WorkbookPart.GetPartById(sheet.Id);

                var headers = worksheetPart.Worksheet.Descendants<Row>()
                                           .FirstOrDefault(x => x.RowIndex == 1);
                SheetData sheetData = worksheetPart.Worksheet.GetFirstChild<SheetData>();
                var allRows = sheetData.Elements<Row>()
                                       .Where(x => x.RowIndex > 1 && !string.IsNullOrEmpty(x.InnerText)).ToList();
                var headerCells = headers.Descendants<Cell>().ToList();
                var headerCellReferences =
                    headerCells.Select(c => Regex.Replace(c.CellReference, @"\d+", string.Empty)).ToArray();

                SharedStringTablePart sstPart = doc.WorkbookPart.GetPartsOfType<SharedStringTablePart>().First();
                SharedStringTable ssTable = sstPart.SharedStringTable;

                WorkbookStylesPart workbookStylesPart = doc.WorkbookPart.GetPartsOfType<WorkbookStylesPart>().First();
                //hyperlinks table
                var hyperlinks = worksheetPart.RootElement.Descendants<Hyperlinks>().First().Cast<Hyperlink>();
                CellFormats cellFormats = workbookStylesPart.Stylesheet.CellFormats;
                var headerStrings = headerCells.Select(c => ProcessCellValue(c, ssTable, cellFormats)).ToArray();
                table = new object[allRows.Count + 1, headerStrings.Length+3];
                var nameIndex = 0;
                //assign column title to the table
                for (int i = 0; i < headerStrings.Length; i++)
                {
                    table[0, i] = headerStrings[i];
                    if (headerStrings[i].ToString().Trim().Equals("Name", StringComparison.CurrentCultureIgnoreCase))
                    {
                        nameIndex = i;
                    }
                    if (headerStrings[i].ToString().Trim().Equals("ID", StringComparison.CurrentCultureIgnoreCase))
                    {
                        table[0, i] = "DPU_ID";
                    }
                    
                }
                table[0, headerStrings.Length] = "Last Name";
                table[0, headerStrings.Length+1] = "First Name";
                table[0, headerStrings.Length+2] = "Email";
                //assign all cell values to the table
                for (int i = 0; i < allRows.Count; i++)
                {
                    var originalCells = allRows[i].Elements<Cell>();
                    var nameCell = originalCells.FirstOrDefault(
                        c =>
                            Regex.Replace(c.CellReference, @"\d+", string.Empty) == headerCellReferences[nameIndex]);
                    //retreive hyperlink with same cell reference
                    var hyperlink = hyperlinks.SingleOrDefault(h => h.Reference.Value == nameCell.CellReference.Value);
                    //if it exists
                    if (hyperlink != null)
                    {
                        var hyperlinksRelation = worksheetPart.HyperlinkRelationships.SingleOrDefault(h => h.Id == hyperlink.Id);
                        if (hyperlinksRelation != null)
                        {
                            var url = hyperlinksRelation.Uri.ToString();
                            table[i+1, headerStrings.Length+2] = Regex.Replace(url, @"mailto\:", string.Empty, RegexOptions.IgnoreCase).Trim();
                        }
                    }
                    var cells = originalCells.Select(c =>
                    {
                        c.CellReference = Regex.Replace(c.CellReference, @"\d+", string.Empty);
                        return c;
                    });
                    for (int j = 0; j < headerCells.Count; j++)
                    {
                        table[i + 1, j] =
                            ProcessCellValue(
                                cells.FirstOrDefault(
                                       c =>
                                       c.CellReference == headerCellReferences[j]),
                                ssTable, cellFormats);
                        if (j == nameIndex)
                        {
                            var names = table[i + 1, j].ToString().Trim().Split(',');
                            if (names.Length > 0)
                            {
                                table[i + 1, headerStrings.Length] = names[0];
                            }
                            if (names.Length > 1)
                            {
                                table[i + 1, headerStrings.Length + 1] = names[1];
                            }
                        }
                    }
                    

                }
            }
            return table;
        }
        private static object ProcessCellValue(Cell c, SharedStringTable ssTable, CellFormats cellFormats)
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
                {
                    return Convert.ToDecimal(c.CellValue.Text);
                }
                if (cf.NumberFormatId >= 14 && cf.NumberFormatId <= 22) // This is a date
                {
                    return DateTime.FromOADate(Convert.ToDouble(c.CellValue.Text));
                }
                return c.CellValue.Text;
            }

            switch (c.DataType.Value)
            {
                case CellValues.SharedString:
                    return ssTable.ChildElements[Convert.ToInt32(c.CellValue.Text)].InnerText;
                case CellValues.Boolean:
                    return c.CellValue.Text == "1";
                case CellValues.Date:
                    return DateTime.FromOADate(Convert.ToDouble(c.CellValue.Text));
                case CellValues.Number:
                    return Convert.ToDecimal(c.CellValue.Text);
                default:
                    return c.CellValue != null ? c.CellValue.Text : string.Empty;
            }
        }

        [HttpPost]
        public ActionResult PreviewUploading(ModelForDownload model)
        {
            var file = Request.Files["Students"];
            if (file == null || file.ContentLength == 0)
            {
                InitTemplateViewBag();
                ViewBag.Error = "No file has been chosen!";
                return View("Upload");
            }
            var table = BuildTableFromOrginalCopy(file.InputStream);
            #region =Init students=
            var c = new[] { "|#|" };
            var CBOID = model.CBO.Split(c, StringSplitOptions.None)[0];

            var CBOName = model.CBO.Split(c, StringSplitOptions.None)[1];
            var CourseID = model.Course.Split(c, StringSplitOptions.None)[0];
            var CourseName = model.Course.Split(c, StringSplitOptions.None)[1]; 
            var SLC = User.IsInRole("SLC") ? User.Identity.Name : "";

            var Staff = User.IsInRole("Staff") ? User.Identity.Name : "";
            var students = ExcelHelper.BuildList<Student>(table).Select(s =>
            {
                s.CBOID = Convert.ToInt32(CBOID);
                s.CBOName = CBOName;
                s.CourseID = Convert.ToInt32(CourseID);
                s.CourseSubject = CourseName;
                s.IsProject = model.IsProject;
                s.Orientation = "No";
                s.RequiredServeHours = model.RequiredServeHours;
                s.Staff = Staff;
                s.SLC = SLC;
                return s;
            });

            #endregion
            var duplicates = students.GroupBy(s => new { s.CourseID, s.DPU_ID });
            if (duplicates.Any(d => d.Count() > 1))
            {
                return
                    Content(string.Format("The file includes duplicated DPUIDs [{0}]!",
                        duplicates.Where(d => d.Count() > 1)
                            .Select(d => d.Key.DPU_ID)
                            .Aggregate("", (x, y) => x + "," + y)));
            }

            using (var db = new SHTrackerDbContext())
            {
                foreach (var student in students.Where(student => db.Students.Any(s => s.CourseID == student.CourseID && s.DPU_ID.Equals(student.DPU_ID))))
                {
                    return
                        Content(
                            string.Format(
                                "The combination of CourseID[{0}] and DPUID[{1}] exists! Please check on it or make a change, then retry.",
                                student.CourseID, student.DPU_ID));
                }
                ViewBag.CBONameIDList = db.Cbos.Select(cbo => new { cbo.ID, cbo.Name }).ToList()
                        .OrderBy(cbo => cbo.Name)
                        .Select(cbo => new SelectListItem() { Text = cbo.Name, Value = cbo.ID.ToString() });
            
            }
            
                
            return View(students);
        }

        [HttpPost]
        public ActionResult UploadStudents(IEnumerable<Student> students)
        {
            using (var db = new SHTrackerDbContext())
            {
                foreach (var student in students)
                {
                    if (db.Students.Any(s => s.CourseID == student.CourseID && s.DPU_ID.Equals(student.DPU_ID)))
                    {
                        return
                            Content(
                                string.Format(
                                    "The combination of CourseID[{0}] and DPUID[{1}] exists! Please check on it or make a change, then retry.",
                                    student.CourseID, student.DPU_ID));
                    }
                    db.Students.Add(student);
                }
                db.SaveChanges();
                foreach (var student in students)
                {
                    db.Student2CBOs.Add(new Student2CBO()
                    {
                        CBOID = student.CBOID,
                        Quater_Year = UserData.QuarterYear,
                        StudentID = student.ID,
                        RequiredHours = (int)student.RequiredServeHours
                    });
                }
                db.SaveChanges();
            }
            return Redirect("/ShTracker/Student/List.aspx");
        }


        public ActionResult RollOver()
        {
            var studentrollover = new StudentRollOver() {StudentID = Convert.ToInt32(Request.QueryString["sid"])};
            ViewBag.CurrentQuarter = UserData.QuarterYear;
            using (var db = new SHTrackerDbContext())
            {
                ViewBag.CBONameIDList = new[]
                {
                    new SelectListItem
                    {
                        Text = "Select CBO",
                        Value = "",
                        Selected = true
                    }
                }.Union(
                    db.Cbos.Select(c=>new{c.ID,c.Name}).ToList()
                        .OrderBy(c => c.Name)
                        .Select(c => new SelectListItem() {Text = c.Name, Value = c.ID.ToString()}));
            }
            
            return View(studentrollover);
        }

        [HttpPost]
        public ActionResult Rollover(StudentRollOver model)
        {
            if (ModelState.IsValid)
            {
                if (model.StudentID == 0)
                {
                    ModelState.AddModelError("QuarterYear", "Choose a student first!");
                }
                using (var db = new SHTrackerDbContext())
                {
                    var stu = db.Students.AsNoTracking().FirstOrDefault(s => s.ID == model.StudentID);

                    if (db.Students.Any(s => s.CourseID == model.CourseID && s.DPU_ID == stu.DPU_ID))
                    {
                        return
                            Content(
                                string.Format(
                                    "The student [<B>{0} {1}</B>] exists in the quarter <b>{2}</b>! <br />The combination of student's DPU ID and Course must be UNIQUE! <br />If you could not find the student [{0} {1}] in the quarter [{2}], there must be a mistake of the DPU ID happened!",
                                    stu.FirstName, stu.LastName, model.QuarterYear));
                    }
                    stu.ID = 0;
                    stu.SLC = User.IsInRole("SLC") ? User.Identity.Name : "";
                    stu.Staff = User.IsInRole("Staff") ? User.Identity.Name : "";
                    stu.CourseID = model.CourseID;
                    db.Students.Add(stu);
                    if (db.SaveChanges() > 0)
                    {
                        var s2c = new Student2CBO()
                        {
                            CBOID = model.CBOID,
                            CreateDate = DateTime.Now,
                            Quater_Year = model.QuarterYear,
                            RequiredHours = model.RequiredHours,
                            StudentID = stu.ID
                        };
                        db.Student2CBOs.Add(s2c);
                        db.SaveChanges();
                        return
                            Content(string.Format("The student [{0} {1}] has been rolled over into the quarter {2}",
                                stu.FirstName, stu.LastName, model.QuarterYear));
                    }
                }
            }
            using (var db = new SHTrackerDbContext())
            {
                ViewBag.CBONameIDList = new[]
                {
                    new SelectListItem
                    {
                        Text = "Select CBO",
                        Value = "",
                        Selected = true
                    }
                }.Union(
                    db.Cbos.Select(c => new { c.ID, c.Name }).ToList()
                        .OrderBy(c => c.Name)
                        .Select(c => new SelectListItem() { Text = c.Name, Value = c.ID.ToString() }));
            }
            return View(model);
        }

        public ActionResult Notify(int id)
        {
            var stu = StudentFactory.Create(id);
            var cboid = Convert.ToInt32(Request.QueryString["cboid"]);
            return View(new StudentNotification
            {
                StudentID= stu.ID,
                CourseID=stu.CourseID,
                CBOID=Convert.ToInt32(Request.QueryString["cboid"]),
                Quarter_Year=UserData.QuarterYear,
                FirstName=stu.FirstName,
                LastName=stu.LastName,
                ToEmail=stu.Email,
                EmailBody="<br /><br/><p>(This is a system automatic notification, please DO NOT reply.)</p>"
            });
        }
        [HttpPost]
        public ActionResult Notify(StudentNotification notification)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    EmailService.SendEmail("reminder@depaul.edu", notification.ToEmail,
                        notification.EmailTitle,
                        notification.EmailBody,
                        true);
                    var sh = new ServiceHours();
                    sh.CBO_ID = notification.CBOID;
                    sh.CourseID = notification.CourseID;
                    sh.StudentID = notification.StudentID;
                    sh.Quater_Year = notification.Quarter_Year;


                    sh.ServiceDate = DateTime.Now.Date;
                    sh.HoursServed = 0;
                    sh.ContactType = "System";
                    sh.Notes = string.Format("Email Notification By {0} ({1})",UserData.RealName,User.Identity.Name);
                    ServiceHoursFactory.Update(sh, false);
                }
                catch (Exception exp)
                {
#if DEBUG
                    throw;
#endif
                    Log4NetHelper.WriteLog(exp, Logger);
                    return Content("System Error! Please try again or contact the administrator.");
                }
                return Content("Sent Successfully!");
            }
            return View(notification);
        }
    }
}
