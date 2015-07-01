using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model.Enum;

namespace ICStars2_0.Model.Settings
{
    public class StudentCollectionSettings
    {
        public string SLC { get; set; }
        public string Staff { get; set; }
        public string QuaterYear { get; set; }
        public string[] QuaterYearArray { get; set; }
        public string FirstNameForSearch { get; set; }
        public string LastNameForSearch { get; set; }
        public string DPU_ID { get; set; }
        public bool IsInitalize { get; set; }
        public bool IsOrderByFirstName { get; set; }
        public bool IsOrderByCBOName { get; set; }
        public bool IsOrderByCourseSubject { get; set; }
        public bool IsOrderByOrientation { get; set; }
        public bool IsOrderByServedHours { get; set; }
        public bool IsOrderBySLC { get; set; }
        public bool IsAscending { get; set; }
        public StudentType StudentType { get; set; }
        public bool IsToBeCalled { get; set; }
        public bool IsOthersToBeCalled { get; set; }
        public int CourseID { get; set; }
        public StudentCollectionSettings()
        {
            StudentType = StudentType.Placement;
            
        }
    }
}
