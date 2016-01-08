using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;
using System.ComponentModel;

namespace ICStars2_0.Model
{
    [Table("MvpResource", Schema = "dbo")]
   public class MvpResource
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ResourceId { get; set; }
        [Required]
        public string Title { get; set; }
          [Required]
          [DisplayName("Resource type")]
        public string ResourceType { get; set; }
       

        [DataType(DataType.MultilineText)]
        [AllowHtml]
        public string Description { get; set; }

         [DisplayName("Date Modified")]
        public DateTime CreatedDate { get; set; }
    }
}
