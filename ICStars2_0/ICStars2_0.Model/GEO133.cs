using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
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
{
    [Table("GEO133", Schema = Const.Schema)]
    public class GEO133
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        [DbField]
        public int Id { get; set; }
         [DbField]
         [Display(Name = "Building Address :")]
     
        [MaxLength(50)]
        
        public string buildingAddress { get; set; }
        
        [DbField]
        [Display(Name = "DePaul ID :")]
        public int? DpuId { get; set; }
       
         [DbField]
       //  [Range(7, 7, ErrorMessage = "Please enter a correct zip code")]
         [Display(Name = " zip Code: ")]
         [RegularExpression("^[0-9]*$", ErrorMessage = "Only numbers are allowed!")]   
         public int? zipCode { get; set; }
         [DbField]
       //  [Range(5, 5, ErrorMessage = "The block number should 5 digits")]
         [RegularExpression("^[0-9]*$", ErrorMessage = "Only numbers are allowed!")]   
         [Display(Name = "Block Number:")]
        
         public int? blockNumber { get; set; }
         [DbField]
        
       //  [Range(14, 14, ErrorMessage = "The PIN should be 14 pin numbers")]
         [RegularExpression("^[0-9]*$", ErrorMessage = "Only numbers are allowed!")]   
         [Display(Name = "PERMANENT INDEX NUMBER (PIN) (14 digit): ")]
         public int? pinNumber { get; set; 
         }
         [DbField]
        
         [MaxLength(50)]
         [Display(Name = " Zoning (e.g. RT-4): ")]
        public string zoning { get; set; }
         [DbField]
         
         [Display(Name = " FAR: ")]
         public double? far { get; set; }

         virtual public GeoSiteData siteData { get; set; }
         virtual public GeoOnlineInformation OnlineInfo { get; set; }

    }
}
