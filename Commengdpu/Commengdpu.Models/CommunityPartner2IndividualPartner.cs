using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Commengdpu.Models
{
    [Table("CommunityPartner2IndividualPartner", Schema = Const.Schema)]
    public class CommunityPartner2IndividualPartner
    {
        [Key, Column(Order = 1)]
        public int CommunityPartnerID { get; set; }
        [Key, Column(Order = 2)]
        public int IndividualPartnerID { get; set; }

        public virtual CommunityPartner CommunityPartner { get; set; }
        public virtual IndividualPartner IndividualPartner { get; set; }
    }
}
