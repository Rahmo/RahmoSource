using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    [Table("MCI_TimeLog", Schema = Const.Schema)]
    public class MCI_TimeLog
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public int UserID { get; set; }
        public double HoursAtSite { get; set; }
        public double Training_Reflection_Hours { get; set; }
        [DisplayFormat(DataFormatString = "{0:MM/dd/yyyy}", ApplyFormatInEditMode = true,NullDisplayText="")]
        public DateTime? LogDate { get; set; }
        [MaxLength(1000)]
        [StringLength(1000)]
        [DataType(DataType.MultilineText)]
        public string Description { get; set; }
        [MaxLength(50)]
        [StringLength(50)]
        public string SupervisorInitials { get; set; }

        public bool IsAuthorized { get; set; }
        [NotMapped]
        public string StudentName { get; set; }
    }
}
