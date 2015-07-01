using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Commengdpu.Models
{
    [Table("User2Role", Schema = Const.Schema)]
    public class User2Role
    {

        [Key, Column(Order = 1)]
        public int UserID { get; set; }
        [Key, Column(Order = 2)]
        public int RoleID { get; set; }

        public virtual User User { get; set; }
        public virtual Role Role { get; set; }
    }
}
