using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using ICStars2_0.Common.Reflection;

namespace ICStars2_0.Model
{

    
    
    #region = SHTrackerLog =

    [Table("SHTrackerLog", Schema = Const.Schema)]
    public class SHTrackerLog
    {

        #region = Properties =

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [MaxLength(50)]
        [DbField(Size = 50)]
        public string UserName { get; set; }

        [MaxLength(400)]
        [DbField(Size = 400)]
        public string Url { get; set; }

        public DateTime CreateDate { get; set; }

        [MaxLength(100)]
        [DbField(Size = 100)]
        public string IP { get; set; }

        [MaxLength(400)]
        [DbField(Size = 400)]
        public string UrlReferrer { get; set; }

        #endregion

        public SHTrackerLog()
        {
            CreateDate = DateTime.Now;
        }
    }

    #endregion

    
            
}
