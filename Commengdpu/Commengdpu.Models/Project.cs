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
    [Table("Project", Schema = Const.Schema)]
    public class Project
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
        [Remote("ValidateProjectUniqueUrl", "Project")]
        [DisplayName("Project Unique Url")]
        public string ProjectUniqueUrl { get; set; }
        public int CreatorUserID { get; set; }
        [StringLength(1000)]
        [MaxLength(1000)]
        [DataType(DataType.MultilineText)]
        [AllowHtml]
        public string Description { get; set; }

        [MaxLength(500)]
        [StringLength(500)]
        [DataType(DataType.MultilineText)]
        [AllowHtml]
        public string Thumbnail { get; set; }

        [StringLength(50)]
        [MaxLength(50)]
        [DisplayName("Primary Contact Name")]
        public string PrimaryContactName { get; set; }

        [StringLength(200)]
        [MaxLength(200)]
        [DisplayName("Primary Contact Email")]
        public string PrimaryContactEmail { get; set; }

        [StringLength(50)]
        [MaxLength(50)]
        [DisplayName("Primary Contact Phone")]
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

        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }



        [DisplayName("Estimated # of Individuals Served")]
        public int? EstimatedNumberofIndividualsServed { get; set; }

        [DisplayName("# of Students Supported by A CNCS Program")]
        public int? NumberofStudentsSupportedByCNSC { get; set; }
        [DisplayName("The # of Students Who Engaged in at Least 20 Hours of Any Kind  of Community Service Per Academic Term")]
        public int? NumberofStudentsServedAtLeast20HoursPerTerm { get; set; }
        public DateTime? CreateDate { get; set; }
        public DateTime? LastModifiedDate { get; set; }
        public int? LastEditorUserID { get; set; }
        [NotMapped]
        public string Creator { get; set; }
        [NotMapped]
        public string LastEditor { get; set; }

        public virtual ICollection<Project2Type> Project2Types { get; set; }
        public virtual ICollection<Project2Category> Project2Categories { get; set; }
        public virtual ICollection<Project2CommunityPartner> Project2CommunityPartners { get; set; }
        public virtual ICollection<Project2IndividualPartner> Project2IndividualPartners { get; set; }
        public Project()
        {
            CreateDate = DateTime.Now;
            LastModifiedDate = DateTime.Now;
        }
    }
}
