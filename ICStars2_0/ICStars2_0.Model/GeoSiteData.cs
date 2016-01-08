using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    public class GeoSiteData
    {

        public int ID { get; set; }
        public string mainStreetFacade  { get; set; }
        public string exterior  { get; set; }
        public string overallViability { get; set; }
        public int numberOfStories { get; set; }

        public int facadeType { get; set; }
       public bool patchesExposed { get; set; }

       //public bool EvidenceOfActivity { get; set; }
       //public string EvidenceOfGarden { get; set; }

    //   public string MyProperty { get; set; }
            
    }
}
