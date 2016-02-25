using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Model.Enum;

namespace ICStars2_0.Model
{  [Table("geoOnlineInformation", Schema = Const.Schema)]
    public class GeoOnlineInformation
    {
        private string NA = "N/A"; 

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [DbField]
        public int Id { get; set; }
        
        //public virtual  geoAssessedValues assessedValues { get; set; }
        
        //public virtual GeoTaxTreasuedSite taxTreasuredSite { get; set; }
         //[DbField]
         [Display(Name = "13. Year Built (from newschicago.org):")]
        


        //[DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:MM.yy}")]
       // [Required(ErrorMessage = "This field is required.")]
        public DateTime? yearBuild { get; set; }
    [DbField]
  // [RegularExpression("^[0-9]*$", ErrorMessage = "Only numbers are allowed!")]  
  //  [Required(ErrorMessage = "This field is required.")]
    [Display(Name = "14. Census Tract:")]
    
   // [Range(4,4)]
         public string censusTract { get; set; }
 
    
    [DbField]
    [Display(Name = "15 Property Class:")]
    public string propertyClass { get; set; }
    [DbField]
 //   [Required(ErrorMessage = "This field is required.")]
   // [Range(0, 10, ErrorMessage= "Please enter the stories.")]
    [RegularExpression("^[0-9]*$", ErrorMessage = "Only numbers are allowed!")]  
    [Display(Name = "16. Stories : ")]
    public int? Stories { get; set; }

    [DbField]
    [Display(Name="17.Buidling sq. Footage")]
    public string BuildingSquareFootage { get; set; }

    [DbField]
    [Display(Name = "18.Land Sq. Footage: ")]
        public string LandSquareFootage { get; set; }
  
    [DbField]
    [Display(Name = "19. Property Description:")]
        public string propertyDescription { get; set; }

    [DbField] [Display(Name = "20. Age: ")]
        // [RegularExpression("^[0-9]*$", ErrorMessage = "Only numbers are allowed!")] 
        //[MaxLength(3, ErrorMessage="Max length is 3 digits")]
        //[Range(0, 3 , ErrorMessage="Max length is 3 digits")]
        [DefaultValue("N/A")]
        public string age  { get; set; }
        [DefaultValue(0)]
        [DbField]
    [Display(Name = "21. Property Tax Exemptions (Assessor site): ")]
    public double? PropertyTaxExemptions { get; set; }
   
    [DbField]
    [Display(Name = "In 2014 the Property Tax Exemption was:   ")]
    public string TaxExemptionsStatus { get; set; }
    [DbField]
        [Display(Name = "23. What is the 2014 property taxpayer’s name? ")]

        public string taxPayerName { get; set; }
    [DbField]
    [Display(Name = "24. What is the 2014 taxpayer’s mailing address?")]
        public string taxpayerMailing { get; set; }
    [DbField]

    [Display(Name = "25. What is the 2014 property tax (add 1st and 2nd installments")]
        public string PreviousYearPropertyTax  { get; set; }
    [DbField]

    
    [Display(Name = "26. What amount of 2014 taxes are still owed (balance due)?")]
    public double? CurrentYearTaxesOwed { get; set; }
    [DbField]
    [Display(Name = "27.Is the 2015 property taxpayer’s name and address the same as 2014?")]
        public bool isCurrentYearAsPrev { get; set; }
    [DbField]
    [Display(Name = "What is the 2015 taxpayer’s name and address (Informations)")]
        public string TaxPayerInfo { get; set; }
    //tax payer address
    [DbField]
    [Display(Name = "28. Was this property in a TIF district in 2014?")]
        public bool isInTifDistrict { get; set; }
    [DbField]
   // [DataType(DataType.Currency, ErrorMessage = "Only percentage values allowed")]
    [Display(Name = "29. TIF-City of Chicago Pilsen Area:")]
        public double? TifArea { get; set; }
    [DbField]
  //  [DataType(DataType.Currency, ErrorMessage = "Only percentage values allowed")]
    [Display(Name = "30. Board of Education: ")]
        public double? BoardOfEducation { get; set; }
    [DbField]
  //  [DataType(DataType.Currency, ErrorMessage = "Only percentage values allowed")]
    [Display(Name = "31. City of Chicago School Building and Improvement:")]
        public double? SchoolImprovments  { get; set; }
    [DbField]
   // [DataType(DataType.Currency, ErrorMessage = "Only percentage values allowed")]
    [Display(Name = "32. City of Chicago Park District:")]
        public double? ParkDistrict { get; set; }
    [DbField]
   // [DataType(DataType.Currency, ErrorMessage = "Only percentage values allowed")]
    [Display(Name = "33. City of Chicago Library Fund:")]
        public double? LibraryFund { get; set; }
    [DbField]
    [Display(Name = "34. Was the property sold in 2015?")]
        public bool isPropertySoldInCurrentYear  { get; set; }
    [DbField]
   
