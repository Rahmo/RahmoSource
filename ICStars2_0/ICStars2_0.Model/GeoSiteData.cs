using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Model.Enum;
namespace ICStars2_0.Model
{ [Table("geoSiteData", Schema = Const.Schema)]
    public class GeoSiteData
    {
        
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [DbField]
        public int Id { get; set; }
        [DbField]
        [Display(Name = "1. Main Street-front Façade (facing the main street)")]
        public string mainStreetFacade  { get; set; }
        [DbField]
        [Display(Name = "2.Exterior (except the main façade): Walls/Doors/Windows")]
        public string exterior  { get; set; }
        [DbField]
        [Display(Name = "3. Overall Viability: ")]
        public string overallViability { get; set; }
        [DbField]
        //[RegularExpression("^[a-zA-z0-9_-]+$", ErrorMessage = "Only letters, numbers, \"-\" and \"_\" are allowed!")]
        [RegularExpression("^[0-9]*$", ErrorMessage = "Only numbers are allowed!")]   
      //  [Required(ErrorMessage = "This field is required.")]
        [Display(Name = "4.Number (#) of Stories :")]
        public int numberOfStories { get; set; }
        [DbField]
        [Display(Name = "5.Façade Type : ")]

        public string facadeType { get; set; }
        [DbField]
        [Display(Name = "6.Are there bare patches of exposed soil on the property? ")]
       public bool patchesExposed { get; set; }
        [DbField]
        [Display(Name = "7. Is there any evidence of a garden or gardening activity on the property?")]
       public bool GardenActivity { get; set; }
        [DbField]
        [Display(Name = "8. If there is evidence of a garden on the property, is it mainly:")]
      public string EvidenceOfGardenType { get; set; }
        [DbField]
        [Display(Name = "9. Signs posted on building")]
      public string SignPostedOnBuilding { get; set; }
        [DbField]
        [Display(Name = "1st Use")]
      public string FirstUse { get; set; }
        [DbField]
        [Display(Name = "2nd Use")]
      public string SecondUse { get; set; }
        [DbField]
        [Display(Name = "3rd Use")]
      public string ThirdUse { get; set; }
        [DbField]
        [Display(Name = "4th Use")]
      public string FourthUse { get; set; }
        [DbField]
        [Display(Name = "back/rear Use")]
      public string BackRearUse { get; set; }
        [DbField]
        [Display(Name = "1st Occupancy")]
      public string FirstOccupancy { get; set; }
        [DbField]
        [Display(Name = "2nd Occupancy")]
      public string SecondOccupancy { get; set; }
        [DbField]
        [Display(Name = "3rd Occupancy")]
      public string ThirdOccupancy { get; set; }
        [DbField]
        [Display(Name = "4th Occupancy")]
      public string FourthOccupancy { get; set; }
        [DbField]
        [Display(Name = "Back/Rear Occupancy")]
      public string BackRearOccupancy { get; set; }
        [DbField]
        [Display(Name = "11. Structure classification: ")]
      public string StructureClassification { get; set; }
    //   public string MyProperty { get; set; }
            
    }
}
