using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model.Enum;

namespace ICStars2_0.Model.Settings
{
    public class CourseCollectionSettings
    {
        /// <summary>
        /// Student Quarter Year
        /// It will check the Quarter that student registered, not Course Term.
        /// (wrong spelling here because I made spelling mistake in the database)
        /// </summary>
        public string Quater_Year { get; set; }
        /// <summary>
        /// Student Quarter Year Array
        /// It will check the Quarter that student registered, not Course Term.
        /// </summary>
        public string[] QuaterYearArray { get; set; }
        /// <summary>
        /// Course Term
        /// </summary>
        public string Term { get; set; }
        /// <summary>
        /// Course Term Array
        /// </summary>
        public string[] TermArray { get; set; }
        public string DPU_ID { get; set; }
        public bool IsCheckInstructorName { get; set; }
        public string InstructorName { get; set; }
        //public StudentType StudentType { get; set; }
        public CourseType CourseType { get; set; }
        public CourseCollectionSettings()
        {
            //StudentType = StudentType.Default;
            CourseType = CourseType.Placement;
            
        }
    }
}
