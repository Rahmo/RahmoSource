using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer;
using ICStars2_0.Common.Lambda;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;
using log4net;
using ICStars2_0.Common;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    public class SON_StudentDetails
    {
        //s.Name, s.StudentID, c.CPID, c.IsASL, c.Placement
        public string Name { get; set; }
        public int StudentID { get; set; }
        public int CPID { get; set; }
        public bool IsASL { get; set; }
        public bool Placement { get; set; }
    }

    [MvcAuthorize(Roles = "admin,admin_son,Staff")]
    public class SONController : Controller
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(SONController));
        //
        #region =Students=

        public ActionResult Students()
        {
            using (var db = new OtherDbContext())
            {
                var r = from s in db.son_students
                        from p1 in db.son_cboprograms.Where(p=>p.CPID==s.CPID1).DefaultIfEmpty()
                        from p2 in db.son_cboprograms.Where(p => p.CPID == s.CPID2).DefaultIfEmpty()
                        from p3 in db.son_cboprograms.Where(p => p.CPID == s.CPID3).DefaultIfEmpty()
                        select
                            new 
                                {
                                    s.StudentID,
                                    s.Name,
                                    s.ClassSection,
                                    s.Languages,
                                    ProgramName1 = p1.ProgramName,
                                    ProgramName2 = p2.ProgramName,
                                    ProgramName3 = p3.ProgramName,
                                    CBOName1=p1.CBOName,
                                    CBOName2=p2.CBOName,
                                    CBOName3=p3.CBOName,
                                    Location1=p1.Location,
                                    Location2=p2.Location,
                                    Location3=p3.Location
                                };
                return View(r.ToList().OrderBy(s => s.Name).Select(s => new son_student()
                    {
                        StudentID = s.StudentID,
                        ClassSection = s.ClassSection,
                        Languages = s.Languages,
                        Name = s.Name
                        ,
                        CPName1 =
                            string.IsNullOrEmpty(s.CBOName1) && string.IsNullOrEmpty(s.ProgramName1) &&
                            string.IsNullOrEmpty(s.Location1)
                                ? string.Empty
                                : string.Format("<b>{0}:{1}</b> ({2})", s.CBOName1, s.ProgramName1, s.Location1)
                        ,
                        CPName2 = string.IsNullOrEmpty(s.CBOName2) && string.IsNullOrEmpty(s.ProgramName2) &&
                            string.IsNullOrEmpty(s.Location2)
                                ? string.Empty
                                : string.Format("<b>{0}:{1}</b> ({2})", s.CBOName2, s.ProgramName2, s.Location2)
                        ,
                        CPName3 = string.IsNullOrEmpty(s.CBOName3) && string.IsNullOrEmpty(s.ProgramName3) &&
                            string.IsNullOrEmpty(s.Location3)
                                ? string.Empty
                                : string.Format("<b>{0}:{1}</b> ({2})", s.CBOName3, s.ProgramName3, s.Location3)
                    })
                    );

            }
        }
        public ActionResult EditStudent(int id)
        {
            using (var db = new OtherDbContext())
            {
                var student = db.son_students.FirstOrDefault(s => s.StudentID == id);
                ViewBag.CPSeletedItemList = db.son_cboprograms.OrderBy(p => p.CBOName)
                                              .ThenBy(p => p.ProgramName).ToList();
                return View(student);
            }
        }
        [HttpPost]
        public ActionResult EditStudent(son_student student)
        {
            if (ModelState.IsValid)
            {
                using (var db = new OtherDbContext())
                {
                    db.Entry(student).State = EntityState.Modified;
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            return RedirectToAction("Students");
                        }
                    }
                    catch (Exception exp)
                    {
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("Name", "System Error! Please Try it again.");
                }
            }
            return View(student);
        }

        #endregion
        #region =CBOs=

        public ActionResult CBOs()
        {
            using (var db = new OtherDbContext())
            {
                var choices = db.son_cbochoices.GroupBy(c => c.CPID).Select(c => new { EnteredChoicesCount = c.Count(), CPID = c.Key });
                var placedChoices = db.son_cbochoices.Where(c=>c.Placement).GroupBy(c => c.CPID).Select(c => new { PlacementCount = c.Count(), CPID = c.Key });
                var placedChoices2 =
                    db.son_students.Where(s => s.Placement1)
                      .Select(s => s.CPID1)
                      .Union(db.son_students.Where(s => s.Placement2).Select(s => s.CPID2))
                      .Union(db.son_students.Where(s => s.Placement3).Select(s => s.CPID3))
                      .GroupBy(p => p)
                      .Select(p => new {PlacementCount = p.Count(), CPID = p.Key});
                var cbos = db.son_cboprograms.ToList().OrderBy(p => p.CBOName).ThenBy(p => p.ProgramName);

                foreach (var cbo in cbos)
                {
                    var choice = choices.FirstOrDefault(c => c.CPID == cbo.CPID);
                    var placedChoice = placedChoices.FirstOrDefault(c => c.CPID == cbo.CPID);
                    var placedChoice2 = placedChoices2.FirstOrDefault(c => c.CPID == cbo.CPID);
                    cbo.EnteredChoicesCount = choice == null ? 0 : choice.EnteredChoicesCount;
                    cbo.SlotsAvailable = cbo.Slots - (placedChoice == null ? 0 : placedChoice.PlacementCount) -
                                         (placedChoice2 == null ? 0 : placedChoice2.PlacementCount);
                }

                return View(cbos);
            }
        }

        public ActionResult CBOChoices()
        {
            using (var db = new OtherDbContext())
            {
                ViewBag.Students = db.son_students.ToList();
                ViewBag.CboChoices = db.son_cbochoices.ToList();
                return View(db.son_cboprograms.ToList().OrderBy(p => p.CBOName).ThenBy(p => p.ProgramName));
            }
        }
        public ActionResult EditCBOProgram(int id)
        {
            using (var db = new OtherDbContext())
            {
                ViewBag.Students = db.son_students.ToList().OrderBy(s => s.Name);
                ViewBag.Choices = db.son_cbochoices.Where(c => c.CPID == id && c.IsASL==false).ToList();
                return View(db.son_cboprograms.FirstOrDefault(p=>p.CPID==id));
            }
        }
        [HttpPost]
        public ActionResult EditCBOProgram(son_cboprogram cbo)
        {
            if (ModelState.IsValid)
            {
                using (var db = new OtherDbContext())
                {
                    db.Entry(cbo).State = EntityState.Modified;
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            if (cbo.StudentChoice != null)
                            {
                                var newStuIds = cbo.StudentChoice.Select(s => s.ToInt32()).Where(i => i > 0);
                                var oldStuids = db.son_cbochoices.Where(c => c.CPID == cbo.CPID)
                                                  .Select(c => c.StudentID);
                                var targetStuids = newStuIds.Except(oldStuids);
                                var deletingStuIds = oldStuids.Except(newStuIds);
                                foreach (var stuid in deletingStuIds)
                                {
                                    var choice = new son_cbochoice {CPID = cbo.CPID, StudentID = stuid};
                                    db.Entry(choice).State = EntityState.Deleted;
                                }
                                foreach (var stuid in targetStuids)
                                {
                                    db.son_cbochoices.Add(new son_cbochoice() {CPID = cbo.CPID, StudentID = stuid});
                                }
                                db.SaveChanges();
                            }
                            return RedirectToAction("Cbos");
                        }
                    }
                    catch (Exception exp)
                    {
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("CBOName", "System Error! Please Try it again.");
                }
            }
            return View(cbo);
        }

        #endregion
        #region =Student Match=
        public JsonResult SetPlacement(int stuid,int identity,int isDelete,int cpid)
        {
            using (var db = new OtherDbContext())
            {

                var stu = db.son_students.Find(stuid);
                #region =if delete=

                if (isDelete == 1)
                {
                    stu.Placement1 = false;
                    stu.Placement2 = false;
                    stu.Placement3 = false;
                    db.SaveChanges();
                    return Json(true, JsonRequestBehavior.AllowGet);
                }
                #endregion

                #region =check if the student has been placed=

                if (db.son_cbochoices.Any(c=>c.StudentID==stuid && c.Placement)
                    || stu.Placement1 || stu.Placement2 || stu.Placement3)
                {
                    return Json(new { Result = false, Msg = string.Format("This student [{0}] has already been placed!", stu.Name) }, JsonRequestBehavior.AllowGet);
                }
                #endregion

                #region =check available slots=

                var placedChoices = db.son_cbochoices.Count(c => c.Placement && c.CPID == cpid);
                var placedChoices2 =
                    db.son_students.Count(s => s.Placement1 && s.CPID1 == cpid)
                    + db.son_students.Count(s => s.Placement2 && s.CPID2 == cpid)
                    + db.son_students.Count(s => s.Placement3 && s.CPID3 == cpid);
                var cbo = db.son_cboprograms.FirstOrDefault(p => p.CPID == cpid);
                if (cbo != null)
                {
                    if (cbo.Slots - placedChoices - placedChoices2 <= 0)
                    {
                        return Json(new { Result = false, Msg = "There is no available slot!" }, JsonRequestBehavior.AllowGet);
                    }
                }
                #endregion

                #region =update=

                if (identity == 1)
                {
                    stu.Placement1 = true;

                }else if (identity == 2)
                {
                    stu.Placement2 = true;
                }else if (identity == 3)
                {
                    stu.Placement3 = true;
                }
                db.SaveChanges();
                #endregion
                return Json(true, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult StudentMatch()
        {
            using (var db = new OtherDbContext())
            {
                var studentChoices=db.son_cboprograms.Where(
                        p => db.son_students.Any(s => s.CPID1 == p.CPID || s.CPID2 == p.CPID || s.CPID3 == p.CPID))
                      .ToList()
                      .OrderBy(c => c.CBOName);
                ViewBag.CBOs = studentChoices;
                var cbosArray = studentChoices.Select(p=>p.CPID).ToArray();
                //for cbo preference
                ViewBag.CBOChoices = db.son_cbochoices.Where(c => cbosArray.Contains(c.CPID)).ToList();
                return View(db.son_students.ToList());
            }
        }
        #endregion

        #region =CBO Match=
        public JsonResult SetPlacementForCBOChoices(int stuid, int cpid, int isDelete)
        {
            using (var db = new OtherDbContext())
            {
                var stu = db.son_students.FirstOrDefault(s => s.StudentID == stuid);
                var choice = db.son_cbochoices.Find(cpid, stuid);
                if (isDelete == 1)
                {
                    choice.Placement = false;
                    db.SaveChanges();
                    return Json(true, JsonRequestBehavior.AllowGet);
                }

                #region =check if the student has been placed=

                if (db.son_cbochoices.Any(c=>c.StudentID==stuid && c.Placement)
                    || stu.Placement1 || stu.Placement2 || stu.Placement3)
                {
                    return Json(new { Result = false, Msg = string.Format("This student [{0}] has already been placed!", stu.Name) }, JsonRequestBehavior.AllowGet);
                }
                #endregion

                #region =check available slots=

                var placedChoices = db.son_cbochoices.Count(c => c.Placement && c.CPID == cpid);
                var placedChoices2 =
                    db.son_students.Count(s => s.Placement1 && s.CPID1 == cpid)
                    + db.son_students.Count(s => s.Placement2 && s.CPID2 == cpid)
                    + db.son_students.Count(s => s.Placement3 && s.CPID3 == cpid);
                var cbo = db.son_cboprograms.FirstOrDefault(p => p.CPID == cpid);
                if (cbo != null)
                {
                    if (cbo.Slots - placedChoices - placedChoices2 <= 0)
                    {
                        return Json(new { Result = false, Msg = "There is no available slot!" }, JsonRequestBehavior.AllowGet);
                    }
                }
                #endregion

                choice.Placement = true;
                db.SaveChanges();
                return Json(true, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult CBOMatch()
        {
            using (var db = new OtherDbContext())
            {
                var CBOs = db.son_cboprograms.Where(p => db.son_cbochoices.Any(c => c.CPID == p.CPID)).ToList();
                ViewBag.CBOs = CBOs;
                ViewBag.CBO2Student = db.son_cbochoices.ToList();

                //for student preference
                ViewBag.Students = db.son_students.ToList();
                return View(db.son_students.Where(s => db.son_cbochoices.Any(c => c.StudentID == s.StudentID && c.IsASL==false)).ToList());
            }
        }
        #endregion

        #region =NoMatch=

        public ActionResult NoMatch()
        {
            using (var db = new OtherDbContext())
            {
                var a1 = db.son_cbochoices.Where(c => c.Placement)
                           .GroupBy(c => c.CPID)
                           .Select(c => new {PlacementCount = c.Count(), CPID = c.Key});
                var a2 = db.son_students.Where(s => s.Placement1)
                           .Select(s => s.CPID1)
                           .Union(db.son_students.Where(s => s.Placement2).Select(s => s.CPID2))
                           .Union(db.son_students.Where(s => s.Placement3).Select(s => s.CPID3))
                           .GroupBy(p => p)
                           .Select(p => new {PlacementCount = p.Count(), CPID = p.Key});
                var a3 = a1.Union(a2).GroupBy(a => a.CPID).Select(c => new {PlacementCount = c.Sum(x=>x.PlacementCount), CPID = c.Key});

                var cbosLeft = db.son_cboprograms.Where(p => a3.Any(c => c.CPID == p.CPID && p.Slots > c.PlacementCount) || !a3.Any(c => c.CPID == p.CPID) || db.son_cbochoices.Any(c => c.CPID == p.CPID && c.IsASL)
                    ).ToList().OrderBy(p => p.CBOName).ThenBy(p => p.ProgramName);
                foreach (var cbo in cbosLeft)
                {
                    var placement = a3.FirstOrDefault(a => a.CPID == cbo.CPID);
                    cbo.SlotsAvailable = cbo.Slots - (placement == null ? 0 : placement.PlacementCount);
                }
                ViewBag.CBOsLeft = cbosLeft;
                
                ViewBag.StudentsLeft =
                    db.son_students.Where(
                        s =>
                        !db.son_cbochoices.Any(c => c.StudentID == s.StudentID) && s.CPID1 == 0 && s.CPID2 == 0 &&
                        s.CPID3 == 0).ToList().OrderBy(s=>s.Name);

                ViewBag.ASLPlacedStudents =
                    db.son_cbochoices.Join(db.son_students, c => c.StudentID, s => s.StudentID,
                                           (c, s) => new {s.Name, s.StudentID, c.CPID, c.IsASL, c.Placement})
                      .Where(c => c.IsASL && c.Placement)
                      .ToList().Select(s=>new SON_StudentDetails{Name=s.Name,CPID=s.CPID,IsASL=s.IsASL,StudentID=s.StudentID,Placement=s.Placement})
                      .OrderBy(s => s.Name);
                return View();
            }
        }
        [HttpPost]
        public ActionResult NoMatchRequest(int studentId, int cpid)
        {
            using (var db = new OtherDbContext())
            {
                var choice = new son_cbochoice() {StudentID = studentId, CPID = cpid, IsASL = true,Placement=true};
                db.son_cbochoices.Add(choice);
                db.SaveChanges();
            }
            return RedirectToAction("NoMatch");
        }
        [HttpPost]
        public ActionResult NoMatchRequestRemove(int studentId, int cpid)
        {
            using (var db = new OtherDbContext())
            {
                var choice = new son_cbochoice() { StudentID = studentId, CPID = cpid };
                db.Entry(choice).State=EntityState.Deleted;
                db.SaveChanges();
            }
            return RedirectToAction("NoMatch");
        }
        #endregion

        public ActionResult Report()
        {
            using (var db = new OtherDbContext())
            {
                string section = Request.QueryString["section"];
                var predicate = PredicateBuilder.True<son_student>();
                if (!string.IsNullOrEmpty(section) && section.Equals("101"))
                {
                    predicate = predicate.And(s => s.ClassSection.Equals("101"));

                }
                else if (!string.IsNullOrEmpty(section) && section.Equals("102"))
                {
                    predicate = predicate.And(s => s.ClassSection.Equals("102"));
                }
                ViewBag.Students = db.son_students.Where(predicate).ToList();
                ViewBag.CBO2Student = db.son_cbochoices.Where(c=>c.Placement).ToList();
                return View(db.son_cboprograms.ToList().OrderBy(p=>p.CBOName).ThenBy(p=>p.ProgramName));
            }
        }
    }
}
