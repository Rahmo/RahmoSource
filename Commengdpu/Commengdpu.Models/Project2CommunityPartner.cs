using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Commengdpu.Models
{
    [Table("Project2CommunityPartner", Schema = Const.Schema)]
    public class Project2CommunityPartner
    {
        [Key, Column(Order = 1)]
        public int ProjectID { get; set; }
        [Key, Column(Order = 2)]
        public int CommunityPartnerID { get; set; }

        [StringLength(100)]
        [MaxLength(100)]
        public string PartnershipType { get; set; }

        public virtual Project Project { get; set; }
        public virtual CommunityPartner CommunityPartner { get; set; }
    }
}
