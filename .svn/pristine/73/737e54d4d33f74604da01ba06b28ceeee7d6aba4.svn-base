using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;

namespace Commengdpu.Models
{
    [Table("Project2Type", Schema = Const.Schema)]
    public class Project2Type
    {

        [Key, Column(Order = 1)]
        public int ProjectID { get; set; }
        [Key, Column(Order = 2)]
        public int ProjectTypeID { get; set; }
        #region =For all types=

        /// <summary>
        /// For all types
        /// </summary>
        [DisplayName("Total Number of Participating Targets")]
        public int? NumberofParticipatingTargets { get; set; }
        /// <summary>
        /// for all types
        /// </summary>
        [DisplayName("Total Number of Individual Hours Served")]
        public double? NumberofHoursServed { get; set; }
        #endregion
        #region =for Academic Service Learning and  Co-Curricular Student Service=

        /// <summary>
        /// for Academic Service Learning and  Co-Curricular Student Service
        /// </summary>
        [DisplayName("Total Number of Participating Faculty")]
        public int? NumberofParticipatingFaculty { get; set; }

        /// <summary>
        /// for Academic Service Learning and  Co-Curricular Student Service
        /// </summary>
        [DisplayName("Total Number of Faculty Hours Served")]
        public double? NumberofFacultyHoursServed { get; set; }
        /// <summary>
        /// for Academic Service Learning and  Co-Curricular Student Service
        /// </summary>
        [DisplayName("Total Number of Participating Staff")]
        public int? NumberofParticipatingStaff { get; set; }
        /// <summary>
        /// for Academic Service Learning and  Co-Curricular Student Service
        /// </summary>
        [DisplayName("Total Number of Staff Hours Served")]
        public double? NumberofStaffHoursServed { get; set; }
        #endregion
        public virtual Project Project { get; set; }
        public virtual ProjectType ProjectType { get; set; }
    }
}
