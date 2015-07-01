using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace ICStars2_0.Model
{
       [Table("MVPSites", Schema = Const.Schema)]
    public class MVPSite
{
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SiteId { get; set; }

    
        public string SiteName { get; set; }


        [Required]
        [DataType(DataType.MultilineText)]
        [AllowHtml]
        public string SiteBrief { get; set; }

        public DateTime? ProjectStarts { get; set; }
       
        public string Coordinator { get; set; }

   
        public string SiteLocation { get; set; }
    
        public string Author { get; set; }

        public virtual ICollection<Organization> Organizations { get; set; }
        //This to reference to the other side of the relation
     
}

}