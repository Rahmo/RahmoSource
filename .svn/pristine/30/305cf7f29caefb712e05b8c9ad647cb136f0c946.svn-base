using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.Entity.Validation;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Caching;
using System.Web.Mvc;
using System.Web.UI;
using ICStars.Data;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.CourseServices;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.Common;
using ICStars2_0.Common.Lambda;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Settings;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;
using log4net;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    public static class extensions
    {
        public static List<Course> ToCourseList(this IEnumerable<UniverseCourse> universeCourses)
        {
            return universeCourses.Select(
                c =>
                new Course
                    {
                        Term = c.Term,
                        TermDescription = c.TermDesc,
                        Subject = c.Subject,
                        CatalogNumber = c.CatalogNumber,
                        ClassSection = c.ClassSection,
                        Title = c.Title,
                        InstructorName = c.InstructorName,
                        BestEmail = c.BestEmail,
                        ClassNumber = c.ClassNumber
                    }).ToList();
        }
    }
    [MvcAuthorize(Roles = "admin,admin_course,Staff,CSSP")]
    public class CourseController : Controller
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(CourseController));
        //
        // GET: /SHTracker/Course/
        [Dependency]
        public ICourseFactory CourseFactory { get; set; }
        [Dependency]
        public IUserData UserData { get; set; }
        #region =Course=

        public ActionResult Add()
        {
            using (var db = new SHTrackerDbContext())
            {
                IEnumerable<CBOTask> taskList = UserData.QuarterYears!=null ? db.CboTasks.Where(t => UserData.QuarterYears.Contains(t.Quarter_Year)) : db.CboTasks.Where(t => t.Quarter_Year.Equals(UserData.QuarterYear));

                ViewBag.CBONameTaskIDList = new[]
                {
                    new SelectListItem
                    {
                        Text = "Select CBO Task",
                        Value = "",
                        Selected = true
                    }
                }.Union(taskList.Join(db.Cbos, t => t.CBOID, c => c.ID, (t, c) => new { t.ID, c.Name, t.Title }).ToList().Select(c => new SelectListItem() { Text = string.Format("{0}--{1}", c.Name, c.Title), Value = c.ID.ToString() }));

                return View("Edit");
            }
        }
        [HttpPost]
        public ActionResult Add(Course course)
        {
            if (ModelState.IsValid)
            {
                using (var db = new SHTrackerDbContext())
                {
                    if (User.IsInRole("CSSP"))
                    {
                        course.CourseType = CourseType.CSSP;
                    }
                    course.Staff = User.Identity.Name;
                    db.Courses.Add(course);
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            if (course.CboTasks != null)
                            {
                                var newTaskIds = course.CboTasks.Select(s => s.ToInt32()).Where(i => i > 0);
                                var oldTaskIds = db.Course2CboTasks.Where(c => c.CourseID == course.ID)
                                                  .Select(c => c.CBOTaskID);
                                var targetStuids = newTaskIds.Except(oldTaskIds);
                                var deletingStuIds = oldTaskIds.Except(newTaskIds);
                                foreach (var stuid in deletingStuIds)
                                {
                                    var choice = new Course2CBOTask() { CourseID = course.ID, CBOTaskID = stuid };
                                    db.Entry(choice).State = EntityState.Deleted;
                                }
                                foreach (var stuid in targetStuids)
                                {
                                    db.Course2CboTasks.Add(new Course2CBOTask() { CourseID = course.ID, CBOTaskID = stuid });
                                }
                                db.SaveChanges();
                            }
                            return RedirectToAction("List");
                        }
                    }
                    catch (Exception exp)
                    {
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("Term", "System Error! Please Try it again.");
                }
            }
            return View("Edit");
        }
        public ActionResult Edit(int id)
        {
            using (var db = new SHTrackerDbContext())
            {
                IEnumerable<CBOTask> taskList = UserData.QuarterYears!=null ? db.CboTasks.Where(t => UserData.QuarterYears.Contains(t.Quarter_Year)) : db.CboTasks.Where(t => t.Quarter_Year.Equals(UserData.QuarterYear));

                ViewBag.CBONameTaskIDList = new[]
                {
                    new SelectListItem
                    {
                        Text = "Select CBO Task",
                        Value = "",
                        Selected = true
                    }
                }.Union(taskList.Join(db.Cbos, t => t.CBOID, c => c.ID, (t, c) => new { t.ID, c.Name, t.Title }).ToList().Select(c => new SelectListItem() { Text = string.Format("{0}--{1}", c.Name, c.Title), Value = c.ID.ToString() }));

                ViewBag.C2CList = db.Course2CboTasks.Where(c => c.CourseID == id).ToList();
                return View(db.Courses.First(n => n.ID == id));
            }
        }

        [HttpPost]
        public ActionResult Edit(Course course)
        {
            if (ModelState.IsValid)
            {
                using (var db = new SHTrackerDbContext())
                {
                    if (User.IsInRole("CSSP"))
                    {
                        course.CourseType = CourseType.CSSP;
                    }
                    course.Staff = User.Identity.Name;
                    db.Entry(course).State = EntityState.Modified;
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            if (course.CboTasks == null)
                            {
                                return RedirectToAction("List");
                            }

                            var tasks = course.CboTasks.Where(s => !string.IsNullOrEmpty(s));
                            if (!tasks.Any()) return RedirectToAction("List");
                            var newTaskIds = tasks.Select(s => s.ToInt32()).Where(i => i > 0);
                            var oldTaskIds = db.Course2CboTasks.Where(c => c.CourseID == course.ID)
                                .Select(c => c.CBOTaskID).ToList();
                            var targetStuids = newTaskIds.Except(oldTaskIds);
                            var deletingStuIds = oldTaskIds.Except(newTaskIds);
                            foreach (var stuid in deletingStuIds)
                            {
                                var choice = new Course2CBOTask() {CourseID = course.ID, CBOTaskID = stuid};
                                db.Entry(choice).State = EntityState.Deleted;
                            }
                            foreach (var stuid in targetStuids)
                            {
                                db.Course2CboTasks.Add(new Course2CBOTask()
                                {
                                    CourseID = course.ID,
                                    CBOTaskID = stuid
                                });
                            }
                            db.SaveChanges();
                            return RedirectToAction("List");
                        }
                    }
                    catch (Exception exp)
                    {
#if DEBUG
                        throw exp;
#endif
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("Term", "System Error! Please Try it again.");
                    ViewBag.CBONameTaskIDList = new[]
                    {
                        new SelectListItem
                        {
                            Text = "Select CBO Task",
                            Value = "",
                            Selected = true
                        }
                    }.Union(
                        db.Cbos.Join(db.CboTasks, c => c.ID, t => t.CBOID, (c, t) => new {t.ID, c.Name, t.Title})
                            .ToList()
                            .Select(
                                c =>
                                    new SelectListItem()
                                    {
                                        Text = string.Format("{0}--{1}", c.Name, c.Title),
                                        Value = c.ID.ToString()
                                    }));

                    ViewBag.C2CList = db.Course2CboTasks.Where(c => c.CourseID == course.ID).ToList();
                }
            }

            return View(course);
        }

        public ActionResult Delete(int id)
        {
            using (var db = new CourseDbContext())
            {
                var course = new Course {ID = id};
                db.Entry(course).State = EntityState.Deleted;

                db.SaveChanges();
                return RedirectToAction("List");
            }
        }
        public ActionResult Details(int id)
        {
            using (var db = new CourseDbContext())
            {
                return View(db.Courses.First(n => n.ID == id));
            }
        }
        [MvcAuthorize(Roles = "admin,admin_course,Staff,CSSP,SLC")]
        public ActionResult List(int page=1)
        {
            var settings = new CourseCollectionSettings();
            if (User.IsInRole("CSSP"))
            {
                settings.CourseType = CourseType.CSSP;

            }
            if (!string.IsNullOrEmpty(Request.QueryString["t"]) && Request.QueryString["t"].Equals("1"))
            {
                settings.CourseType = CourseType.CSSP;
            }
            ViewBag.PageSize = 20;
            var cc = CourseFactory.CreateCourseCollection(page, 20, settings);

            ViewBag.TotalCount = cc.TotalCount;
            ViewBag.Title = "Course Management";
            return View(cc);
        }
        #endregion
        #region =Course Match=

        public ActionResult UniverseCoursePerfectOrphan()
        {
            using (var db = new CourseDbContext())
            {
                var list =
                    db.UniverseCourses.Where(
                        c =>
                        !db.HistoricalFaculties.Any(
                            f =>
                            c.InstructorFirstName.Equals(f.FirstName) && c.InstructorLastName.Contains(f.LastName))
                            || !db.HistoricalCourses.Any(f => c.Subject.Equals(f.Subject) && c.CatalogNumber.Contains(f.CatalogNumber))
                            ).Select(
                                                        c =>
                                                        new
                                                        {
                                                            c.Term,
                                                            c.TermDesc,
                                                            c.Subject,
                                                            c.CatalogNumber,
                                                            c.ClassSection,
                                                            c.Title,
                                                            c.InstructorName,
                                                            c.BestEmail,
                                                            c.ClassNumber
                                                        }).ToList().Select(
                                                                c =>
                                                                new Course
                                                                {
                                                                    Term = c.Term,
                                                                    TermDescription = c.TermDesc,
                                                                    Subject = c.Subject,
                                                                    CatalogNumber = c.CatalogNumber,
                                                                    ClassSection = c.ClassSection,
                                                                    Title = c.Title,
                                                                    InstructorName = c.InstructorName,
                                                                    BestEmail = c.BestEmail,
                                                                    ClassNumber = c.ClassNumber
                                                                }).ToList();

                ViewBag.PageSize = list.Count;

                ViewBag.TotalCount = list.Count;
                ViewBag.Title = "Perfect Orphan";
                return SortCourses(list, null);
            }
        }
        public ActionResult UniverseCoursePerfectMatches()
        {
            using (var db = new CourseDbContext())
            {
                var list =
                    db.UniverseCourses.Where(
                        c =>
                        db.HistoricalFaculties.Any(
                            f =>
                            c.InstructorFirstName.Equals(f.FirstName) && c.InstructorLastName.Contains(f.LastName))
                            && db.HistoricalCourses.Any(f => c.Subject.Equals(f.Subject) && c.CatalogNumber.Contains(f.CatalogNumber))
                            ).Select(
                                                        c =>
                                                        new
                                                        {
                                                            c.Term,
                                                            c.TermDesc,
                                                            c.Subject,
                                                            c.CatalogNumber,
                                                            c.ClassSection,
                                                            c.Title,
                                                            c.InstructorName,
                                                            c.BestEmail,
                                                            c.ClassNumber
                                                        }).ToList().Select(
                                                                c =>
                                                                new Course
                                                                {
                                                                    Term = c.Term,
                                                                    TermDescription = c.TermDesc,
                                                                    Subject = c.Subject,
                                                                    CatalogNumber = c.CatalogNumber,
                                                                    ClassSection = c.ClassSection,
                                                                    Title = c.Title,
                                                                    InstructorName = c.InstructorName,
                                                                    BestEmail = c.BestEmail,
                                                                    ClassNumber = c.ClassNumber
                                                                }).ToList();

                ViewBag.PageSize = list.Count;

                ViewBag.TotalCount = list.Count;
                ViewBag.Title = "Perfect Matches";
                return SortCourses(list, null);
            }
        }
        public ActionResult UniverseCourseMatchesFaculty()
        {
            using (var db = new CourseDbContext())
            {
                var list =
                    db.UniverseCourses.Where(
                        c =>
                        db.HistoricalFaculties.Any(
                            f =>
                            c.InstructorFirstName.Equals(f.FirstName) && c.InstructorLastName.Contains(f.LastName))).Select(
                                                        c =>
                                                        new
                                                            {
                                                                c.Term,
                                                                c.TermDesc,
                                                                c.Subject,
                                                                c.CatalogNumber,
                                                                c.ClassSection,
                                                                c.Title,
                                                                c.InstructorName,
                                                                c.BestEmail,
                                                                c.ClassNumber
                                                            }).ToList().Select(
                                                                c =>
                                                                new Course
                                                                    {
                                                                        Term = c.Term,
                                                                        TermDescription = c.TermDesc,
                                                                        Subject = c.Subject,
                                                                        CatalogNumber = c.CatalogNumber,
                                                                        ClassSection = c.ClassSection,
                                                                        Title = c.Title,
                                                                        InstructorName = c.InstructorName,
                                                                        BestEmail = c.BestEmail,
                                                                        ClassNumber = c.ClassNumber
                                                                    }).ToList();

                ViewBag.PageSize = list.Count;

                ViewBag.TotalCount = list.Count;
                ViewBag.Title = "Facult Matches";
                return SortCourses(list,
                                   list.OrderBy(m => m.InstructorName)
                                       .ThenBy(c => c.Subject)
                                       .ThenBy(c => c.CatalogNumber));
            }
        }
        public ActionResult UniverseCourseMatchesHistoricalCourses()
        {
            using (var db = new CourseDbContext())
            {
                var list =
                    db.UniverseCourses.Where(
                        c =>
                        db.HistoricalCourses.Any(
                            f =>
                            c.Subject.Equals(f.Subject) && c.CatalogNumber.Contains(f.CatalogNumber))).Select(
                                                        c =>
                                                        new
                                                        {
                                                            c.Term,
                                                            c.TermDesc,
                                                            c.Subject,
                                                            c.CatalogNumber,
                                                            c.ClassSection,
                                                            c.Title,
                                                            c.InstructorName,
                                                            c.BestEmail,
                                                            c.ClassNumber
                                                        }).ToList().Select(
                                                                c =>
                                                                new Course
                                                                {
                                                                    Term = c.Term,
                                                                    TermDescription = c.TermDesc,
                                                                    Subject = c.Subject,
                                                                    CatalogNumber = c.CatalogNumber,
                                                                    ClassSection = c.ClassSection,
                                                                    Title = c.Title,
                                                                    InstructorName = c.InstructorName,
                                                                    BestEmail = c.BestEmail,
                                                                    ClassNumber = c.ClassNumber
                                                                }).ToList();

                ViewBag.PageSize = list.Count;

                ViewBag.TotalCount = list.Count;
                ViewBag.Title = "Historical Course Matches";
                return SortCourses(list, null);
            }
        }

        public ActionResult UniverseCourseList()
        {
            using (var db = new CourseDbContext())
            {
                var list =
                    db.UniverseCourses.AsNoTracking().Select(
                        c =>
                        new
                            {
                                c.Term,
                                c.TermDesc,
                                c.Subject,
                                c.CatalogNumber,
                                c.ClassSection,
                                c.Title,
                                c.InstructorName,
                                c.BestEmail,
                                c.ClassNumber
                            }).ToList().Select(
                                c =>
                                new Course
                                    {
                                        Term = c.Term,
                                        TermDescription = c.TermDesc,
                                        Subject = c.Subject,
                                        CatalogNumber = c.CatalogNumber,
                                        ClassSection = c.ClassSection,
                                        Title = c.Title,
                                        InstructorName = c.InstructorName,
                                        BestEmail = c.BestEmail,
                                        ClassNumber = c.ClassNumber
                                    }).ToList();

                ViewBag.PageSize = list.Count;

                ViewBag.TotalCount = list.Count;
                ViewBag.Title = "Universe Course";
                return SortCourses(list,null);
            }
        }
        private ActionResult SortCourses(IEnumerable<Course> list, IEnumerable<Course> defaultList)
        {

            if (!string.IsNullOrEmpty(Request.QueryString["o"]) && Request.QueryString["o"].Equals("subject"))
            {
                return
                    View("List", list.OrderBy(c => c.Subject).ThenBy(c => c.CatalogNumber));
            }
            if (!string.IsNullOrEmpty(Request.QueryString["o"]) && Request.QueryString["o"].Equals("instructor"))
            {
                return
                    View("List",
                         list.OrderBy(c => c.InstructorName).ThenBy(c => c.Subject).ThenBy(c => c.CatalogNumber));
            }
            if (defaultList != null)
            {
                return View("List", defaultList);
            }
            return
                View("List", list.OrderBy(c => c.Subject).ThenBy(c => c.CatalogNumber));
        }

        public ActionResult Upload()
        {
            return View();
        }
        [HttpPost]
        public ActionResult UploadUniverse()
        {
            var file = Request.Files["Universe"];
            if (file == null || file.ContentLength == 0)
                
            {
                ViewBag.Error = "No file has been chosen!";
                return View("Upload");
            }
            var list = new List<UniverseCourse>();
                var table = ExcelHelper.BuildTable(file.InputStream);
            
                Type t = typeof(UniverseCourse);
                PropertyInfo[] props = t.GetProperties();
            for (int i = 1; i < table.GetLength(0); i++)
            {
                var course = new UniverseCourse();
                for (int j = 0; j < table.GetLength(1); j++)
                {
                    var title = Regex.Replace(table[0, j].ToString(), @"\s+", string.Empty);

                    var prop =
                        props.FirstOrDefault(p => p.Name.Equals(title, StringComparison.InvariantCultureIgnoreCase));
                    if (prop != null && table[i, j]!=null && !string.IsNullOrEmpty(table[i, j].ToString().Trim()))
                    {
                        try
                        {
                            prop.SetValue(course, ConvertHelper.ChangeType(table[i, j], prop.PropertyType), null);
                        }
                        catch (Exception e)
                        {
                            
                        }
                    }
                }
                var name = course.InstructorName.Split(',');
                if (name.Length > 1)
                {
                    course.InstructorFirstName = name[0].Trim();
                    course.InstructorLastName = name[1].Trim();
                }
                list.Add(course);

            }
            using (var db = new SHTrackerDbContext())
            {
                db.Database.ExecuteSqlCommand("truncate table universecourse");
            }
            SqlHelper.BulkCopy(ConfigurationManager.ConnectionStrings["icstars"].ConnectionString, list);
            
            ViewBag.TotalCount = list.Count;
            ViewBag.PageSize = list.Count;
            ViewBag.Title = "Universe Course";

            return SortCourses(list.Select(
                    c =>
                    new Course
                    {
                        Term = c.Term,
                        TermDescription = c.TermDesc,
                        Subject = c.Subject,
                        CatalogNumber = c.CatalogNumber,
                        ClassSection = c.ClassSection,
                        Title = c.Title,
                        InstructorName = c.InstructorName,
                        BestEmail = c.BestEmail,
                        ClassNumber = c.ClassNumber
                    }),null);
        }
        [HttpPost]
        public ActionResult UploadForSHTracker()
        {
            var file = Request.Files["Universe"];
            if (file == null || file.ContentLength == 0)
            {
                ViewBag.Error = "No file has been chosen!";
                return View("Upload");
            }
            var list = new List<UniverseCourse>();
            var table = ExcelHelper.BuildTable(file.InputStream);

            Type t = typeof(UniverseCourse);
            PropertyInfo[] props = t.GetProperties();
            for (int i = 1; i < table.GetLength(0); i++)
            {
                var course = new UniverseCourse();
                for (int j = 0; j < table.GetLength(1); j++)
                {
                    var title = Regex.Replace(table[0, j].ToString(), @"\s+", string.Empty);

                    var prop =
                        props.FirstOrDefault(p => p.Name.Equals(title, StringComparison.InvariantCultureIgnoreCase));
                    if (prop != null && table[i, j] != null && !string.IsNullOrEmpty(table[i, j].ToString().Trim()))
                    {
                        try
                        {
                            prop.SetValue(course, ConvertHelper.ChangeType(table[i, j], prop.PropertyType), null);
                        }
                        catch (Exception e)
                        {

                        }
                    }
                }
                var name = course.InstructorName.Split(',');
                if (name.Length > 1)
                {
                    course.InstructorFirstName = name[0].Trim();
                    course.InstructorLastName = name[1].Trim();
                }
                list.Add(course);

            }
            var courses = list.Where(l=>!string.IsNullOrEmpty(l.TermDesc) && !string.IsNullOrEmpty(l.Title)).Select(
                c =>
                    new Course
                    {
                        Term = c.Term,
                        TermDescription = c.TermDesc,
                        Subject = c.Subject,
                        CatalogNumber = c.CatalogNumber,
                        ClassSection = c.ClassSection,
                        Title = c.Title,
                        InstructorName = c.InstructorName,
                        BestEmail = c.BestEmail,
                        ClassNumber = c.ClassNumber,
                        Staff=UserData.RealName
                    });
            SqlHelper.BulkCopy(ConfigurationManager.ConnectionStrings["icstars"].ConnectionString, courses);

            ViewBag.TotalCount = list.Count;
            ViewBag.PageSize = list.Count;
            ViewBag.Title = "Course";

            return RedirectToAction("List");
        }
        #endregion

        #region =HistoricalFaculty=


        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public ActionResult ValidateFaculty(string FirstName,string LastName, int? ID)
        {
            if (string.IsNullOrEmpty(FirstName) || string.IsNullOrEmpty(LastName))
            {
                return Json("FirstName and LastName are required!", JsonRequestBehavior.AllowGet);
            }
            using (var db = new CourseDbContext())
            {
                if (ID > 0)
                {
                    var faculty = db.HistoricalFaculties.First(c => c.ID == ID);
                    //no change, no validation
                    if (faculty.FirstName.Equals(FirstName) && faculty.LastName.Equals(LastName))
                    {
                        return Json(true, JsonRequestBehavior.AllowGet);
                    }
                }
                if (
                    db.HistoricalFaculties.Any(
                        c =>
                        c.FirstName.Equals(FirstName) && c.LastName.Equals(LastName)))
                {
                    return Json(string.Format("{0}, {1} is already in use!", FirstName, LastName), JsonRequestBehavior.AllowGet);
                }
            }
            return Json(true, JsonRequestBehavior.AllowGet);
        }
        public ActionResult HistoricalFacultyList()
        {
            using (var db = new CourseDbContext())
            {
                return View(db.HistoricalFaculties.ToList().OrderBy(m => m.FirstName).ThenBy(m => m.LastName));
            }
        }
        public ActionResult AddHistoricalFaculty()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddHistoricalFaculty(HistoricalFaculty model)
        {
            if (ModelState.IsValid)
            {
                using (var db = new CourseDbContext())
                {
                    db.HistoricalFaculties.Add(model);
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            return RedirectToAction("HistoricalFacultyList");
                        }
                    }
                    catch (Exception exp)
                    {
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("EmpId", "System Error! Please Try it again.");
                }
            }
            return View();
        }
        public ActionResult EditHistoricalFaculty(int id)
        {
            using (var db = new CourseDbContext())
            {
                return View(db.HistoricalFaculties.First(n => n.ID == id));
            }
        }
        [HttpPost]
        public ActionResult EditHistoricalFaculty(HistoricalFaculty model)
        {
            if (ModelState.IsValid)
            {
                using (var db = new SHTrackerDbContext())
                {
                    db.Entry(model).State = EntityState.Modified;
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            return RedirectToAction("HistoricalFacultyList");
                        }
                    }
                    catch (Exception exp)
                    {
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("EmpId", "System Error! Please Try it again.");
                }
            }
            return View();
        }
        public ActionResult DeleteHistoricalFaculty(int id)
        {
            using (var db = new CourseDbContext())
            {
                var m = new HistoricalFaculty { ID = id };
                db.Entry(m).State = EntityState.Deleted;

                db.SaveChanges();
                return RedirectToAction("HistoricalFacultyList");
            }
        }
        #endregion

        #region =HistoricalCourse=
       
        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public ActionResult ValidateCourse(string Subject, string CatalogNumber, string ClassSection, int? ID)
        {
            if (string.IsNullOrEmpty(Subject) || string.IsNullOrEmpty(CatalogNumber))
            {
                return Json("Subject and CatalogNumber are required!", JsonRequestBehavior.AllowGet);
            }
            using (var db = new CourseDbContext())
            {
                if (ID > 0)
                {
                    var course = db.HistoricalCourses.First(c => c.ID == ID);
                    //no change, no validation
                    if (course.Subject.Equals(Subject) && course.CatalogNumber.Equals(CatalogNumber) &&
                        course.ClassSection.Equals(ClassSection))
                    {
                        return Json(true, JsonRequestBehavior.AllowGet);
                    }
                }
                if (
                    db.HistoricalCourses.Any(
                        c =>
                        c.Subject.Equals(Subject) && c.CatalogNumber.Equals(CatalogNumber) &&
                        c.ClassSection.Equals(ClassSection)))
                {
                    return Json(string.Format("{0}-{1}-{2} is already in use!", Subject, CatalogNumber, ClassSection), JsonRequestBehavior.AllowGet);
                }
            }
            return Json(true, JsonRequestBehavior.AllowGet);
        }
        public ActionResult HistoricalCourseList()
        {
            using (var db = new CourseDbContext())
            {
                return View(db.HistoricalCourses.ToList().OrderBy(m => m.Subject));
            }
        }
        public ActionResult AddHistoricalCourse()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddHistoricalCourse(HistoricalCourse model)
        {
            if (ModelState.IsValid)
            {
                using (var db = new CourseDbContext())
                {
                    db.HistoricalCourses.Add(model);
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            return RedirectToAction("HistoricalCourseList");
                        }
                    }
                    catch (Exception exp)
                    {
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("Subject", "System Error! Please Try it again.");
                }
            }
            return View();
        }
        public ActionResult EditHistoricalCourse(int id)
        {
            using (var db = new CourseDbContext())
            {
                return View(db.HistoricalCourses.First(n => n.ID == id));
            }
        }
        [HttpPost]
        public ActionResult EditHistoricalCourse(HistoricalCourse model)
        {
            if (ModelState.IsValid)
            {
                using (var db = new CourseDbContext())
                {
                    db.Entry(model).State = EntityState.Modified;
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            return RedirectToAction("HistoricalCourseList");
                        }
                    }
                    catch (Exception exp)
                    {
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("Subject", "System Error! Please Try it again.");
                }
            }
            return View();
        }
        public ActionResult DeleteHistoricalCourse(int id)
        {
            using (var db = new CourseDbContext())
            {
                var m = new HistoricalCourse { ID = id };
                db.Entry(m).State = EntityState.Deleted;

                db.SaveChanges();
                return RedirectToAction("HistoricalCourseList");
            }
        }
        #endregion

        #region =Json=

        public JsonResult GetCourses()
        {
            var quarteryear = Request.QueryString["qy"];
            if (string.IsNullOrEmpty(quarteryear))
                return Json("Error! A Quarter String is required!", JsonRequestBehavior.AllowGet);
            return
                Json(
                    CourseFactory.CreateCourseCollection(1, 1000, new CourseCollectionSettings() { Term = quarteryear })
                        .OrderBy(c => c.FullName)
                        .Select(c => new { Name = c.FullName, c.ID }), JsonRequestBehavior.AllowGet);
        }
        #endregion
    }
}
