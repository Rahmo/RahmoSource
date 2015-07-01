using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using ICStars2_0.Common.Reflection;

namespace ICStars2_0.Model
{

    #region = app_cboprogram =

    [Table("son_cboprogram", Schema = Const.Schema)]
    public class son_cboprogram
    {

        #region = properties =
        [Key]
        public int CPID { get; set; }

        [DbField(Size = 200)]
        public string CBOName { get; set; }

        [DbField(Size = 200)]
        public string ProgramName { get; set; }

        public int Slots { get; set; }
        [NotMapped]
        public int SlotsAvailable { get; set; }

        [DbField(Size = 200)]
        public string Location { get; set; }

        [DbField(Size = 100)]
        public string Bilingual { get; set; }
        [NotMapped]
        public string[] StudentChoice { get; set; }
        [NotMapped]
        public int EnteredChoicesCount { get; set; }
        #endregion

        
        
    }

    #endregion
            
}
