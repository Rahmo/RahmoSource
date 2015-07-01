using System;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

namespace ICStars2_0.Common
{
    /// <summary>
    /// Url处理类
    /// created by lihui 20100716
    /// </summary>
    public class UrlHelper
    {
        private string _url;

        public string Url
        {
            get { return _url; }
            set { _url = value; }
        }

        #region = FullUrl =
        public Uri FullUrl
        {
            get
            {
                return new Uri(GetFullUrl());
            }
        }
        #endregion

        public string SiteRoot
        {
            get { return GetRoot(); }
        }

        public static UrlHelper Current
        {
            get { return new UrlHelper(); }
        }

        public UrlHelper()
        {
            if (HttpContext.Current != null)
            {
                this._url = HttpContext.Current.Request.Url.ToString();
            }
        }

        public UrlHelper(string Url)
        {
            this._url = Url;
        }

        public static string GetCurrentRoot()
        {
            Uri uri = HttpContext.Current.Request.Url;
            return uri.GetLeftPart(UriPartial.Authority);
        }
        public static string GetRoot()
        {
            return GetRoot(HttpContext.Current.Request.Url);
        }
        public static string GetHttpsRoot()
        {
            var root = GetRoot(HttpContext.Current.Request.Url);
#if DEBUG
            return root;
#endif
            if (root.IndexOf("https://",StringComparison.InvariantCultureIgnoreCase) > -1) return root;
            return GetRoot(HttpContext.Current.Request.Url).Replace("http://", "https://");
        }
        public static string GetRoot(Uri uri)
        {
            return uri.GetLeftPart(UriPartial.Authority);
        }
        public static string GetRoot(string Url)
        {
            Uri uri = new Uri(Url);
            return uri.GetLeftPart(UriPartial.Authority);
            //char[] array = Url.ToCharArray();
            //int Temp = 0;
            //string root = string.Empty;
            //for (int i = 0; i < array.Length; i++)
            //{
            //    if (array[i].Equals('/'))
            //    {
            //        Temp++;
            //    }
            //    if (array[i].Equals('/') && Temp == 3)
            //    {
            //        break;
            //    }
            //    root += array[i].ToString();
            //}
            //return root;
        }

        //public string GetFullUrl()
        //{
        //    return GetFullUrl(this._url);
        //}

        //public static string GetFullUrl(string Url)
        //{
        //    string url = Url;

        //    if (url.IndexOf("?") == -1)
        //    {
        //        url += "?";
        //    }

        //    url = url.Substring(0, url.IndexOf("?"));

        //    return url;
        //}

        #region = GetFullUrl =
        /// <summary>
        /// 获取完整的url
        /// </summary>
        /// <returns></returns>
        public string GetFullUrl()
        {
            if (HttpContext.Current == null)
            {
                if (Uri.IsWellFormedUriString(this.Url, UriKind.Absolute) == true)
                {
                    return this.Url;
                }
                else
                {
                    throw new UriFormatException("输入的Url不是绝对地址");
                }
            }
            else
            {
                return GetFullUrl(HttpContext.Current.Request.Url);
            }
        }

        /// <summary>
        /// 获取完整的url
        /// </summary>
        /// <param name="baseurl">参考的完整的url</param>
        /// <returns></returns>
        public string GetFullUrl(Uri baseUri)
        {
            //绝对的地址 直接返回
            if (Uri.IsWellFormedUriString(this.Url, UriKind.Absolute) == true)
            {
                return this.Url;
            }

            //如果是相对相对链接,进行处理
            Uri uri = new Uri(baseUri, this.Url);

            return uri.ToString();
        }

        public string GetFullUrl(string baseUri)
        {
            if (Uri.IsWellFormedUriString(baseUri, UriKind.Absolute) == false)
            {
                throw new UriFormatException("输入的url不是绝对地址");
            }

            return GetFullUrl(new Uri(baseUri));
        }
        #endregion

        public static int GetColumnCount()
        {
            return HttpContext.Current.Request.Url.Segments.Length - 1;
        }

        public static string GetColumnName(int index)
        {
            string root = UrlHelper.GetRoot();
            string local = HttpContext.Current.Request.Url.ToString().Replace(root + "/", string.Empty);
            string[] url_array = local.Split('/');
            if (url_array.Length > 0)
            {
                if (url_array[0].IndexOf('.') > -1)
                {
                    url_array[0] = url_array[0].Substring(0, url_array[0].IndexOf('.'));
                }
                //for (int i = 0; i < url_array.Length; i++)
                //{
                //    url_array[i] = url_array[i].Replace("/", string.Empty);
                //}
            }
            if (url_array.Length <= index)
            {
                return string.Empty;
            }
            return url_array[index];
        }