    [Display(Name = "35. What was the sale date of the property?")]
       // [Required(ErrorMessage = "This field is required.")]
        public DateTime? saleDate { get; set; }
    [DbField]
    //[DataType(DataType.Currency, ErrorMessage = "Only percentage values allowed")]
    [Display(Name = "36. What was the sale price of the property?")]
    public double? salePrice { get; set; }
    [DbField]
    
   // [Required(ErrorMessage="This field is required.")]
      //  [MaxLength(3000)]
        
      //  [StringLength(3000)]
       // [DataType(DataType.)]

        [Display(Name = "37. If it was a condominium unit, what was the unit number?")]
        public string unitNumber { get; set; }
    [DbField]
    [Display(Name = "38. Is property currently for sale?")]
        public bool isForSale { get; set; }
    [DbField]
    [Display(Name = "39. What is the listed price  ?")]
    public double? listedPrice { get; set; }
    [DbField]
    [Display(Name = "40. How many bedrooms ?")]
    [RegularExpression("^[0-9]*$", ErrorMessage = "Only numbers are allowed!")] 
   // [Range(0, 3, ErrorMessage = "Please enter the bedrooms number")]
   // [RegularExpression("^[0-9]*$", ErrorMessage = "Only numbers are allowed!")] 
    public int? bedroomsNumber { get; set; }
    [DbField]
    [Display(Name = "41. Is the building rated as Orange:")]
        public bool isOrange { get; set; }
    [DbField]
    [Display(Name = "42. Assessor’s Office photo downloaded")]
        public string isPhotoDownloaded { get; set; }
    [DbField]
 
    [Display(Name = "43. Assessor’s Office photo date ")]
       // [Required(ErrorMessage = "This field is required.")]

        public DateTime? PhotoDate { get; set; }
    [DbField]
    [Display(Name = "44. your photo taken ?")]
        public bool isFollowingYPhotoTaken { get; set; }
    [DbField]
      

    [Display(Name = "45 Your Photo Date")]
     //   [Required(ErrorMessage = "This field is required.")]
        public DateTime? StudentPhotoDate { get; set; }
    [DbField]
    [Display(Name = "")]
       public string AssessedValuesLand__ { get; set; }
    [DbField]
    [Display(Name = "")]
    public string AssessedValuesLand_ { get; set; }
    [DbField]
    [Display(Name = "")]
  
    public string AssessedValuesLand { get; set; }
     [DbField]
     [Display(Name = "")]
    public string AssessedValuesLandPlus { get; set; }
     [DbField]
     [Display(Name = "")]
    public string AssessedValuesBuilding__ { get; set; }
     [DbField]
     [Display(Name = "")]
     public string AssessedValuesBuilding_ { get; set; }
    [DbField]
    [Display(Name = "")]
     public string AssessedValuesBuilding { get; set; }
    [DbField]
    [Display(Name = "")]
    public string AssessedValuesBuildingPlus { get; set; }
    [DbField]
    [Display(Name = "")]
    public string AssessedValuesTotal__ { get; set; }
    [DbField]
    [Display(Name = "")]
    public string AssessedValuesTotal_ { get; set; }
    [DbField]
    [Display(Name = "")]
    public string AssessedValuesTotal { get; set; }
    [DbField]
    [Display(Name = "")]
    public string AssessedValuesTotalPlus { get; set; }
    [DbField]
    [Display(Name = "")]
    public string AssessedValuesEstMkt { get; set; }
    [DbField]
    public string AssessedValuesEstMktPlus { get; set; }
   [DbField]
   [Display(Name = "Homeowner")]
    public bool TreasurerSiteHomeowner { get; set; }
     [DbField]
     [Display(Name = "Senior Citizen")]
    public bool TreasurerSeniorCitizen { get; set; }
     [DbField]
     [Display(Name = "Senior Freeze")]
    public bool TreasurerSiteSeniorFreeze { get; set; }

    //public   GeoOnlineInformation()
    //{
    //    age = "N/a";
    //}
    }



}
