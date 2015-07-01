using System;
using System.ComponentModel.DataAnnotations;
using System.Web.Security;

namespace Commengdpu.BusinessLayer.Authentication
{
    #region - LoginEventArgs -
    /// <summary>
    /// created by li hui
    /// </summary>
    public class LoginEventArgs
    {
        public int? UserID { get; set; }
        [Required]
        [StringLength(100, MinimumLength = 2)]
        public string CampusConnectID { get; set; }
        public string DPUID { get; set; }
        [Required]

        [DataType(DataType.Password)]
        [StringLength(50, MinimumLength = 6)]
        public string Password { get; set; }
        public string RealName { get; set; }

        public string Domain { get; set; }

        public DateTime? Expiration { get; set; }

        public string Roles { get; set; }

        public LoginEventArgs()
        {
            Expiration = DateTime.Now.Add(FormsAuthentication.Timeout);
        }
    }
    #endregion    
}
