using System;
using System.Web.Security;

namespace ICStars2_0.BusinessLayer.Login
{
    #region - LoginEventArgs -
    /// <summary>
    /// created by li hui
    /// </summary>
    public class LoginEventArgs
    {

        public int ID { get; set; }

        public string CampusConnectID { get; set; }
        public string DPUID { get; set; }  
        public string Password { get; set; }
        public string RealName { get; set; }

        public string Domain { get; set; }

        public DateTime Expiration { get; set; }

        public string QuarterYear { get; set; }
        public string Roles { get; set; }

        public LoginEventArgs()
        {
            Expiration = DateTime.Now.Add(FormsAuthentication.Timeout);
        }
    }
    #endregion    
}
