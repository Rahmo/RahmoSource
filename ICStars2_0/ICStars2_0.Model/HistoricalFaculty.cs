using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace ICStars2_0.Model
{
    [Table("HistoricalFaculty", Schema = Const.Schema)]
    public class HistoricalFaculty
    {
        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [MaxLength(20)]
        public string EmpId { get; set; }
        [Required]
        [MaxLength(50)]
        public string FirstName { get; set; }

        [Required]
        [MaxLength(50)]
        [Remote("ValidateFaculty", "Course", AdditionalFields = "FirstName,ID")]
        public string LastName { get; set; }
        [MaxLength(250)]
        public string Email { get; set; }
    }
}
