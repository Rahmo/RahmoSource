using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Model.Enum;

namespace ICStars2_0.Model
{

    #region = UniverseCourseFiltered =
    [Table("UniverseCourseFiltered", Schema = Const.Schema)]
    public class UniverseCourseFiltered
    {

        #region = properties =

        [DbField(Size = 100)]
        public string TermDesc { get; set; }

        [Key,Column(Order=1)]
        [DbField(Size = 50)]
        public string Subject { get; set; }

        [Key,Column(Order=2)]
        [DbField(Size = 50)]
        public string CatalogNumber { get; set; }

        [Key, Column(Order = 3)]
        [DbField(Size = 50)]
        public string ClassSection { get; set; }

        [DbField(Size = 200)]
        [Required]
        public string Title { get; set; }

        [DbField(Size = 100)]
        public string InstructorName { get; set; }
        [DbField(Size = 100)]
        public string InstructorFirstName { get; set; }
        [DbField(Size = 100)]
        public string InstructorLastName { get; set; }

        [DbField(Size = 200)]
        public string BestEmail { get; set; }

        [DbField(Size = 100)]
        public string Staff { get; set; }

        [DbField(Size = 50)]
        public string Term { get; set; }

        [DbField(Size = 100)]
        public string College { get; set; }

        [DbField(Size = 50)]
        public string Career { get; set; }

        [DbField(Size = 100)]
        public string CrseCareerDescr { get; set; }

        [DbField(Size = 50)]
        public string SessionCode { get; set; }

        [DbField(Size = 100)]
        public string SessionCodeDescr { get; set; }

        [DbField(Size = 100)]
        public string SubjectDescr { get; set; }

        [DbField(Size = 50)]
        public string ClassNumber { get; set; }

        [DbField(Size = 50)]
        public string Component { get; set; }

        [DbField(Size = 50)]
        public string RequirementDesignation { get; set; }

        [DbField(Size = 100)]
        public string RqmntDesigDescr { get; set; }

        [DbField(Size = 50)]
        public string CrseAttr { get; set; }

        [DbField(Size = 50)]
        public string CrseAttrValue { get; set; }

        [DbField(Size = 50)]
        public string CrseTypoffCd { get; set; }

        [DbField(Size = 500)]
        public string CrseTypoffDescr { get; set; }

        [DbField(Size = 50)]
        public string InstructorEmplid { get; set; }

        [DbField(Size = 50)]
        public string InstructionMode { get; set; }

        [DbField(Size = 50)]
        public string Location { get; set; }

        [DbField(Size = 500)]
        public string LocationDescr { get; set; }

        [DbField(Size = 50)]
        public string FacilityRoom { get; set; }

        [DbField]
        public DateTime? StartDate { get; set; }
        [DbField]
        public DateTime? EndDate { get; set; }

        [DbField(Size = 50)]
        public string Days { get; set; }

        [DbField(Size = 50)]
        public string MeetingTimeStart { get; set; }

        [DbField(Size = 50)]
        public string MeetingTimeEnd { get; set; }

        [DbField(Size = 50)]
        public string EnrlStatus { get; set; }
        [DbField]
        public double? CrseTopicId { get; set; }

        [DbField(Size = 500)]
        public string CrseTopicDescr { get; set; }

        [DbField(Size = 1000)]
        public string ClassNotesDescrlong { get; set; }
        [DbField]
        public DateTime? DateAddedIntoPS { get; set; }
        [DbField]
        public int? Capacity { get; set; }
        [DbField]
        public int? Enrlollment { get; set; }
        [DbField]
        public bool Status { get; set; }

        #endregion
        public UniverseCourseFiltered()
        {
            Status = true;
        }
        public UniverseCourseFiltered(UniverseCourse c)
        {
            var thisProps = this.GetType().GetProperties();
            var sourceProps = c.GetType().GetProperties();
            foreach (var p in thisProps)
            {
                
            }
            Status = true;
        }
    }

    #endregion
            
            

    
            
}
