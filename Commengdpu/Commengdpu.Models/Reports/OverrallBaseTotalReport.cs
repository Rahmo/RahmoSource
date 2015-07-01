using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Commengdpu.Models.Reports
{
    public class OverrallBaseTotalReport
    {
        public int? EstimatedNumberofIndividualsServed { get; set; }
        public int? NumberofStudentsSupportedByCNSC { get; set; }
        public int? NumberofStudentsServedAtLeast20HoursPerTerm { get; set; }
    }
}
