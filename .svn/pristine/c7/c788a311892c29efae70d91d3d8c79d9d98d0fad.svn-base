using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.Caching;

namespace ICStars2_0.Common
{
    public static class CacheHelper
    {
        public class Settings
        {
            public string Key { get; set; }
            /// <summary>
            /// Seconds
            /// </summary>
            public int Duration { get; set; }

            public Settings(string key,object o=null)
            {
                Key = key;
                if (o != null)
                {
                    Key = BuildKey(o, key);
                }
#if DEBUG
                Duration = 1;
#else
                Duration = 60;
#endif
            }
        }

        public static string BuildKey<T>(T t,string baseKey=null)
        {
            var sbKey = new StringBuilder(baseKey);
            foreach (PropertyInfo pi in t.GetType().GetProperties())
            {
                sbKey.AppendFormat("{0}{1}", pi.Name, pi.GetValue(t, null));
            }
            return sbKey.ToString();
        }
        public static Cache CurrentCache
        {
            get
            {
                return HttpContext.Current != null ? HttpContext.Current.Cache : HttpRuntime.Cache;
            }
        }

        public static T GetCache<T>(Settings settings)
        {
            if (CurrentCache[settings.Key] != null)
            {
                return (T)CurrentCache[settings.Key];
            }
            return default(T);
        }
        public static T BuildCache<T>(T t, Settings settings)
        {
            if (CurrentCache[settings.Key] != null)
            {
                return (T)CurrentCache[settings.Key];
            }
            CurrentCache.Insert(settings.Key, t, null, DateTime.Now.AddSeconds(settings.Duration),
                TimeSpan.Zero);
            return t;
        }
    }
}
