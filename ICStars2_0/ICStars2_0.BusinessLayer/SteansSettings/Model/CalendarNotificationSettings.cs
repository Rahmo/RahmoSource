using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace ICStars2_0.BusinessLayer.SteansSettings.Model
{
    public class CalendarNotificationSettings : BaseEmailSettings, IEmailSettings
    {



        public string FilePath
        {
            get
            {
                return HttpContext.Current == null ?   string.Format("{0}/App_Data/Settings/CalendarNotificationSettings.xml", Config.SiteLocalRootPath) : HttpContext.Current.Server.MapPath("/App_Data/Settings/CalendarNotificationSettings.xml");
            }  
        }
    }
}
