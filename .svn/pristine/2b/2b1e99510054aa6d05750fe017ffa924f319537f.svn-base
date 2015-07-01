using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace ICStars2_0.Model
{
    public class LoginSteansCenter
    {
        [Required]
        [Remote("ValidateCCID", "Login")]
        [StringLength(50, MinimumLength = 2)]
        public string CampusConnectID { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [StringLength(50, MinimumLength = 6)]
        public string Password { get; set; }

        public string ReturnUrl { get; set; }
    }
    public class LoginStudent
    {
        [Required]
        [StringLength(50, MinimumLength = 2)]
        public string CampusConnectID { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [StringLength(50, MinimumLength = 6)]
        public string Password { get; set; }
    }

    public class LoginSHTracker
    {
        [Required]
        [Remote("ValidateCCID", "Login")]
        [StringLength(50, MinimumLength = 2)]
        public string CampusConnectID { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [StringLength(50, MinimumLength = 6)]
        public string Password { get; set; }
        public bool IsStudent { get; set; }
        [Required]
        public string[] Terms { get; set; }
    }
}
