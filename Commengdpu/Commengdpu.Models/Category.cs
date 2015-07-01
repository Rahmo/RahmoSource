using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace Commengdpu.Models
{
    [Table("Category", Schema = Const.Schema)]
    public class Category
    {

        [Key]

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public int ParentID { get; set; }
        public int? OrderByID { get; set; }
        [StringLength(100)]
        [MaxLength(100)]
        [Required]
        [RegularExpression("^[^\\|]+$", ErrorMessage = "DO NOT use '|' in Name!")]
        [Remote("ValidateName","Category",AdditionalFields="ID")]
        public string Name { get; set; }

        public virtual ICollection<Project2Category> Project2Categories { get; set; }

        public Category()
        {
            OrderByID = 0;
        }
    }
}
