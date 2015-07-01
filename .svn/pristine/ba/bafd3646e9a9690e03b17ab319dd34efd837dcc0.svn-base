using System;
using System.Web;
using System.Web.Caching;

namespace ICStars2_0.Common
{
    /// <summary>
    /// 常量类
    /// created by lihui 20100716
    /// </summary>
    public static class Const
    {
        public static readonly DateTime MIN_DATETIME = Convert.ToDateTime("1900-1-1");
        public const string ENCRYPT_KEY = "1357924680qwertyuiopasdfghjklzxcvbnmMNBVCXZLKJHGFDSAPOIUYTREWQ!#%&(@$^*)";
        public static readonly string[] Robots = new[] { "Mozilla/5.0 (compatible; SiteBot/0.1; +http://www.sitebot.org/robot/)", "Huaweisymantecspider (compatible; MSIE 8.0; DSE-support@huaweisymantec.com)", "Mozilla/5.0 (compatible; MJ12bot/v1.3.3; http://www.majestic12.co.uk/bot.php?+)","msnbot-media/1.1 (+http://search.msn.com/msnbot.htm)","Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)","Baiduspider+(+http://www.baidu.com/search/spider.htm)","Mozilla/5.0 (compatible; Yahoo! Slurp China; http://misc.yahoo.com.cn/help.html)" };
        /// <summary>
        /// Key Text
        /// SteansCenterConnectionStringKey1234567890!@#$%^&*()
        /// </summary>
        public static readonly string CONNECTION_ENCRYPTED_KEY =
            EncryptDecryptHelper.Decrypt(
                "0tQf9RSl2MoLQksaY/keokEiZvzrGptVyEvJlW7c21XuetKe069d0cHMdwArk5PZ/oCO5Llw2x8=",
                ENCRYPT_KEY);
        public static string DynamicKey { 
            get
            {
                const string cacheKey = "ICStars2_0.Common.DynamicKey";
                if (HttpContext.Current.Cache[cacheKey] != null)
                {
                    return HttpContext.Current.Cache[cacheKey].ToString();
                }
                var k = string.Format("{0}{1}", ENCRYPT_KEY, DateTime.Now.ToString("yyyyMMddHHmm"));
                HttpContext.Current.Cache.Insert(cacheKey, k, null, DateTime.Now.AddMinutes(30), TimeSpan.Zero, CacheItemPriority.Normal, null);
                return k;
            }
        }
    }
}
