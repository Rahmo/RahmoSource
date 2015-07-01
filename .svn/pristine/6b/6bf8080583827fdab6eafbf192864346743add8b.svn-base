using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.Reports;
using Commengdpu.Models.Settings;

namespace Commengdpu.DBLayer
{
    public interface IDbProjectType
    {
        IEnumerable<ProjectType> List();
        IEnumerable<OverrallTotalReportByProjectType> BuildOverrallReportsByProjectType(ReportSettings settings = null);
    }
}
