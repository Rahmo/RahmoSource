using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Commengdpu.Models
{
    [Table("Project2IndividualPartner", Schema = Const.Schema)]
    public class Project2IndividualPartner
    {
        [Key, Column(Order = 1)]
        public int ProjectID { get; set; }
        [Key, Column(Order = 2)]
        public int IndividualPartnerID { get; set; }
        [StringLength(50)]
        [MaxLength(50)]
        public string ProjectRole { get; set; }

        public virtual Project Project { get; set; }
        public virtual IndividualPartner IndividualPartner { get; set; }
    }
}
