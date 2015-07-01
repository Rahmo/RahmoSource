using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    [Table("Student2Program", Schema = Const.Schema)]
    public class Student2Program
    {
        [Key, Column(Order = 1)]
        public int StudentID { get; set; }

        [Key, Column(Order = 2)]

        public int ProgramID { get; set; }

        public virtual Program Program { get; set; }
        public virtual Student Student { get; set; }
    }
}
