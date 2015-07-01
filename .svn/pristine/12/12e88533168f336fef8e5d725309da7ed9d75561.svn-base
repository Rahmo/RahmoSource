using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DocumentFormat.OpenXml.Drawing;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.ObjectBuilder2;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.SHTracker.Controllers
{

    [MvcAuthorize(Roles = "admin,admin_student,Staff,SLC")]
    public class ServiceHoursController : Controller
    {
        //
        // GET: /SHTracker/ServiceHours/

        [Dependency]
        public IStudentFactory StudentFactory { get; set; }

        public ActionResult HistoricalHours(int studentId)
        {
            using (var db = new SHTrackerDbContext())
            {
                return View(db.ServiceHourses.Where(
                    sh =>
                        sh.StudentID == studentId &&
                        !db.Student2CBOs.Any(s2c => s2c.StudentID == sh.StudentID && s2c.CBOID == sh.CBO_ID))
                    .Join(db.Cbos, sh => sh.CBO_ID, c => c.ID,
                        (sh, c) =>
                            new
                            {
                                CBOID = sh.CBO_ID,
                                CBOName = c.Name,
                                sh.StudentID,
                                sh.HoursServed,
                                sh.ContactType,
                                sh.ServiceDate,
                                sh.CourseID
                            })
                    .Join(db.Courses, s => s.CourseID, c => c.ID,
                        (s, c) =>
                            new { s, c.Subject, c.CatalogNumber, c.InstructorName, c.ClassSection, c.TermDescription })
                    .ToList()
                    .Select(
                        s =>
                            new HistoricalHours
                            {
                                StudentID = s.s.StudentID,
                                CBOID = s.s.CBOID,
                                CBOName = s.s.CBOName,
                                CourseID = s.s.CourseID,
                                CourseName =
                                    string.Format("{0}--{1}--{4}--{2} ({3})", s.Subject, s.CatalogNumber,
                                        s.InstructorName, s.TermDescription, s.ClassSection),
                                HoursServiceDate = s.s.ServiceDate,
                                HoursServed = s.s.HoursServed,
                                HoursContactType = s.s.ContactType
                            })
                    .OrderBy(s => s.CourseName)
                    .ThenBy(s => s.CBOID)
                    );
            }
        }

        public ActionResult ImportHistoricalHours(int studentId, int courseId, int cboId, int targetCboId,int targetCourseId, string returnUrl)
        {
            using (var db = new SHTrackerDbContext())
            {
                db.ServiceHourses.Where(s => s.StudentID == studentId && s.CourseID == courseId && s.CBO_ID == cboId).ForEach(s =>
                {
                    s.CBO_ID = targetCboId;
                    s.CourseID = targetCourseId;
                    s.ContactType = "Transferred";
                });
                db.SaveChanges();
                db.ServiceHourses.Where(
                    s => s.StudentID == studentId && s.CourseID == targetCourseId && s.CBO_ID == targetCboId)
                    .ToList()
                    .ForEach(
                        s => StudentFactory.UpdateServedHours(s));
            }
            
            return Redirect(returnUrl);
        }
    }
}
