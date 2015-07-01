using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using ICStars2_0.Common.Reflection;

namespace ICStars2_0.Model
{






    #region = CBO =

    [Table("CBO", Schema = Const.Schema)]
    public class CBO
    {

        #region = 属性 =


        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [DbField(Size = 200)]
        [MaxLength(200)]
        [StringLength(200)]
        [Required]
        public string Name { get; set; }

        #region =SLC=

        [DbField(Size = 100)]
        [MaxLength(100)]
        [StringLength(100)]
        public string SLC { get; set; }
        [NotMapped]
        public string SLC_Email { get; set; }
        [NotMapped]
        public string SLC_Phone { get; set; }
        [NotMapped]
        public string SLC_OfficeHours { get; set; }
        #endregion
        [MaxLength(50)]
        [StringLength(50)]
        public string ContactFristName { get; set; }
        [MaxLength(50)]
        [StringLength(50)]
        public string ContactLastName { get; set; }
        [MaxLength(250)]
        [StringLength(250)]
        public string ContactEmail { get; set; }
        [MaxLength(250)]
        [StringLength(250)]
        public string ContactPhone { get; set; }
        [MaxLength(250)]
        [StringLength(250)]
        public string Address { get; set; }
        [MaxLength(1000)]
        [StringLength(1000)]
        [DataType(DataType.MultilineText)]
        public string Mission { get; set; }
        
        public virtual ICollection<Student2CBO> Student2Cbos { get; set; }
        #endregion

    }

    #endregion






}
