using System;
using System.Collections.Generic;
using System.Text;
using System.Web;

namespace ICStars2_0.BusinessLayer.SteansSettings.Model
{
    public class CommunityPartnerSettings : IEmailSettings
    {
        public string FilePath
        {
            get { return HttpContext.Current.Server.MapPath("/App_Data/Settings/CommunityPartnerSettings.xml"); }
        }
        public string ReceiverEmail { get; set; }
        public string EmailTitle { get; set; }
        public string EmailBody { get; set; }
        public bool IsHtmlEmail { get; set; }
        public bool IsSendingEmail { get; set; }
    }
}
