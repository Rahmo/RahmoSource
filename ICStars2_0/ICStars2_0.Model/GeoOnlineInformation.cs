using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    public class GeoOnlineInformation
    {
        public int ID { get; set; }
        
        public virtual  geoAssessedValues assessedValues { get; set; }
        public virtual GeoTaxTreasuedSite taxTreasuredSite { get; set; }
        public DateTime yearBuilt { get; set; }
        public int censusTract { get; set; }
        public string propertyClass { get; set; }
        public double Stories { get; set; }
        public string LandSquareFootage { get; set; }
        public string propertyDescription { get; set; }

        public int age { get; set; }
        public double PropertyTaxExemptions  { get; set; }
        
        public string taxPayerName { get; set; }
        public string taxpayerMailing { get; set; }
        public DateTime YearPropertyTax  { get; set; }

        public int YearTaxesOwed { get; set; }
        public bool NextYearAsCurrent { get; set; }
        public string TaxPayerInfo { get; set; }
        public bool inTifDistrict { get; set; }
        public string TifArea { get; set; }
        public string BoardOfEducation { get; set; }
        public string SchoolImprovments  { get; set; }
        public string ParkDistrict { get; set; }
        public string LibraryFund { get; set; }
        public bool propertySoldInYear  { get; set; }
        public DateTime saleDate { get; set; }
        public double salePrice  { get; set; }
        public string unitNumber { get; set; }
        public bool isForSale { get; set; }
        public double listedPrice  { get; set; }
        public int bedroomsNumber { get; set; }
        public bool isOrange { get; set; }
        public bool isPhotoDownloaded { get; set; }

        public DateTime PhotoDate { get; set; }
        public bool isFollowingYPhotoTaken { get; set; }
        public DateTime StudentPhotoDate { get; set; }

    
    }
   
}
