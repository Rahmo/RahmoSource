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
    [Table("CommunityPartner", Schema = Const.Schema)]
    public class CommunityPartner
    {
        [Key]

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [Required]
        [StringLength(100)]
        [MaxLength(100)]
        public string Name { get; set; }
        [Required]
        [StringLength(200)]
        [MaxLength(200)]
        [RegularExpression("^[a-zA-z0-9_-]+$", ErrorMessage = "Only letters, numbers, \"-\" and \"_\" are allowed!")]
        [Remote("ValidateUniqueUrl", "CommunityPartner")]
        [DisplayName("Unique Url")]
        public string UniqueUrl { get; set; }
        public int CreatorUserID { get; set; }

        [StringLength(100)]
        [MaxLength(100)]
        public string OrganizationType { get; set; }
        [StringLength(1000)]
        [MaxLength(1000)]
        [DataType(DataType.MultilineText)]
        public string OrganizationStatement { get; set; }


        [MaxLength(500)]
        [StringLength(500)]
        [DataType(DataType.MultilineText)]
        [AllowHtml]
        public string Thumbnail { get; set; }

        [StringLength(50)]
        [MaxLength(50)]
        public string PrimaryContactName { get; set; }

        [StringLength(200)]
        [MaxLength(200)]
        public string PrimaryContactEmail { get; set; }

        [StringLength(50)]
        [MaxLength(50)]
        public string PrimaryContactPhone { get; set; }

        [StringLength(200)]
        [MaxLength(200)]
        public string Website { get; set; }

        [StringLength(200)]
        [MaxLength(200)]
        public string Address { get; set; }

        [StringLength(50)]
        [MaxLength(50)]
        public string City { get; set; }

        [StringLength(50)]
        [MaxLength(50)]
        public string County { get; set; }

        [StringLength(50)]
        [MaxLength(50)]
        public string State { get; set; }

        [StringLength(50)]
        [MaxLength(50)]
        public string Nation { get; set; }

        [StringLength(50)]
        [MaxLength(50)]
        public string ZipCode { get; set; }

        [StringLength(100)]
        [MaxLength(100)]
        public string PopulationServed { get; set; }
        [StringLength(500)]
        [MaxLength(500)]
        [DataType(DataType.MultilineText)]
        public string Mission { get; set; }

        public DateTime CreateDate { get; set; }
        public DateTime LastModifiedDate { get; set; }
        public int? LastEditorUserID { get; set; }
        [NotMapped]
        public string Creator { get; set; }
        [NotMapped]
        public string LastEditor { get; set; }

        public virtual ICollection<Project2CommunityPartner> Project2CommunityPartners { get; set; }
        public virtual ICollection<CommunityPartner2IndividualPartner> CommunityPartner2IndividualPartners { get; set; }
        public CommunityPartner()
        {
            CreateDate = DateTime.Now;
            LastModifiedDate = DateTime.Now;
        }
    }
}
