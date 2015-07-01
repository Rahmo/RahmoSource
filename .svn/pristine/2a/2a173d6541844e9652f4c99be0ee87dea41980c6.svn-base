using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Model.Enum;

namespace ICStars2_0.Model
{

#region = Course =
    [Table("Course", Schema = Const.Schema)]
    public class Course
    {

        #region = properties =

        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }

        [DbField(Size = 100)]
        [Required]
        public string TermDescription { get; set; }

        [DbField(Size = 50)]
        [Required]
        public string Subject { get; set; }

        [DbField(Size = 50)]
        [Required]
        public string CatalogNumber { get; set; }

        [DbField(Size = 50)]
        public string ClassSection { get; set; }

        [DbField(Size = 200)]
        [Required]
        public string Title { get; set; }

        [DbField(Size = 100)]
        public string InstructorName { get; set; }

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

        public DateTime? StartDate { get; set; }

        public DateTime? EndDate { get; set; }

        [DbField(Size = 50)]
        public string Days { get; set; }

        [DbField(Size = 50)]
        public string MeetingTimeStart { get; set; }

        [DbField(Size = 50)]
        public string MeetingTimeEnd { get; set; }

        [DbField(Size = 50)]
        public string EnrlStatus { get; set; }

        public double? CrseTopicId { get; set; }

        [DbField(Size = 500)]
        public string CrseTopicDescr { get; set; }

        [DbField(Size = 1000)]
        public string ClassNotesDescrlong { get; set; }

        public DateTime? DateAddedIntoPS { get; set; }

        public int? Capacity { get; set; }

        public int? Enrlollment { get; set; }
        public string PlacementDate { get; set; }
        [DbField]
        public int Type { get; set; }
        [NotMapped]
        public string[] CboTasks { get; set; }
        [NotMapped]
        public CourseType CourseType
        {
            get { return (CourseType)Type; }
            set { Type = (int) value; }
        }

        [NotMapped]
        public string FullName
        {
            get
            {
                return string.Format("{0}--{1}--{4}--{2} ({3})", Subject, CatalogNumber, InstructorName, TermDescription, ClassSection);
            }
        }

        public virtual ICollection<Student> Students { get; set; }
        #endregion
        public Course()
        {
            CourseType = CourseType.Placement;
        }
    }

    #endregion
            
            

    
            
}
