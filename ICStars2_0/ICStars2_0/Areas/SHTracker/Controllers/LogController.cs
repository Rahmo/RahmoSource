using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    public class LogController : Controller
    {
        //
        // GET: /SHTracker/Log/

        public ActionResult LoginReport()
        {
            using (var db = new OtherDbContext())
            {
                var url = Common.UrlHelper.GetHttpsRoot() + "/SHTracker/";
                return
                    View(
                        db.ShTrackerLogs.Where(s => s.Url.Equals(url))
                            .Join(db.Members, s => s.UserName, m => m.CampusConnectID,
                                (s, m) => new {m.FirstName, m.LastName, m.CampusConnectID})
                            .GroupBy(l => new {l.FirstName, l.LastName, l.CampusConnectID})
                            .Select(
                                r =>
                                    new LoginLogsReport
                                    {
                                        CampusConnectID = r.Key.CampusConnectID,
                                        FirstName = r.Key.FirstName,
                                        LastName = r.Key.LastName,
                                        LoginTimes = r.Count()
                                    })
                            .ToList());
            }
        }
        public ActionResult StudentLoginReport()
        {
            using (var db = new OtherDbContext())
            {
                var url = Common.UrlHelper.GetHttpsRoot() + "/SHTracker/StudentApp/";
                return
                    View("LoginReport",
                        db.ShTrackerLogs.Where(s => s.Url.Equals(url))
                            .Join(db.Members, s => s.UserName, m => m.CampusConnectID,
                                (s, m) => new { m.FirstName, m.LastName, m.CampusConnectID })
                            .GroupBy(l => new { l.FirstName, l.LastName, l.CampusConnectID })
                            .Select(
                                r =>
                                    new LoginLogsReport
                                    {
                                        CampusConnectID = r.Key.CampusConnectID,
                                        FirstName = r.Key.FirstName,
                                        LastName = r.Key.LastName,
                                        LoginTimes = r.Count()
                                    })
                            .ToList());
            }
        }
    }
}
