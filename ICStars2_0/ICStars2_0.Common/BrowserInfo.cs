using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;

namespace ICStars2_0.Common
{
    #region = 7 BrowserInfo =
    public class BrowserInfo
    {

        private HttpContext _context;

        /// <summary>
        /// Gets the browser.
        /// </summary>
        /// <value>The browser.</value>
        public string Browser
        {
            get
            {
                try
                {
                    //string strResult = _context.Request.UserAgent;
                    //return GetBrowser(strResult);
                    return _context.Request.Browser.Type;
                }
                catch
                {
                    return "";
                }
            }
        }

        /// <summary>
        /// Gets the OS.
        /// </summary>
        /// <value>The OS.</value>
        public string OS
        {
            get
            {
                try
                {

                    string strResult = _context.Request.UserAgent;
                    return GetOS(strResult);
                }
                catch
                {
                    return "";
                }
            }
        }

        /// <summary>
        /// Gets the IP.
        /// </summary>
        /// <value>The IP.</value>
        public string IP
        {
            get
            {
                return GetIp();
            }
        }
        public string Url
        {
            get
            {
                string path = _context.Request.ServerVariables["path_info"];
                string host = _context.Request.ServerVariables["server_name"];
                return string.Format("http://{0}{1}", host, path);
            }
        }

        /// <summary>
        /// Gets the referrer.
        /// </summary>
        /// <value>The referrer.</value>
        public Uri Referrer
        {
            get
            {
                return _context.Request.UrlReferrer;
            }
        }

        /// <summary>
        /// Gets the name of the user.
        /// </summary>
        /// <value>The name of the user.</value>
        public string UserName
        {
            get
            {
                return (_context.Request.IsAuthenticated) ? _context.User.Identity.Name : "";
            }
        }

