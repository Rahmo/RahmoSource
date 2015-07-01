using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Web;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.Common.Lambda;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Items;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.CourseServices
{
    #region =CourseFactory=
    internal class CourseFactory : ICourseFactory, IWeakReferenceRegister
    {
        [Dependency]
        public IDB_Course DB_Course { get; set; }
        [Dependency]
        public IUserData UserData { get; set; }
        private CourseCollectionSettings DecorateSettings(CourseCollectionSettings settings)
        {
            if (settings == null) settings = new CourseCollectionSettings();
            //if the user is a CSSP staff, show CSSP courses
            if (HttpContext.Current.User.IsInRole("CSSP"))
            {
                settings.CourseType = CourseType.CSSP;
            }
            //if the user is a professor, show only his/her courses
            if (HttpContext.Current.User.IsInRole("Professor"))
            {
                settings.IsCheckInstructorName = true;
                settings.InstructorName = HttpContext.Current.User.Identity.Name;
            }
            //CSSP courses are year-based.
            if (settings.CourseType == CourseType.CSSP) return settings;
            //from here, settings are only for placement courses.
            //Placement courses are quarter-based.

            //if user selected multiple quarters when login
            if (UserData.QuarterYear.IndexOf(',') > -1)
            {
                if (settings.TermArray == null)
                {
                    settings.TermArray = UserData.QuarterYear.Split(',');
                }
            }
                //if user selected only one quarter when login
            else
            {
                if (string.IsNullOrEmpty(settings.Term))
                {
                    settings.Term = UserData.QuarterYear;
                }
            }
            return settings;
        }
        /// <summary>
        /// Course SelectListItem list for Dropdownlist
        /// </summary>
        /// <param name="seletedCourseID">seletedCourseID indicates which item to be selected</param>
        /// <param name="settings">CourseCollectionSettings</param>
        /// <returns></returns>
        public IEnumerable<SelectListItem> BuildCourseSeleteListItems(int seletedCourseID, CourseCollectionSettings settings)
        {

            settings = DecorateSettings(settings);
            return CreateCourseCollection(1, 1000,settings).Select(
                r =>
                new SelectListItem
                {
                    Text = r.FullName,
                    Value = r.ID.ToString(),
                    Selected = r.ID == seletedCourseID
                }).OrderBy(c=>c.Text);
        }
        /// <summary>
        /// Course SelectListItem list for Dropdownlist
        /// </summary>
        /// <param name="seletedCourseID">seletedCourseID indicates which item to be selected</param>
        /// <returns></returns>
        public IEnumerable<SelectListItem> BuildCourseSeleteListItems(int seletedCourseID)
        {
            var settings = DecorateSettings(null);
            return BuildCourseSeleteListItems(seletedCourseID, settings);
        }

        public IEnumerable<SelectListItem> BuildCourseSeleteListItems()
        {
            return BuildCourseSeleteListItems(0);
        }

        public ICourseCollection CreateCourseCollection(int pageIndex, int pageSize)
        {
            var settings = DecorateSettings(null);
            return CreateCourseCollection(pageIndex, pageSize, settings);
        }

        public ICourseCollection CreateCourseCollection(int pageIndex, int pageSize, CourseCollectionSettings settings)
        {
            using (var db = new SHTrackerDbContext())
            {

                var predicate = PredicateBuilder.True<Course>();
                settings = DecorateSettings(settings);

                Expression<Func<Course, bool>> checkCourse = PredicateBuilder.True<Course>();
                //if only one quarter
                if (!string.IsNullOrEmpty(settings.Quater_Year))
                {

                    checkCourse =
                        c => db.Students.Any(s => s.CourseID == c.ID && db.Student2CBOs.Any(
                            s2c => s2c.StudentID == s.ID && s2c.Quater_Year.Equals(settings.Quater_Year)));
                }
                //if multiple quarters
                if (settings.QuaterYearArray != null)
                {
                    checkCourse =
                        c => db.Students.Any(s => s.CourseID == c.ID && db.Student2CBOs.Any(
                            s2c =>
                            s2c.StudentID == s.ID && settings.QuaterYearArray.Any(qy => qy.Equals(s2c.Quater_Year))));
                }
                //check DePaul ID
                if (!string.IsNullOrEmpty(settings.DPU_ID))
                {
                    checkCourse =
                        checkCourse.And(
                            c => db.Students.Any(s => s.CourseID == c.ID && s.DPU_ID.Equals(settings.DPU_ID)));
                }
                predicate = predicate.And(checkCourse);

                //check professor
                if (settings.IsCheckInstructorName)
                {
                    predicate = predicate.And(c => c.InstructorName.Equals(settings.InstructorName));
                }
                //check course term if only one
                if (!string.IsNullOrEmpty(settings.Term))
                {
                    predicate = predicate.And(c => c.TermDescription.Equals(settings.Term));
                }
                //check course terms if multiple
                if (settings.TermArray != null)
                {
                    predicate = predicate.And(c => settings.TermArray.Any(t => t.Equals(c.TermDescription)));
                }
                //check course type
                if (settings.CourseType != CourseType.All)
                {
                    predicate = predicate.And(c => c.Type == (int) settings.CourseType);
                }
                var cc =
                    new CourseCollection(
                        db.Courses.AsNoTracking()
                          .Where(predicate)
                          .OrderByDescending(m => m.ID)
                          .Skip((pageIndex - 1)*pageSize)
                          .Take(pageSize)
                          .ToList(),
                        db.Courses.AsNoTracking().Where(predicate).Count())
                        {
                            PageIndex = pageIndex,
                            PageSize = pageSize,
                            Settings = DecorateSettings(settings)
                        };

                return cc;
            }
        }

        public Course Create(int id)
        {
            Course m = new Course();
            if (id > 0)
            {
                using (var db = new SHTrackerDbContext())
                {
                    m = db.Courses.FirstOrDefault(c => c.ID == id);
                }
                //ReflectionHelper.Fill(DB_Course.CourseInfo(id), m);
            }
            return m;
        }
        public Course Update(Course m)
        {
            using (var db = new SHTrackerDbContext())
            {
                if (m.ID > 0)
                {
                    db.Entry(m).State = EntityState.Modified;
                    //DB_Course.Update(m);
                }
                else
                {
                    db.Courses.Add(m);
                    //m.ID = DB_Course.Add(m);
                }
                db.SaveChanges();
            }
            return m;
        }

        public int UpdateInstructorName(int id, string instructorName)
        {
            using (var db = new SHTrackerDbContext())
            {
                var c = new Course() {ID = id, InstructorName = instructorName};
                db.Entry(c).State=EntityState.Modified;
                return db.SaveChanges();
            }
            //return DB_Course.UpdateInstructorName(id, instructorName);
        }

        public int Delete(int ID)
        {
            using (var db = new SHTrackerDbContext())
            {
                var c = new Course() { ID = ID };
                db.Entry(c).State = EntityState.Deleted;

                return db.SaveChanges();
            }
            //return DB_Course.Delete(ID);
        }
        public bool Exists(int ID)
        {
            using (var db = new SHTrackerDbContext())
            {
                return db.Courses.Any(c => c.ID == ID);
            }
            //return DB_Course.Exists(ID);
        }
    }
    #endregion
}
