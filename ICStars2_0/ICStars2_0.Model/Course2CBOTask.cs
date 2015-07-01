using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    [Table("Course2CBOTask", Schema = Const.Schema)]
    public class Course2CBOTask
    {
        [Key, Column(Order = 1)]
        public int CourseID { get; set; }
        [Key, Column(Order = 2)]
        public int CBOTaskID { get; set; }
    }
}
