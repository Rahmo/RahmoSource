using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models.Reports;
using Commengdpu.Models.Settings;

namespace Commengdpu.BusinessLayer.ReportServices
{
    public interface IReportFactory
    {
        IEnumerable<OverrallTotalReportByProjectType> BuildOverrallReportsByProjectType(ReportSettings settings = null);
        OverrallBaseTotalReport BuildOverrallBaseTotalReports(ReportSettings settings = null);
    }
}
