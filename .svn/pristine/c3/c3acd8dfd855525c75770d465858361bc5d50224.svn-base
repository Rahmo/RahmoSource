using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model
{
    [Table("CBOTask", Schema = Const.Schema)]
    public class CBOTask
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [Required]
        public int CBOID { get; set; }

        public int SLCID { get; set; }
        [Required]
        [MaxLength(200)]
        [StringLength(200)]
        public string Title { get; set; }

        [MaxLength(50)]
        [StringLength(50)]
        [Required]
        [DisplayName("Quarter Year")]
        public string Quarter_Year { get; set; }
        [DataType(DataType.MultilineText)]
        [MaxLength(1000)]
        [StringLength(1000)]
        public string Description { get; set; }

        public int ServSlots { get; set; }
        [MaxLength(200)]
        [StringLength(200)]
        public string ServSchedule { get; set; }

        [MaxLength(1000)]
        [StringLength(1000)]
        [DataType(DataType.MultilineText)]
        public string Orientation { get; set; }

        [MaxLength(200)]
        [StringLength(200)]
        public string ServSiteAddress { get; set; }

        [MaxLength(50)]
        [StringLength(50)]
        public string ServSalutation { get; set; }

        [MaxLength(50)]
        [StringLength(50)]
        public string ServFirstName { get; set; }

        [MaxLength(50)]
        [StringLength(50)]
        public string ServLastname { get; set; }

        [MaxLength(100)]
        [StringLength(100)]
        public string ServPhone { get; set; }

        [MaxLength(100)]
        [StringLength(100)]
        public string ServEmail { get; set; }
        [MaxLength(200)]
        [StringLength(200)]
        public string Website { get; set; }
        public bool Virtus { get; set; }
        public bool BackgroundCheck { get; set; }
        public bool ConfidentialityAgreement { get; set; }
        public bool Fingerprints { get; set; }
        public bool TBTest { get; set; }

        [MaxLength(1000)]
        [StringLength(1000)]
        [DataType(DataType.MultilineText)]
        public string OtherDetails { get; set; }
        [NotMapped]
        public string CBOName { get; set; }
    }
}
