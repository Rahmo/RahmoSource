using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ICStars2_0.Model
{
    public class GeoBuilding
    {
        [Key]
        [ForeignKey("geoAssessedValues")]
        public int AssessedValueID { get; set; }
        public double CurrentYearValue { get; set; }
        public double PreviousYearValue { get; set; }

        public double PastYearsValue { get; set; }
        public double PastYearsValueMinus { get; set; }
        public virtual geoAssessedValues assessedValues { get; set; } 
    }
}
