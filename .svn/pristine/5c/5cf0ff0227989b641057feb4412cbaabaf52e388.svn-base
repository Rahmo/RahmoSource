using System;
using System.IO;
using System.Net;
using System.Text;

namespace ICStars2_0.Common
{
    public static class WebHelper
    {
        public enum Method
        {
            POST,
            GET,
            HEAD
        }

        public static bool ExistsUrl(string url)
        {
            HttpWebResponse webResponse = null;
            HttpWebRequest webRequest = null;
            try
            {
                webRequest = (HttpWebRequest)WebRequest.Create(url);
                webRequest.Timeout = 3000;
                webRequest.Method = "HEAD";
                webResponse = (HttpWebResponse)webRequest.GetResponse();

                if (webResponse.StatusCode == HttpStatusCode.OK)
                {
                    return true;
                }

            }
            catch //(Exception ex)
            {
                return false;
            }
            finally
            {
                if (webResponse != null) webResponse.Close();
                if (webRequest != null) webRequest.Abort();
            }
            return false;
        }
        #region =DownloadFile=

        public static bool DownloadFile(string oriUrl, string tagFileName)
        {
            return DownloadFile(null, oriUrl, tagFileName);
        }
        public static bool DownloadFile(Uri referer, string oriUrl, string tagFileName)
        {
            return DownloadFile(referer, oriUrl, tagFileName, null);
        }
        public static bool DownloadFile(Uri referer, string oriUrl, string tagFileName, IWebProxy proxy)
        {
            if (System.IO.File.Exists(tagFileName))
                return false;
            FileInfo fi = new FileInfo(tagFileName);
            if (!Directory.Exists(fi.DirectoryName))
            {
                Directory.CreateDirectory(fi.DirectoryName);
            }

            if (oriUrl.ToLower().StartsWith("http://") == false)
            {
                oriUrl = new Uri(referer, oriUrl).OriginalString;
            }
            System.Net.HttpWebRequest Myrq = (System.Net.HttpWebRequest)System.Net.HttpWebRequest.Create(oriUrl);
            Myrq.UserAgent = "Mozilla/5.0 (Windows NT 6.2; WOW64; rv:19.0) Gecko/20100101 Firefox/19.0";
            if (proxy != null)
            {
                Myrq.Proxy = proxy;
            }
            if (referer != null)
            {
                Myrq.Referer = referer.AbsoluteUri;
            }
            Myrq.Timeout = 90000;
            Myrq.ReadWriteTimeout = 90000;
            System.IO.Stream st = null;
            System.IO.Stream so = null;
            try
            {
                System.Net.HttpWebResponse myrp = (System.Net.HttpWebResponse)Myrq.GetResponse();
                long totalBytes = myrp.ContentLength;
                st = myrp.GetResponseStream();
                so = new System.IO.FileStream(tagFileName, System.IO.FileMode.Create);
                long totalDownloadedByte = 0;
                byte[] by = new byte[1024];
                int osize = st.Read(by, 0, (int)by.Length);
                while (osize > 0)
                {
                    totalDownloadedByte = osize + totalDownloadedByte;
                    so.Write(by, 0, osize);
                    osize = st.Read(by, 0, (int)by.Length);
                }
            }
            catch (Exception exp)
            {
                throw exp;
            }
            finally
            {
                if (so != null)
                {
                    so.Close();
                }
                if (st != null)
                {
                    st.Close();
                }
            }
            return true;
        }

        #endregion

        #region = 取得本地路径的Web内容 =

        /// <summary>
        /// 取得本地路径的Web内容
        /// </summary>
        /// <param name="localUrl">本地url</param>
        /// <returns>返回Web内容</returns>
        public static string GetLocalPage(string localUrl)
        {
            StringWriter sw = new StringWriter();
            System.Web.HttpContext.Current.Server.Execute(localUrl, sw);
            return sw.ToString();
        }

        #endregion

        #region = 获取网页内容 =
        /// <summary>
        /// 获取网页内容
        /// </summary>
        /// <remarks>
        /// e.g.:  
        /// GetWebPage(URL)
        /// </remarks>
        /// <param name="sUrl">一个标准的URL</param>
        /// <param name="compress">是否压缩</param>
        /// <returns>返回该网页的HTML代码</returns>
        public static string GetWebPage(string sUrl)
        {
            return GetWebPage(sUrl, false);
        }

        public static string GetWebPage(string sUrl, string cookieHeader)
        {
            Encoding enc = Encoding.GetEncoding("GB2312");
            return GetWebPage(sUrl, true, enc, cookieHeader);
        }

        public static string GetWebPage(string sUrl, Encoding enc)
        {
            return GetWebPage(sUrl, true, enc);
        }

