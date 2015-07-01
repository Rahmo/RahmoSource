using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Commengdpu.BusinessLayer.Authentication;
using Commengdpu.BusinessLayer.ProjectServices;
using Commengdpu.BusinessLayer.ProjectTypeServices;
using Commengdpu.BusinessLayer.ReportServices;
using Commengdpu.Models;
using Commengdpu.Models.Settings;
using Microsoft.Practices.Unity;

namespace Commengdpu.Areas.Admin.Controllers
{
    [AdminAuthorize(Roles = "admin,admin_report")]
    public class ReportController : Controller
    {
        //
        // GET: /Admin/Report/

        [Dependency]
        public IReportFactory ReportFactory { get; set; }

        public ActionResult OverrallTotal()
        {
            ViewBag.OverrallTotalBaseReport = ReportFactory.BuildOverrallBaseTotalReports();
            return View(ReportFactory.BuildOverrallReportsByProjectType());
        }
        [HttpPost]
        public ActionResult OverrallTotal(DateTime? startDate,DateTime? endDate)
        {
            ReportSettings settings = null;
            if (startDate != null || endDate != null)
            {
                settings = new ReportSettings {StartDate = startDate??DateTime.MinValue, EndDate = endDate??DateTime.MaxValue};
            }
            ViewBag.OverrallTotalBaseReport = ReportFactory.BuildOverrallBaseTotalReports(settings);
            return View(ReportFactory.BuildOverrallReportsByProjectType(settings));
        }
    }
}
