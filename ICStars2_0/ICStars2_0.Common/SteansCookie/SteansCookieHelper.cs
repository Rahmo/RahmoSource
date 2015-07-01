using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Security;

namespace ICStars2_0.Common.SteansCookie
{
    public static class SteansCookieHelper
    {
        public static string GetQuarterYear
        {
            get { return Get("QuarterYear"); }
        }
        public static string[] GetQuarterYears
        {
            get
            {
                var s = GetQuarterYear;
                return s.IndexOf(',') < 0 ? null : s.Split(',');
            }
        }
        public static int GetID { get { return Convert.ToInt32(Get("ID")); } }
        public static string GetDPUID { get { return Get("DPUID"); } }

        public static string GetRealName
        {
            get { return Get("RealName"); }
        }
        public static string Get(string key)
        {
            if (!HttpContext.Current.Request.IsAuthenticated) return string.Empty;
            var userData = ((FormsIdentity)HttpContext.Current.User.Identity).Ticket.UserData;
            string[] keyValueDatas = userData.Split('|');
            foreach (string keyValueData in keyValueDatas)
            {
                string[] keyvalue = keyValueData.Split(':');
                if (keyvalue[0].Equals(key))
                {
                    return keyvalue[1];
                }
            }
            throw new Exception(string.Format("Could not find the key [{0}] -- ICStars2_0.Common.SteansCookie", key));
        }
    }
}
