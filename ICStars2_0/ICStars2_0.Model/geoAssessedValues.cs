using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    public class geoAssessedValues
    {
        public int ID { get; set; }
        public virtual GeoLand land { get; set; }
        public virtual GeoBuilding building { get; set; }

        public virtual GeoTotal total { get; set; }
        public virtual GeoMarketValue marketValue { get; set; }
        public virtual GeoOnlineInformation onlineInfo { get; set; }
 
    }
   
}
