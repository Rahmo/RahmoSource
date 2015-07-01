using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    [Table("Category", Schema = Const.Schema)]
    public class Category
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [Required]
        [MaxLength(100)]
        [StringLength(100)]
        public string Name { get; set; }
        public int ParentID { get; set; }
    }
}
