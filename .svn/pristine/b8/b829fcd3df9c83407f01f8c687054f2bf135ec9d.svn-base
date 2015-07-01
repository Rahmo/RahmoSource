using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using ICStars2_0.Common.Reflection;

namespace ICStars2_0.Model
{

    
    
    #region = ServiceHours =

    [Table("ServiceHours", Schema = Const.Schema)]
    public class ServiceHours
    {

        #region = Properties =

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public int CBO_ID { get; set; }

        public int CourseID { get; set; }

        public int StudentID { get; set; }

        public DateTime ServiceDate { get; set; }

        public double HoursServed { get; set; }

        [DbField(Size = 50)]
        public string ContactType { get; set; }

        [DbField(Size = 1000)]
        public string Notes { get; set; }
        [DbField(Size = 50)]
        public string Quater_Year { get; set; }

        [DbField(Size = 1000)]
        public string EngagementDescription { get; set; }

        public int? MemberID { get; set; }
        public int? LastEditorID { get; set; }
        [NotMapped]
        public string Creator { get; set; }
        [NotMapped]
        public string LastEditor { get; set; }
        #endregion
    }

    #endregion

    
   
            
}
