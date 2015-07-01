using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    [Table("ProjectRequestForm", Schema = Const.Schema)]
    public class ProjectRequestForm
    {

        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [Required]
        [StringLength(200,MinimumLength=2)]
        [DisplayName("Project Title")]
        public string Title { get; set; }
        [Required]
        [StringLength(100, MinimumLength = 2)]
        [DisplayName("Contact Name")]
        public string ContactName { get; set; }
        [MaxLength(100)]
        public string Program { get; set; }
        [DisplayName("Date Needed")]
        public DateTime DateNeeded { get; set; }

        [StringLength(200, MinimumLength = 2)]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }

        [StringLength(50, MinimumLength = 2)]
        public string Phone { get; set; }

        public bool IsTechnology { get; set; }
        public bool IsDesign { get; set; }

        [StringLength(1000, MinimumLength = 2)]
        [DataType(DataType.MultilineText)]
        public string Technology { get; set; }

        [StringLength(1000, MinimumLength = 2)]
        [DataType(DataType.MultilineText)]
        public string Design { get; set; }
        public DateTime CreateDate { get; set; }
        public ProjectRequestForm()
        {
            CreateDate = DateTime.Now;
        }
    }

}
