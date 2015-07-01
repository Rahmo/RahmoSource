using System;
using System.Collections.Generic;
using System.Configuration;
using System.Text;
using System.Web;

namespace ICStars2_0.BusinessLayer
{
    public static class Config
    {
        public static readonly bool IsOnline = Convert.ToBoolean(ConfigurationManager.AppSettings["IsOnline"]);
        public static readonly string Domain = ConfigurationManager.AppSettings["domain"];
        public static readonly string SHTrackerRoot = ConfigurationManager.AppSettings["SHTrackerRoot"];
        public static string SiteLocalRootPath = HttpContext.Current.Server.MapPath("/");
#if DEBUG
        public const int OutputCacheDuration = 1;
#else
        public const int OutputCacheDuration = 60;
#endif
    }
}
