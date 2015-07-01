using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.Login;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Common;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc.Filter;
using Microsoft.Practices.Unity;
using Org.BouncyCastle.Ocsp;

namespace ICStars2_0.Areas.MCI.Controllers
{
    [MvcAuthorize(Roles = "MCI",UnauthorizedRedirectUrl= "/MCI/Login",IsRedirectOnly=true)]
    public class TimeLogController : Controller
    {
        //
        // GET: /MCI/TimeLog/
        [Dependency]
        public IUserData UserData { get; set; }

        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }
       
        public ActionResult Authorizing()
        {
            using (var db = new MemberDbContext())
            {
                var member = db.Members.Find(UserData.ID);
                if (member == null || string.IsNullOrEmpty(member.Email))
                {
                    return RedirectToAction("EditProfile", "TimeLog");
                }
            }
            return RedirectToAction("Index", "TimeLog");
        }

        [HttpPost]
        public ActionResult ReportHours(MCI_TimeLog log)
        {
            if (ModelState.IsValid)
            {
                using (var db = new OtherDbContext())
                {
                    log.UserID = UserData.ID;
                    db.MCI_TimeLogs.Add(log);
                    if (db.SaveChanges() > 0)
                    {
                        return RedirectToAction("Index");
                    }
                }
            }
            return View(log);
        }

        public ActionResult ReportHours()
        {
            var log = new MCI_TimeLog();
            if (string.IsNullOrEmpty(Request.QueryString["date"]))
            {
                return RedirectToAction("Index");
            }

            log.LogDate = Convert.ToDateTime(EncryptDecryptHelper.Decrypt(Request.QueryString["date"],
                               Const.DynamicKey));
            
            return
                View(log);
        }

        public ActionResult EditProfile()
        {
            using (var db = new MemberDbContext())
            {
                return View(db.Members.Find(UserData.ID));
            }
        }
        [HttpPost]
        public ActionResult EditProfile(Member m)
        {
            if (ModelState.IsValid)
            {
                using (var db = new MemberDbContext())
                {

                    db.Entry(m).State = EntityState.Modified;
                    if (db.SaveChanges() > 0)
                    {
                        return RedirectToAction("Index");
                    }
                }
            }
            return View(m);
        }
        public ActionResult EditHour(int id)
        {
            using (var db = new OtherDbContext())
            {
                var item = db.MCI_TimeLogs.Find(id);
                if (item.UserID != UserData.ID
                    || item.IsAuthorized)
                {
                    return RedirectToAction("Index");
                }
                return View("ReportHours", item);
            }
        }
        [HttpPost]
        public ActionResult EditHour(MCI_TimeLog log)
        {
            if (ModelState.IsValid)
            {
                using (var db = new OtherDbContext())
                {
                    var oldLog = db.MCI_TimeLogs.AsNoTracking().FirstOrDefault(t => t.ID == log.ID);
                    if (oldLog.UserID != UserData.ID
                        || oldLog.IsAuthorized)
                    {
                        return RedirectToAction("Index");
                    }
               
                    db.Entry(log).State = EntityState.Modified;
                    log.UserID = UserData.ID;
                    if (db.SaveChanges() > 0)
                    {
                        return RedirectToAction("Index");
                    }
                }
            }
            return View("ReportHours",log);
        }
        public ActionResult Delete(int id)
        {
            using (var db = new OtherDbContext())
            {
                var log = db.MCI_TimeLogs.Find(id);
                if (log.UserID != UserData.ID)
                {
                    return RedirectToAction("Index");
                }
                db.MCI_TimeLogs.Remove(log);
                db.SaveChanges();
                return RedirectToAction("Index");
            }
        }
        public ActionResult Index()
        {
            using (var db = new OtherDbContext())
            {
                var now = DateTime.Now;
                ViewBag.User = db.Members.Find(UserData.ID);
                var currentPeriod =
                    db.MCI_Periods.FirstOrDefault(p => p.FromDate <= now && p.ToDate >= now);
                if (currentPeriod == null)
                {
                    return View("ViewHours");
                }
                ViewBag.CurrentPeriod = currentPeriod;
                return
                    View("ViewHours",
                        db.MCI_TimeLogs.Where(
                            t =>
                                t.UserID == UserData.ID && t.LogDate >= currentPeriod.FromDate &&
                                t.LogDate <= currentPeriod.ToDate)
                            .ToList()
                            .OrderBy(t => t.LogDate));
            }
        }
    }
}