        /// <summary>
        /// Gets the site root.
        /// </summary>
        /// <value>The site root.</value>
        public string SiteRoot
        {
            get
            {
                string Port = System.Web.HttpContext.Current.Request.ServerVariables["SERVER_PORT"];
                if (Port == null || Port == "80" || Port == "443")
                    Port = "";
                else
                    Port = ":" + Port;

                string Protocol = System.Web.HttpContext.Current.Request.ServerVariables["SERVER_PORT_SECURE"];
                if (Protocol == null || Protocol == "0")
                    Protocol = "http://";
                else
                    Protocol = "https://";

                string sOut = Protocol + System.Web.HttpContext.Current.Request.ServerVariables["SERVER_NAME"] + Port + System.Web.HttpContext.Current.Request.ApplicationPath;
                sOut = Regex.Replace(sOut, "/$", string.Empty);
                return sOut;
            }
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="T:BrowserInfo"/> class.
        /// </summary>
        /// <param name="context">The context.</param>
        public BrowserInfo(HttpContext context)
        {
            _context = context;
        }

        public BrowserInfo()
        {
            this._context = HttpContext.Current;
        }



        /// <summary>
        /// Gets the OS.
        /// </summary>
        /// <param name="strPara">The STR para.</param>
        /// <returns></returns>
        private string GetOS(string strPara)
        {
            string GetInfo = string.Empty;

            if (strPara.IndexOf("NT 5.1") > 0)
            {
                GetInfo = "Windows XP";
            }
            else if (strPara.IndexOf("Tel") > 0)
            {
                GetInfo = "Telport";
            }
            else if (strPara.IndexOf("webzip") > 0)
            {
                GetInfo = "webzip";
            }
            else if (strPara.IndexOf("flashget") > 0)
            {
                GetInfo = "flashget";
            }
            else if (strPara.IndexOf("offline") > 0)
            {
                GetInfo = "offline";
            }
            else if (strPara.IndexOf("NT 5") > 0)
            {
                GetInfo = "Windows 2000";
            }
            else if (strPara.IndexOf("NT 6") > -1)
            {
                GetInfo = "Windows Vista";
            }
            else if (strPara.IndexOf("NT 4") > 0)
            {
                GetInfo = "Windows NT4";
            }
            else if (strPara.IndexOf("98") > 0)
            {
                GetInfo = "Windows 98";
            }
            else if (strPara.IndexOf("95") > 0)
            {
                GetInfo = "Windows 95";
            }
            else
            {
                GetInfo = strPara;
            }

            return GetInfo;

        }

        /// <summary>
        /// Gets the browser.
        /// </summary>
        /// <param name="strPara">The STR para.</param>
        /// <returns></returns>
        private string GetBrowser(string strPara)
        {
            //strPara = strPara.Replace(".0", ".x");
            //return strPara;
            string GetInfo = string.Empty;
            if (strPara.IndexOf("NetCaptor 6.5.0") > 0)
            {
                GetInfo = "NetCaptor 6.5.0";
            }
            else if (strPara.IndexOf("MyIE") > 0)
            {
                GetInfo = "MyIE";
            }
            else if (strPara.IndexOf("NetCaptor 6.5.0RC1") > 0)
            {
                GetInfo = "NetCaptor 6.5.0RC1";
            }
            else if (strPara.IndexOf("NetCaptor 6.5.PB1") > 0)
            {
                GetInfo = "NetCaptor 6.5.PB1";
            }
            else if (strPara.IndexOf("MSIE 6.0b") > 0)
            {
                GetInfo = "Internet Explorer 6.0b";
            }
            else if (strPara.IndexOf("MSIE 6.0") > 0)
            {
                GetInfo = "Internet Explorer 6.0";
            }
            else if (strPara.IndexOf("MSIE 7.0") > 0)
            {
                GetInfo = "Internet Explorer 7.0";
            }
            else if (strPara.IndexOf("MSIE 5.5") > 0)
            {
                GetInfo = "Internet Explorer 5.5";
            }
            else if (strPara.IndexOf("MSIE 5.01") > 0)
            {
                GetInfo = "Internet Explorer 5.01";
            }
            else if (strPara.IndexOf("MSIE 5.0") > 0)
            {
                GetInfo = "Internet Explorer 5.0";
            }
            else if (strPara.IndexOf("MSIE 4.0") > 0)
            {
                GetInfo = "Internet Explorer 4.0";
            }
            else
            {
                GetInfo = strPara;
            }

            return GetInfo;

        }

        #region = IsWebSpider =

        public static bool IsWebSpider
        {
            get
            {
                string ua = HttpContext.Current.Request.UserAgent;
                if (string.IsNullOrEmpty(ua)) return false;
                ua = ua.ToLower();
                if (ua.IndexOf("iaskspider") > -1
                    || ua.IndexOf("baiduspider") > -1
                    || ua.IndexOf("googlebot") > -1
                    || ua.IndexOf("msnbot") > -1
                    || ua.IndexOf("sogou web spider") > -1
                    || ua.IndexOf("yahoo! slurp china;") > -1
                    || ua.IndexOf("http://www.alexa.com") > -1
                    )
                {
                    return true;
                }
                return false;
            }
        }

        #endregion

        public static string GetIp()
        {
            HttpRequest request = HttpContext.Current.Request;
            String ip = request.ServerVariables["X-Forwarded-For"];
            if (ip == null || ip.Count() == 0 || "unknown".ToLower().Equals(ip.ToLower()))
            {
                ip = request.ServerVariables["HTTP_X_FORWARDED_FOR"];
            }

            if (ip == null || ip.Count() == 0 || "unknown".ToLower().Equals(ip.ToLower()))
            {
                ip = request.ServerVariables["Proxy-Client-IP"];
            }
            if (ip == null || ip.Count() == 0 || "unknown".ToLower().Equals(ip.ToLower()))
            {
                ip = request.ServerVariables["WL-Proxy-Client-IP"];
            }
            if (ip == null || ip.Count() == 0 || "unknown".ToLower().Equals(ip.ToLower()))
            {
                ip = request.ServerVariables["HTTP_CLIENT_IP"];
            }

            if (ip == null || ip.Count() == 0 || "unknown".ToLower().Equals(ip.ToLower()))
            {
                ip = request.UserHostAddress;
            }
            return ip;
        }
    }
    #endregion
}
