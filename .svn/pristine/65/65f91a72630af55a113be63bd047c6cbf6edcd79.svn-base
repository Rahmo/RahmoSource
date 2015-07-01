using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace ICStars2_0.Model
{
    public class StudentNotification
    {
        public int StudentID { get; set; }
        public int CourseID { get; set; }
        public int CBOID { get; set; }
        public string Quarter_Year { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string ToEmail { get; set; }
        [Required]
        public string EmailTitle { get; set; }
        [AllowHtml]
        [Required]
        [DataType(DataType.MultilineText)]
        public string EmailBody { get; set; }
    }
}
