using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;
using Commengdpu.DBLayer;
using Commengdpu.Models.Reports;
using Commengdpu.Models.Settings;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.ReportServices
{
    class ReportFactory:IReportFactory,ISingletonRegister
    {
        [Dependency]
        public IDbProjectType DbProjectType { get; set; }

        [Dependency]
        public IDbProject DbProject { get; set; }

        public IEnumerable<OverrallTotalReportByProjectType> BuildOverrallReportsByProjectType(ReportSettings settings = null)
        {
            return DbProjectType.BuildOverrallReportsByProjectType(settings);
        }

        public OverrallBaseTotalReport BuildOverrallBaseTotalReports(ReportSettings settings = null)
        {
            return DbProject.BuildOverrallBaseTotalReports(settings);
        }
    }
}
