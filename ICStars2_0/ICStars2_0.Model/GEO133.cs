using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    public class GEO133
    {

        public int ID { get; set; }
        public string buildingAddress { get; set; }
        public int zipCode { get; set; }
        public int blockNumber { get; set; }

        public int pinNumber { get; set; }

        public string zoning { get; set; }

        public double far { get; set; }

        public GeoSiteData siteData { get; set; }
        public GeoOnlineInformation OnlineInfo { get; set; }

    }
}
