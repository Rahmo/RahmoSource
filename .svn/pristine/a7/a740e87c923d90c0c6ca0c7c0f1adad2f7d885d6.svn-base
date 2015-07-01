using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Commengdpu.Models
{
    [Table("ProjectType", Schema = Const.Schema)]
    public class ProjectType
    {

        [Key]

        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        public int? OrderByID { get; set; }
        [StringLength(100)]
        [MaxLength(100)]
        [Required]
        public string Name { get; set; }
        /// <summary>
        /// Target Name
        /// </summary>
        [StringLength(50)]
        [MaxLength(50)]
        public string TrackingTarget { get; set; }
        /// <summary>
        /// If track NumberofParticipatingFaculty/NumberofFacultyHoursServed/NumberofParticipatingStaff/NumberofStaffHoursServed
        /// </summary>
        public bool IsTrackingAll { get; set; }
        #region =For presenting HTML of input element=

        /// <summary>
        /// For presenting HTML of input element
        /// </summary>
        [NotMapped]
        public bool IsChecked { get; set; }
        /// <summary>
        /// For presenting HTML of input element
        /// </summary>
        [NotMapped]
        public int? NumberofParticipatingTargets { get; set; }
        /// <summary>
        /// For presenting HTML of input element
        /// </summary>
        [NotMapped]
        public double? NumberofHoursServed { get; set; }
        /// <summary>
        /// For presenting HTML of input element
        /// </summary>
        [NotMapped]
        public int? NumberofParticipatingFaculty { get; set; }
        /// <summary>
        /// For presenting HTML of input element
        /// </summary>
        [NotMapped]
        public double? NumberofFacultyHoursServed { get; set; }
        /// <summary>
        /// For presenting HTML of input element
        /// </summary>
        [NotMapped]
        public int? NumberofParticipatingStaff { get; set; }
        /// <summary>
        /// For presenting HTML of input element
        /// </summary>
        [NotMapped]
        public double? NumberofStaffHoursServed { get; set; }
        #endregion
        public virtual ICollection<Project2Type> Project2Types { get; set; }
    }
}
