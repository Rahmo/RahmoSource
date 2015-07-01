using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    [Table("WebsiteNav", Schema = Const.Schema)]
    public class WebsiteNav:ICloneable
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [Required]
        [StringLength(100, MinimumLength = 2)]
        [DisplayName("Nav Name")]
        public string Name { get; set; }

        [Required]
        [StringLength(250, MinimumLength = 2)]
        [DisplayName("Nav Link")]
        public string Link { get; set; }

        [StringLength(100, MinimumLength = 2)]
        [DisplayName("Nav Link Title")]
        public string LinkTitle { get; set; }

        [DisplayName("Open the link in a new window")]
        public bool IsTargetBlank { get; set; }

        [DisplayName("Parent ID of Current Item")]
        public int ParentID { get; set; }

        public int OrderByID { get; set; }
        public bool IsVisible { get; set; }
        [NotMapped]
        public bool HasWebpage { get; set; }
        public object Clone()
        {
            return this.MemberwiseClone();
        }
    }
}
