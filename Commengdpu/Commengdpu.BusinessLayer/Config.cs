using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Text;

namespace Commengdpu.BusinessLayer
{
    public static class Config
    {
        public static readonly bool IsOnline = Convert.ToBoolean(ConfigurationManager.AppSettings["IsOnline"]);
        public static readonly string Domain = ConfigurationManager.AppSettings["domain"];
        public static readonly string SHTrackerRoot = ConfigurationManager.AppSettings["SHTrackerRoot"];
#if DEBUG
        public const int OutputCacheDuration = 1;
#else
        public const int OutputCacheDuration = 60;
#endif
    }
}
