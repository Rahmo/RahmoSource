using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;
using log4net;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    [MvcAuthorize(Roles="admin_mci")]
    public class MCIController : Controller
    {
        //
        // GET: /SHTracker/MCI/
        private static readonly ILog Logger = LogManager.GetLogger(typeof(MCIController));
        
        public ActionResult Index()
        {
            using (var db = new OtherDbContext())
            {
                return View(db.MCI_Periods.ToList());
            }
        }

        private Tuple<bool,MCI_Period> ValidateDate(DateTime date, int? id)
        {
            using (var db = new OtherDbContext())
            {
                if (id > 0)
                {
                    var period = db.MCI_Periods.Find(id);
                    if (period.FromDate == date || period.ToDate == date)
                    {
                        return Tuple.Create<bool, MCI_Period>(true, null);
                    }
                }
                var existingPeriod = db.MCI_Periods.FirstOrDefault(p => p.FromDate <= date && p.ToDate >= date);
                if (existingPeriod != null)
                {
                    return Tuple.Create<bool, MCI_Period>(false, existingPeriod);
                }
            }
            return Tuple.Create<bool, MCI_Period>(true, null);
        }

        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public JsonResult ValidateFromDate(DateTime FromDate, int? id)
        {
            var result = ValidateDate(FromDate, id);
            if (result.Item1)
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            return
                Json(
                    string.Format("[{0:MM/dd/yyyy}] overlaps with another time period[{1:MM/dd/yyyy} to {2:MM/dd/yyyy}]!",
                        FromDate, result.Item2.FromDate, result.Item2.ToDate),
                    JsonRequestBehavior.AllowGet);
        }

        [OutputCache(Location = OutputCacheLocation.None, NoStore = true)]
        public JsonResult ValidateToDate(DateTime ToDate, int?id)
        {
            var result = ValidateDate(ToDate, id);
            if (result.Item1)
            {
                return Json(true, JsonRequestBehavior.AllowGet);
            }
            return
                Json(
                    string.Format("[{0:MM/dd/yyyy}] overlaps with another time period[{1:MM/dd/yyyy} to {2:MM/dd/yyyy}]!",
                        ToDate, result.Item2.FromDate, result.Item2.ToDate),
                    JsonRequestBehavior.AllowGet);
        }
        public ActionResult AddPeriod()
        {
            return View();
        }
        [HttpPost]
        public ActionResult AddPeriod(MCI_Period period)
        {
            if (ModelState.IsValid)
            {
                using (var db = new OtherDbContext())
                {
                    db.MCI_Periods.Add(period);
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            
                            return RedirectToAction("Index");
                        }
                    }
                    catch (Exception exp)
                    {
#if DEBUG
                        throw;
#endif
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("FromDate", "System Error! Please Try it again.");

                }
            }
            return View("AddPeriod", period);
        }
        public ActionResult EditPeriod(int id)
        {
            using (var db = new OtherDbContext())
            {
                return View("AddPeriod", db.MCI_Periods.Find(id));
            }
        }
        [HttpPost]
        public ActionResult EditPeriod(MCI_Period period)
        {
            if (ModelState.IsValid)
            {
                using (var db = new OtherDbContext())
                {
                    db.Entry(period).State = EntityState.Modified;
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            
                            return RedirectToAction("Index");
                        }
                    }
                    catch (Exception exp)
                    {
#if DEBUG
                        throw;
#endif
                        Log4NetHelper.WriteLog(exp, Logger);
                    }
                    ModelState.AddModelError("FromDate", "System Error! Please Try it again.");
                }
            }
            return View("AddPeriod", period);
        }
        public ActionResult DeletePeriod(int id)
        {
            using (var db = new OtherDbContext())
            {
                var nav = new MCI_Period() {ID = id};
                db.Entry(nav).State = EntityState.Deleted;

                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }

        public ActionResult ViewTimesheet(int id)
        {
            var from = Convert.ToDateTime(Request.QueryString["from"]);
            var to = Convert.ToDateTime(Request.QueryString["to"]);
            ViewBag.FromDate = from;
            ViewBag.ToDate = to;

            using (var db = new OtherDbContext())
            {
                var list = db.MCI_TimeLogs.Join(db.Members, t => t.UserID, m => m.ID,
                    (t, m) => new {t, m.FirstName, m.LastName, UserID = m.ID})
                    .Where(t => t.UserID == id && t.t.LogDate >= from && t.t.LogDate <= to)
                    .ToList().Select(t =>
                    {
                        t.t.StudentName = t.FirstName + ", " + t.LastName;
                        return t.t;
                    })
                    .OrderBy(t => t.LogDate);
                ViewBag.StudentName = list.FirstOrDefault().StudentName;
                return
                    View(list);
            }
        }
        public ActionResult ViewReportedHours()
        {
            var from = Convert.ToDateTime(Request.QueryString["from"]);
            var to = Convert.ToDateTime(Request.QueryString["to"]);
            ViewBag.FromDate = from;
            ViewBag.ToDate = to;
            using (var db = new OtherDbContext())
            {
                return
                    View(
                        db.MCI_TimeLogs.Join(db.Members,t=>t.UserID,m=>m.ID,(t,m)=>new{t,m.FirstName,m.LastName}).Where(t => t.t.LogDate >= from && t.t.LogDate <= to)
                            .ToList().Select(t=> { t.t.StudentName = t.FirstName + ", " + t.LastName;
                                                     return t.t;
                            })
                            .OrderBy(t => t.LogDate));
            }
        }

        public ActionResult Approve(int id)
        {
            using (var db = new OtherDbContext())
            {
                db.MCI_TimeLogs.Find(id).IsAuthorized = true;
                db.SaveChanges();
                return Redirect(Request.UrlReferrer.ToString());
            }
        }
        public ActionResult Disapprove(int id)
        {
            using (var db = new OtherDbContext())
            {
                db.MCI_TimeLogs.Find(id).IsAuthorized = false;
                db.SaveChanges();
                return Redirect(Request.UrlReferrer.ToString());
            }
        }
    }
}