        public static string GetQueryString(string query)
        {
            return GetQueryString(HttpContext.Current.Request.RawUrl.ToString(), query);
        }
        public static string GetQueryString(string url, string query)
        {
            string result = string.Empty;
            if (url.IndexOf('?') > -1)
            {
                result = url.Split('?')[1];
            }
            string[] querys = result.Split('&');
            foreach (string s in querys)
            {
                if (s.IndexOf('=') > -1)
                {
                    string[] temp = s.Split('=');
                    if (query == temp[0])
                    {
                        return temp[1];
                    }
                }
            }
            return string.Empty;
        }

        public static string SetQueryString(string query, string value)
        {
            return SetQueryString(HttpContext.Current.Request.RawUrl.ToString(), query, value);
        }
        public static string SetQueryString(string url, string query, string value)
        {
            string queryString = string.Empty;
            string urlRoot = string.Empty;
            StringBuilder strUrl = new StringBuilder();
            if (url.IndexOf('?') > -1)
            {
                string[] urlArray = url.Split('?');
                urlRoot = urlArray[0];
                queryString = urlArray[1];
                strUrl.Append(urlRoot);
            }
            else
            {
                strUrl.AppendFormat(url);
            }
            strUrl.AppendFormat("?{0}={1}", query, value);
            if (string.IsNullOrEmpty(queryString) == false)
            {
                string[] querys = queryString.Split('&');
                foreach (string s in querys)
                {
                    if (s.IndexOf('=') > -1)
                    {
                        string[] temp = s.Split('=');
                        if (query != temp[0])
                        {
                            strUrl.AppendFormat("&{0}={1}", temp[0], temp[1]);
                        }
                    }
                }
            }

            return strUrl.ToString();
        }

        #region = SafeAddQueryToURL =
        /// <summary>
        /// Add a query to an URL.
        /// if the URL has not any query,then append the query key and value to it.
        /// if the URL has some queries, then check it if exists the query key already,replace the value, or append the key and value
        /// if the URL has any fragment, append fragments to the URL end.
        /// </summary>
        /// <example>
        ///             string s = "http://blog.csdn.net/leewhoee/?a=1&b=2&c=3#tag";
        /// WL(SafeRemoveQueryFromURL("a",s));
        /// WL(SafeRemoveQueryFromURL("b",s));
        /// WL(SafeRemoveQueryFromURL("c",s));
        /// WL(SafeAddQueryToURL("d","new",s));
        /// WL(SafeAddQueryToURL("a","newvalue",s));
        ///            输出如下:
        ///            http://blog.csdn.net/leewhoee/?b=2&c=3#tag
        ///            http://blog.csdn.net/leewhoee/?a=1&c=3#tag
        ///            http://blog.csdn.net/leewhoee/?a=1&b=2#tag
        ///            http://blog.csdn.net/leewhoee/?a=1&b=2&c=3&d=new#tag
        ///            http://blog.csdn.net/leewhoee/?a=newvalue&b=2&c=3#tag
        /// </example>
        public static string SafeAddQueryToURL(string key, string value, string url)
        {
            int fragPos = url.LastIndexOf("#");
            string fragment = string.Empty;
            if (fragPos > -1)
            {
                fragment = url.Substring(fragPos);
                url = url.Substring(0, fragPos);
            }
            int querystart = url.IndexOf("?");
            if (querystart < 0)
            {
                url += "?" + key + "=" + value;
            }
            else
            {
                Regex reg = new Regex(@"(?<=[&\?])" + key + @"=[^\s&#]*", RegexOptions.Compiled);
                if (reg.IsMatch(url))
                    url = reg.Replace(url, key + "=" + value);
                else
                    url += "&" + key + "=" + value;
            }
            return url + fragment;
        }
        #endregion

        #region = SafeRemoveQueryFromURL =
        /// <summary>
        /// Remove a query from url
        /// </summary>
        /// <param name="key"></param>
        /// <param name="url"></param>
        /// <returns></returns>
        public static string SafeRemoveQueryFromURL(string key, string url)
        {
            Regex reg = new Regex(@"[&\?]" + key + @"=[^\s&#]*&?", RegexOptions.Compiled);
            return reg.Replace(url, new MatchEvaluator(PutAwayGarbageFromURL));
        }
        private static string PutAwayGarbageFromURL(Match match)
        {
            string value = match.Value;
            if (value.EndsWith("&"))
                return value.Substring(0, 1);
            else
                return string.Empty;
        }
        #endregion

        #region = Path =
        /// <summary>
        /// 完整路径
        /// /Smaple/default.aspx 
        /// </summary>
        public string Path
        {
            get
            {
                return this.FullUrl.LocalPath;
            }
        }
        #endregion
    }
}
