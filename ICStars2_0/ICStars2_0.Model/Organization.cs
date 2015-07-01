using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Web.Mvc;

namespace ICStars2_0.Model
{
   [Table("Organizations", Schema = Const.Schema)]
   public class Organization
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int OrgId { get; set; }
       
        public string Name { get; set; }
      
        public DateTime? DateCreated { get; set; }
       public string Address { get; set; }
        public int SiteId { get; set; }
        public virtual MVPSite Site { get; set; }
    
   }
    

}
