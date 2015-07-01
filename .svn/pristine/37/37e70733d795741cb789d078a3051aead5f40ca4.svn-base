using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.CBOServices;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Model.Settings;
using ICStars2_0.Mvc.Filter;
using log4net;
using log4net.Repository.Hierarchy;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    [MvcAuthorize(Roles = "admin,admin_cbo,Staff,CSSP")]
    public class CBOTaskController : Controller
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(CBOTaskController));
        //
        // GET: /SHTracker/CBOTask/

        [Dependency]
        public IUserData UserData { get; set; }

        [Dependency]
        public IMemberFactory MemberFactory { get; set; }
        public ActionResult Add()
        {
            ViewBag.SLCList =
                    new[]
                              {
                                  new SelectListItem
                                      {
                                          Text = "No SLC",
                                          Value = "0",
                                          Selected = true
                                      }
                              }.Union(MemberFactory.CreateSLCCollection(1, 1000).Where(s => s.Status)
                                 .OrderBy(m => m.CampusConnectID)
                                 .Select(m => new SelectListItem { Text = string.Format("{0}[{1} {2}]",m.CampusConnectID,m.FirstName,m.LastName), Value = m.ID.ToString() }));

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
                }.Union(db.Cbos.ToList().OrderBy(c=>c.Name).Select(c => new SelectListItem() {Text = c.Name, Value = c.ID.ToString()}));
                
                return View(new CBOTask());
            }
        }
        [HttpPost]
        public ActionResult Add(CBOTask task)
        {
            if (ModelState.IsValid)
            {
                using (var db = new SHTrackerDbContext())
                {
                    db.CboTasks.Add(task);
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            
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
                    ModelState.AddModelError("Title", "System Error! Please Try it again.");

                }
            }
            return View(task);
        }
        public ActionResult Edit(int id)
        {
            ViewBag.SLCList =
                    new[]
                              {
                                  new SelectListItem
                                      {
                                          Text = "NO SLC",
                                          Value = "0",
                                          Selected = true
                                      }
                              }.Union(MemberFactory.CreateSLCCollection(1, 1000).Where(s => s.Status)
                                 .OrderBy(m => m.CampusConnectID)
                                 .Select(m => new SelectListItem { Text = string.Format("{0}[{1} {2}]", m.CampusConnectID, m.FirstName, m.LastName), Value = m.ID.ToString() }));

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
                }.Union(db.Cbos.ToList().Select(c => new SelectListItem() { Text = c.Name, Value = c.ID.ToString() }));
                
                return View("Add",db.CboTasks.First(n => n.ID == id));
            }
        }
        [HttpPost]
        public ActionResult Edit(CBOTask task)
        {
            if (ModelState.IsValid)
            {
                using (var db = new SHTrackerDbContext())
                {
                    db.Entry(task).State = EntityState.Modified;
                    try
                    {
                        if (db.SaveChanges() > 0)
                        {
                            
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
                    ModelState.AddModelError("Title", "System Error! Please Try it again.");
                }
            }
            return View("Add", task);
        }

        public ActionResult List(int page = 1)
        {
            using (var db = new SHTrackerDbContext())
            {
                IEnumerable<CBOTask> list = UserData.QuarterYears !=null ? db.CboTasks.Where(t => UserData.QuarterYears.Contains(t.Quarter_Year)) : db.CboTasks.Where(t => t.Quarter_Year.Equals(UserData.QuarterYear));

                return View(list.Join(db.Cbos, t => t.CBOID, c => c.ID, (t, c) => new { t, c.Name }).ToList().Select(t =>
                    {
                        t.t.CBOName = t.Name;
                        return t.t;
                    }));
            }
        }
        public ActionResult Delete(int id)
        {
            using (var db = new SHTrackerDbContext())
            {
                var task = new CBOTask {ID = id};
                db.Entry(task).State = EntityState.Deleted;

                db.SaveChanges();
                return RedirectToAction("List");
            }
        }

    }
}
