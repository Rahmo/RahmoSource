using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Diagnostics;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Web;
using System.Web.Mvc;
using DocumentFormat.OpenXml.Office2010.Excel;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Model.Enum;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    public class SLCGroupReport
    {
        public string SLCName { get; set; }
        public string CampusConnectID { get; set; }
        public int AssignedStudents { get; set; }
        public int AssignedCBOs { get; set; }
        public int AssignedCourses { get; set; }
        public double? ServedHours { get; set; }
        public double? RequiredHours { get; set; }
        public int TotalNotes { get; set; }
    }
    [MvcAuthorize(Roles = "admin,admin_report,Staff,Professor,CSSP,SLC")]
    public class ReportController : Controller
    {
        //
        // GET: /SHTracker/Report/
        [Dependency]
        public IUserData UserData { get; set; }
        public ActionResult SLCGroup()
        {
            ViewBag.QuarterYear = UserData.QuarterYear;
            using (var db = new SHTrackerDbContext())
            {
                ViewBag.TotalCBOs =
                    db.Student2CBOs.Where(
                        s2c =>
                            s2c.Quater_Year.Equals(UserData.QuarterYear))
                        .GroupBy(s2c => s2c.CBOID).AsNoTracking()
                        .Count();

                ViewBag.TotalCourses =
                    db.Courses.AsNoTracking().Where(c => db.Students.Any(s => s.CourseID == c.ID) && c.TermDescription.Equals(UserData.QuarterYear)).Count();

                ViewBag.TotalStudents =
                    db.Students.AsNoTracking().Where(
                        s =>
                            db.Student2CBOs.Any(
                                s2c => s2c.StudentID == s.ID && s2c.Quater_Year.Equals(UserData.QuarterYear))).Count();
                

                return View(db.Members.Where(
                        m =>
                            db.Member2Roles.Any(
                                m2r =>
                                    m2r.MemberID == m.ID &&
                                    db.Roles.Any(r => r.ID == m2r.RoleID && r.Name.Equals("SLC")))).AsNoTracking()
                        .Select(m => new SLCGroupReport()
                        {
                            SLCName = m.FirstName + ", " + m.LastName,
                            CampusConnectID=m.CampusConnectID,
                            AssignedStudents = db.Students.Count(s => s.SLC.Equals(m.CampusConnectID) && db.Student2CBOs.Any(s2c=>s2c.StudentID==s.ID && s2c.Quater_Year.Equals(UserData.QuarterYear))),
                            AssignedCBOs = db.Student2CBOs.Where(s2c => s2c.Quater_Year.Equals(UserData.QuarterYear) && db.Students.Any(s => s.ID == s2c.StudentID && s.SLC.Equals(m.CampusConnectID))).GroupBy(s2c=>s2c.CBOID).Count(),
                            AssignedCourses = db.Courses.Count(c => c.TermDescription.Equals(UserData.QuarterYear) && db.Students.Any(s => s.CourseID == c.ID && s.SLC.Equals(m.CampusConnectID))),
                            ServedHours = db.ServiceHourses.Where(sh => db.Students.Any(s => s.ID == sh.StudentID && s.SLC.Equals(m.CampusConnectID) && db.Student2CBOs.Any(s2c => s2c.StudentID == s.ID && s2c.Quater_Year.Equals(UserData.QuarterYear)))).Sum(sh => sh.HoursServed),
                            RequiredHours = db.Student2CBOs.Where(s2c => s2c.Quater_Year.Equals(UserData.QuarterYear) && db.Students.Any(s => s.ID == s2c.StudentID && s.SLC.Equals(m.CampusConnectID))).Sum(s2c => s2c.RequiredHours),
                            TotalNotes = db.ServiceHourses.Count(sh => !sh.ContactType.Equals("System") && !sh.ContactType.Equals("StudentApp") && db.Students.Any(s => s.ID == sh.StudentID && s.SLC.Equals(m.CampusConnectID) && db.Student2CBOs.Any(s2c => s2c.StudentID == s.ID && s2c.Quater_Year.Equals(UserData.QuarterYear))))
                        }).ToList().Union(new[]{new SLCGroupReport()
                        {
                           SLCName="No SLC" ,
                           CampusConnectID="No SLC",
                           AssignedStudents = db.Students.Where(s => s.SLC.Equals("") && db.Student2CBOs.Any(s2c=>s2c.StudentID==s.ID && s2c.Quater_Year.Equals(UserData.QuarterYear))).Count(),
                            AssignedCBOs = db.Student2CBOs.Where(s2c => s2c.Quater_Year.Equals(UserData.QuarterYear) && db.Students.Any(s => s.ID == s2c.StudentID && s.SLC.Equals(""))).GroupBy(s2c=>s2c.CBOID).Count(),
                            AssignedCourses = db.Courses.Where(c => c.TermDescription.Equals(UserData.QuarterYear) && db.Students.Any(s => s.CourseID == c.ID && s.SLC.Equals(""))).Count(),
                            ServedHours = db.ServiceHourses.Where(sh => db.Students.Any(s => s.ID == sh.StudentID && s.SLC.Equals("") && db.Student2CBOs.Any(s2c => s2c.StudentID == s.ID && s2c.Quater_Year.Equals(UserData.QuarterYear)))).Select(sh=>sh.HoursServed).DefaultIfEmpty(0).Sum(),
                            RequiredHours = db.Student2CBOs.Where(s2c => s2c.Quater_Year.Equals(UserData.QuarterYear) && db.Students.Any(s => s.ID == s2c.StudentID && s.SLC.Equals(""))).Select(s2c=>s2c.RequiredHours).DefaultIfEmpty(0).Sum(),
                            TotalNotes = db.ServiceHourses.Where(sh => !sh.ContactType.Equals("System") && !sh.ContactType.Equals("StudentApp") && db.Students.Any(s => s.ID == sh.StudentID && s.SLC.Equals("") && db.Student2CBOs.Any(s2c => s2c.StudentID == s.ID && s2c.Quater_Year.Equals(UserData.QuarterYear)))).Count()
                        }})); 
            }
            
        }
        public ActionResult GroupByCBO()
        {
            using (var db = new SHTrackerDbContext())
            {
                var cbolist = db.Cbos.Include(c=>c.Student2Cbos.Select(s2c=>s2c.Student.Student2Programs.Select(s2p=>s2p.Program))).Include(c => c.Student2Cbos.Select(s2c => s2c.Student.Course.Students))

                    .Where(
                        c =>
                            db.Student2CBOs.Any(s2c => s2c.CBOID == c.ID && s2c.Quater_Year.Equals(UserData.QuarterYear)
                            && db.Students.Any(s=>s.ID==s2c.StudentID && db.Courses.Any(cs=>cs.ID==s.CourseID && cs.Type==0))))
                    ;

                var students =
                    cbolist.SelectMany(cbo => cbo.Student2Cbos)
                        .Where(s2c => s2c.Quater_Year.Equals(UserData.QuarterYear)
                        && db.Students.Any(s => s.ID == s2c.StudentID && db.Courses.Any(cs => cs.ID == s.CourseID && cs.Type == 0)))
                        .Select(s2c => s2c.Student);
                var courses =
                    db.Courses.Where(
                        c =>
                            c.Type == 0 && students.Any(s => s.CourseID == c.ID) &&
                            c.TermDescription.Equals(UserData.QuarterYear));
                ViewBag.Courses = courses.ToList().OrderBy(c => c.FullName);
                ViewBag.ServiceHours = db.ServiceHourses.Where(sh => sh.Quater_Year.Equals(UserData.QuarterYear)).ToList();
                return View(cbolist.ToList());
            }
        }

    }
}
