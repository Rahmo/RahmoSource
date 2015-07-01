using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using ICStars2_0.Common.Reflection;

namespace ICStars2_0.Model
{
    #region = app_student =

    [Table("son_student", Schema = Const.Schema)]
    public class son_student
    {

        #region = properties =
        [Key]
        public int StudentID { get; set; }

        [DbField(Size = 100)]
        public string Name { get; set; }

        [DbField(Size = 50)]
        public string ClassSection { get; set; }

        [DbField(Size = 100)]
        public string Languages { get; set; }

        [DbField(Size = 200)]
        public string Address { get; set; }

        [DbField(Size = 50)]
        public string City { get; set; }

        [DbField(Size = 50)]
        public string Zipcode { get; set; }


        [DisplayName("Selection1")]
        public int CPID1 { get; set; }
        public bool Placement1 { get; set; }

        [DisplayName("Selection2")]
        public int CPID2 { get; set; }
        public bool Placement2 { get; set; }

        [DisplayName("Selection3")]
        public int CPID3 { get; set; }
        public bool Placement3 { get; set; }

        [DisplayName("Selection1")]
        [NotMapped]
        public string CPName1 { get; set; }
        [DisplayName("Selection2")]
        [NotMapped]
        public string CPName2 { get; set; }
        [DisplayName("Selection3")]
        [NotMapped]
        public string CPName3 { get; set; }

        #endregion
        
    }

    #endregion
            
}
