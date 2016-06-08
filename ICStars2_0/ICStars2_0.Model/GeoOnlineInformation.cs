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
using System.Web.Mvc;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Model.Enum;

namespace ICStars2_0.Model
////some tables require dbo schema that s good for testing server
{
    [Table("geoOnlineInformation",Schema = "dbo")]
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

       // [DisplayFormat(DataFormatString = "{0:yyyy-MM}", ApplyFormatInEditMode = true)]
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
    
       // public string taxpayerMailing { get; set; }
        [DbField]
        [Display(Name = "24. What is the taxpayer’s street number?")]
        public string taxpayerStreetNumber { get; set; }
        [DbField]
        [Display(Name = "What is the taxpayer’s street name?")]

        public string taxpayerStreetName { get; set; }
        [DbField]
        [Display(Name = "What is the taxpayer’s city?")]
        public string taxpayerCity { get; set; }
        [DbField]
        [Display(Name = "What is the taxpayer’s state?")]
        public string taxpayerstate { get; set; }
        [DbField]
        [Display(Name = "What is the taxpayer’s Zipcode?")]
        public string taxpayerZip { get; set; }

        [DbField]
    [Display(Name = "25. What is the 2014 property tax (add 1st and 2nd installments")]
        public string PreviousYearPropertyTax  { get; set; }
    [DbField]

    
    [Display(Name = "26. What amount of 2014 taxes are still owed (balance due)?")]
    public double? CurrentYearTaxesOwed { get; set; }
    [DbField]
    [Display(Name = "27.Is the 2015 property taxpayer’s name and address the same as 2014?")]
        public bool isCurrentYearAsPrev { get; set; }
        //[DbField]
        //[Display(Name = "What is the 2015 taxpayer’s name and address (Informations)")]
        //    public string TaxPayerInfo { get; set; }
        [DbField]
        [Display(Name = "24. What is the current taxpayer’s name?")]
        public string CurrentYrTaxPayerName { get; set; }
        [DbField]
        [Display(Name = " What is the current taxpayer’s street number?")]
        public string CurrentYrTaxpayerStreetNumber { get; set; }
        [DbField]
        [Display(Name = " What is the current taxpayer’s street name?")]

        public string CurrentYrtaxpayerStreetName { get; set; }
        [DbField]
        [Display(Name = " What is the current taxpayer’s city?")]
        public string CurrentYrtaxpayerCity { get; set; }
        [DbField]
        [Display(Name = " What is the current taxpayer’s state?")]
        public string CurrentYrtaxpayerstate { get; set; }
        [DbField]
        [Display(Name = " What is the current taxpayer’s Zipcode?")]
        public string CurrentYrtaxpayerZip { get; set; }
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

        public static List<SelectListItem> States = new List<SelectListItem>()
    {
         
            new SelectListItem() {   Selected = true, Text = "", Value = "" },
            new SelectListItem() {Text="Alabama", Value="AL"},
        new SelectListItem() { Text="Alaska", Value="AK"},
        new SelectListItem() { Text="Arizona", Value="AZ"},
        new SelectListItem() { Text="Arkansas", Value="AR"},
        new SelectListItem() { Text="California", Value="CA"},
        new SelectListItem() { Text="Colorado", Value="CO"},
        new SelectListItem() { Text="Connecticut", Value="CT"},
        new SelectListItem() { Text="District of Columbia", Value="DC"},
        new SelectListItem() { Text="Delaware", Value="DE"},
        new SelectListItem() { Text="Florida", Value="FL"},
        new SelectListItem() { Text="Georgia", Value="GA"},
        new SelectListItem() { Text="Hawaii", Value="HI"},
        new SelectListItem() { Text="Idaho", Value="ID"},
        new SelectListItem() { Text="Illinois", Value="IL"},
        new SelectListItem() { Text="Indiana", Value="IN"},
        new SelectListItem() { Text="Iowa", Value="IA"},
        new SelectListItem() { Text="Kansas", Value="KS"},
        new SelectListItem() { Text="Kentucky", Value="KY"},
        new SelectListItem() { Text="Louisiana", Value="LA"},
        new SelectListItem() { Text="Maine", Value="ME"},
        new SelectListItem() { Text="Maryland", Value="MD"},
        new SelectListItem() { Text="Massachusetts", Value="MA"},
        new SelectListItem() { Text="Michigan", Value="MI"},
        new SelectListItem() { Text="Minnesota", Value="MN"},
        new SelectListItem() { Text="Mississippi", Value="MS"},
        new SelectListItem() { Text="Missouri", Value="MO"},
        new SelectListItem() { Text="Montana", Value="MT"},
        new SelectListItem() { Text="Nebraska", Value="NE"},
        new SelectListItem() { Text="Nevada", Value="NV"},
        new SelectListItem() { Text="New Hampshire", Value="NH"},
        new SelectListItem() { Text="New Jersey", Value="NJ"},
        new SelectListItem() { Text="New Mexico", Value="NM"},
        new SelectListItem() { Text="New York", Value="NY"},
        new SelectListItem() { Text="North Carolina", Value="NC"},
        new SelectListItem() { Text="North Dakota", Value="ND"},
        new SelectListItem() { Text="Ohio", Value="OH"},
        new SelectListItem() { Text="Oklahoma", Value="OK"},
        new SelectListItem() { Text="Oregon", Value="OR"},
        new SelectListItem() { Text="Pennsylvania", Value="PA"},
        new SelectListItem() { Text="Rhode Island", Value="RI"},
        new SelectListItem() { Text="South Carolina", Value="SC"},
        new SelectListItem() { Text="South Dakota", Value="SD"},
        new SelectListItem() { Text="Tennessee", Value="TN"},
        new SelectListItem() { Text="Texas", Value="TX"},
        new SelectListItem() { Text="Utah", Value="UT"},
        new SelectListItem() { Text="Vermont", Value="VT"},
        new SelectListItem() { Text="Virginia", Value="VA"},
        new SelectListItem() { Text="Washington", Value="WA"},
        new SelectListItem() { Text="West Virginia", Value="WV"},
        new SelectListItem() { Text="Wisconsin", Value="WI"},
        new SelectListItem() { Text="Wyoming", Value="WY"}
    };
    }



}


