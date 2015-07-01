using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using ICStars2_0.Common.Reflection;

namespace ICStars2_0.Model
{

    #region = Student2CBO =

    [Table("Student2CBO", Schema = Const.Schema)]
    public class Student2CBO
    {
        [Key,Column(Order=1)]
        public int StudentID { get; set; }

        [Key, Column(Order = 2)]
        
        public int CBOID { get; set; }

        public int RequiredHours { get; set; }

        [DbField(Size = 50)]
        public string Quater_Year { get; set; }

        public DateTime? CreateDate { get; set; }
        [NotMapped]
        public string CBOName { get; set; }

        public double? ServedTotalHours { get; set; }
        public virtual CBO CBO { get; set; }
        public virtual Student Student { get; set; }
        public Student2CBO()
        {
            CreateDate = DateTime.Now;
        }
    }

    #endregion
            
}
