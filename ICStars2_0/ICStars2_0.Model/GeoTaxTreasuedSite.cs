using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
   public  class GeoTaxTreasuedSite
    {
        public bool isHomeowner { get; set; }
        public bool isSeniorCitizen   { get; set; }
        public bool isSeniorFreeze { get; set; }
        public virtual GeoOnlineInformation onlineInfo { get; set; }
    }
}