        /// <summary>
        /// 获取网页内容
        /// </summary>
        /// <remarks>
        /// e.g.:  
        /// GetWebPage(URL)
        /// </remarks>
        /// <param name="sUrl">一个标准的URL</param>
        /// <param name="compress">是否压缩</param>
        /// <returns>返回该网页的HTML代码</returns>
        public static string GetWebPage(string sUrl, bool compress)
        {
            Encoding enc = Encoding.GetEncoding("GB2312");
            return GetWebPage(sUrl, compress, enc);
        }

        public static string GetWebPage(string sUrl, bool compress, Encoding enc)
        {
            return GetWebPage(sUrl, compress, enc, string.Empty);
        }
        public static string GetWebPage(string sUrl, bool compress, Encoding enc, string cookieHeader)
        {
            CookieContainer cc = null;
            if (string.IsNullOrEmpty(cookieHeader) == false)
            {
                cc = new CookieContainer();
                cc.SetCookies(new Uri(sUrl), cookieHeader);
            }
            return GetWebPage(sUrl, compress, enc, cc);
        }

        public static string GetWebPage(string sUrl, bool compress, Encoding enc, CookieCollection cookies)
        {
            CookieContainer cc = null;
            if (cookies != null)
            {
                cc = new CookieContainer();
                cc.Add(cookies);
            }
            return GetWebPage(sUrl, compress, enc, cc);
        }
        public static string GetWebPage(string sUrl, bool compress, Encoding enc, CookieContainer cookieContainer)
        {
            return GetWebPage(sUrl, compress, enc, cookieContainer, 0);
        }

        public static string GetWebPage(string sUrl, bool compress, Encoding enc, CookieContainer cookieContainer,int timeOut)
        {
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(sUrl);
            req.UserAgent = "Baiduspider+(+http://www.baidu.com/search/spider.htm)";
            if (timeOut > 0)
            {
                req.Timeout = timeOut;
                req.ReadWriteTimeout = timeOut;
            }
            if (cookieContainer != null)
            {
                req.CookieContainer = cookieContainer;
                req.KeepAlive = true;
            }

            HttpWebResponse res;

            try
            {
                res = (HttpWebResponse)req.GetResponse();
            }
            catch
            {
                return "Error";
            }

            if (res.StatusCode == HttpStatusCode.OK)
            {
                StreamReader sr = new StreamReader(res.GetResponseStream(), enc);
                string sHtml = sr.ReadToEnd();
                sr.Close();
                res.Close();

                if (compress == true)
                {
                    sHtml = HtmlHelper.Compress(sHtml);
                }

                return sHtml;
            }
            else
            {
                return "Error";
            }
        }
        #endregion

        #region = Cookie =

        public static CookieCollection GetCookieCollection(string url, string postData)
        {
            return GetCookieCollection(url, postData, Method.POST);
        }

        public static CookieCollection GetCookieCollection(string url, string postData, Method method)
        {
            return GetCookieCollection(url, postData, method, "GB2312");
        }

        public static CookieCollection GetCookieCollection(string url, string postData, Method method, string encodingName)
        {
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
            Encoding encoding = Encoding.GetEncoding(encodingName);
            byte[] data = encoding.GetBytes(postData);
            req.Method = method.ToString();
            req.ContentType = "application/x-www-form-urlencoded";
            req.ContentLength = data.Length;

            CookieContainer cookieCon = new CookieContainer();
            req.CookieContainer = cookieCon;

            req.ReadWriteTimeout = 10000;
            req.UserAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; Q312461; .NET CLR 1.0.3705)";
            try
            {
                Stream newStream = req.GetRequestStream();

                newStream.Write(data, 0, data.Length);
                newStream.Close();

                HttpWebResponse res = (HttpWebResponse)req.GetResponse();
                return res.Cookies;
            }
            catch
            {
                return null;
            }
        }

        public static string GetCookieHeader(string url, string postData)
        {
            return GetCookieHeader(url, postData, Method.POST);
        }

        public static string GetCookieHeader(string url, string postData, Method method)
        {
            return GetCookieHeader(url, postData, method, "GB2312");
        }

        public static string GetCookieHeader(string url, string postData, Method method, string encodingName)
        {
            HttpWebRequest req = (HttpWebRequest)WebRequest.Create(url);
            Encoding encoding = Encoding.GetEncoding(encodingName);
            byte[] data = encoding.GetBytes(postData);
            req.Method = method.ToString();
            req.ContentType = "application/x-www-form-urlencoded";
            req.ContentLength = data.Length;

            CookieContainer cookieCon = new CookieContainer();
            req.CookieContainer = cookieCon;

            req.ReadWriteTimeout = 10000;
            req.UserAgent = "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.0; Q312461; .NET CLR 1.0.3705)";
            try
            {
                Stream newStream = req.GetRequestStream();

                newStream.Write(data, 0, data.Length);
                newStream.Close();
                HttpWebResponse res = (HttpWebResponse)req.GetResponse();
                return req.CookieContainer.GetCookieHeader(new Uri(url));
            }
            catch
            {
                return "Error";
            }
        }

        #endregion
    }
}
