using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using ICStars2_0.Common;
using log4net;

namespace ICStars2_0.BusinessLayer
{

    public static class Log4NetHelper
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(Log4NetHelper));
        public static void Error(string err, Exception exp, ILog logger)
        {
            //if (Const.Robots.Contains(HttpContext.Current.Request.UserAgent))
            //{
            //    return;
            //}
            logger.Error(err, exp);
        }
        public static void WriteLog(Exception exp)
        {
            WriteLog(exp, Logger);
        }

        public static void WriteLog(Exception exp, ILog logger)
        {
            //var userinfo = LoginAdapter.GetLoginedUserInfo();
            string useragent = string.Empty;
            string url = string.Empty;
            string urlReferrer = string.Empty;
            if (HttpContext.Current != null)
            {
                useragent = HttpContext.Current.Request.UserAgent;
                url = string.Format("{0}", HttpContext.Current.Request.Url);

                urlReferrer = string.Format("{0}", HttpContext.Current.Request.UrlReferrer);
            }
            Error(
                string.Format(
                    "UserName:{0}\r\nIP:{1}\r\nUserAgent:{2}\r\nURL:{3}\r\nURLReferrer:{4}\r\nMessage:{5}\r\nSource:{6}",
                    HttpContext.Current != null ? HttpContext.Current.User.Identity.Name : "",
                    BrowserInfo.GetIp(), useragent,
                    url, urlReferrer, exp.Message,
                    exp.StackTrace), null, logger);
        }
    }
}
