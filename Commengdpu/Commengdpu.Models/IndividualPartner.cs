using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace Commengdpu.Models
{

    [Table("IndividualPartner", Schema = Const.Schema)]
    public class IndividualPartner
    {

        [Key]

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [Required]
        [StringLength(100)]
        [MaxLength(100)]
        public string FirstName { get; set; }

        [Required]
        [StringLength(100)]
        [MaxLength(100)]
        public string LastName { get; set; }

        [Required]
        [StringLength(200)]
        [MaxLength(200)]
        [RegularExpression("^[a-zA-z0-9_-]+$", ErrorMessage = "Only letters, numbers, \"-\" and \"_\" are allowed!")]
        [Remote("ValidateUniqueUrl", "IndividualPartner")]
        [DisplayName("Unique Url")]
        public string UniqueUrl { get; set; }
        public int CreatorUserID { get; set; }

        [Required]
        [StringLength(15)]
        [MaxLength(15)]
        public string DPUID { get; set; }

        //[StringLength(100)]
        //[MaxLength(100)]
        //public string Title_Position { get; set; }

        [MaxLength(500)]
        [StringLength(500)]
        [DataType(DataType.MultilineText)]
        [AllowHtml]
        public string Thumbnail { get; set; }

        [StringLength(200)]
        [MaxLength(200)]
        public string Email { get; set; }

        [StringLength(50)]
        [MaxLength(50)]
        public string Phone { get; set; }

        //[StringLength(200)]
        //[MaxLength(200)]
        //public string Expertise_Scholarship { get; set; }

        [StringLength(1000)]
        [MaxLength(1000)]
        [DataType(DataType.MultilineText)]
        public string PersonalStatement { get; set; }

        public DateTime CreateDate { get; set; }
        public DateTime LastModifiedDate { get; set; }
        public int? LastEditorUserID { get; set; }
        [NotMapped]
        public string LastEditor { get; set; }
        [NotMapped]
        public string Creator { get; set; }
        public virtual ICollection<Project2IndividualPartner> Project2IndividualPartners { get; set; }
        public virtual ICollection<CommunityPartner2IndividualPartner> CommunityPartner2IndividualPartners { get; set; }
        public IndividualPartner()
        {
            CreateDate = DateTime.Now;
            LastModifiedDate = DateTime.Now;
        }
    }
}
