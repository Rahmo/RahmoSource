using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Commengdpu.Models
{
    [Table("Project2Category", Schema = Const.Schema)]
    public class Project2Category
    {

        [Key, Column(Order = 1)]
        public int ProjectID { get; set; }
        [Key, Column(Order = 2)]
        public int CategoryID { get; set; }

        public int? ImpactAmount { get; set; }

        public virtual Project Project { get; set; }
        public virtual Category Category { get; set; }
    }
}
