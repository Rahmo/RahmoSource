using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace ICStars2_0.Model
{
    [Table("HistoricalCourse", Schema = Const.Schema)]
    public class HistoricalCourse
    {

        [Key]
        [DatabaseGeneratedAttribute(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [MaxLength(50)]
        [Required]
        public string Subject { get; set; }
        [MaxLength(50)]
        [Required]
        public string CatalogNumber { get; set; }
        [MaxLength(20)]
        [Required]
        [Remote("ValidateCourse", "Course", AdditionalFields = "CatalogNumber,Subject,ID")]
        public string ClassSection { get; set; }
        [MaxLength(20)]
        public string ClassNumber { get; set; }
        [MaxLength(250)]
        public string Title { get; set; }
    }
    //[NotMapped]
    //[MetadataType(typeof(HistoricalCourseForAddingMetaData))]
    //public class HistoricalCourseForAdding : HistoricalCourse
    //{
    //}
    //[NotMapped]
    //[MetadataType(typeof(HistoricalCourseForEditingMetaData))]
    //public class HistoricalCourseForEditing : HistoricalCourse
    //{

    //}
    //public class HistoricalCourseForAddingMetaData
    //{
    //    [Remote("ValidateNewCourse", "Course", AdditionalFields = "CatalogNumber,Subject")]
    //    public string ClassSection { get; set; }
    //}
    //public class HistoricalCourseForEditingMetaData
    //{
    //    [Remote("ValidateEditedCourse", "Course", AdditionalFields = "CatalogNumber,Subject,ID")]
    //    public string ClassSection { get; set; }
    //}
}
