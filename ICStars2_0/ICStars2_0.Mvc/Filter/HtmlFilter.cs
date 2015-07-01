using System;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Mvc;
using System.Web.UI;
using System.IO;
using ICStars2_0.Common;

namespace ICStars2_0.Mvc.Filter
{
    /// <summary>
    /// Minify Html.
    /// Please be very carefull to use this.
    /// It may cause unexpected issues if inappropriate html was taken.
    /// e.g. single line javascript comment"//var a=1;" will also comment all following javascript code. Please use "/*var a=1;*/ instead. 
    /// </summary>
    public class HtmlFilter : ActionFilterAttribute
    {

        #region = IsAvailable =

        private bool _isavailable = true;

        public bool IsAvailable
        {
            get { return _isavailable; }
            set { _isavailable = value; }
        }

        #endregion
        private TextWriter _originalWriter;
        private static readonly MethodInfo SwitchWriterMethod = typeof(HttpResponse).GetMethod("SwitchWriter", System.Reflection.BindingFlags.Instance | System.Reflection.BindingFlags.NonPublic);
        public HtmlFilter() { }
        public HtmlFilter(bool isAvailable)
        {
            _isavailable = isAvailable;
        }
        public string FilterHtml(string html)
        {
            return Compress(html);
//            if (DateTime.Now.Month == 4 && DateTime.Now.Day == 21)
//            {
//                text = Regex.Replace(text, "</head>", @"<style type=""text/css"">html {filter:gray;}</style></head>
//", RegexOptions.IgnoreCase);
//            }
            return html;
        }
        public override void OnResultExecuted(ResultExecutedContext filterContext)
        {
            if (!IsAvailable) return;
            if (filterContext.HttpContext.Response.ContentType == "text/html")
            {
                filterContext.HttpContext.Response.Filter =
                    new HtmlStreamFilter(filterContext.HttpContext.Response.Filter,
                                         Encoding.UTF8, FilterHtml);
            }
            base.OnResultExecuted(filterContext);
            
        }
        private static string Compress(string text)
        {
            StringBuilder str = new StringBuilder();
            StringBuilder strlink = new StringBuilder();
            var s = new char[] { '\f', '\n', '\r', '\t', '\v' };
            Func<int, object> P = c => null;
            Func<int, object> Ptag = c => null; //标签处理机
            Func<int, object> Pcomment = c => null; //注释

            #region - 总处理机 -
            Func<int, object> state = P = i =>
            {
                char c = text[i];
                if (c == '<') //碰到<交个Ptag处理机
                {
                    if (i + 4 < text.Length)
                    {
                        if (text.Substring(i + 1, 3) == "!--") //交个注释处理机
                        {
                            return Pcomment;
                        }
                    }
                    str.Append(c);
                    return Ptag;
                }
                else if (s.Contains(c) == true) { return P; }
                else if (c == ' ')
                {
                    if (i + 1 < text.Length)
                    {
                        if (s.Union(new char[] { ' ', '<' }).Contains(text[i + 1]) == false)
                        {
                            str.Append(c);
                        }
                    }
                    return P;
                }
                else
                {
                    str.Append(c);
                    return P;
                }
            };
            #endregion

            #region - Tag处理机 -
            Ptag = i =>
            {
                char c = text[i];
                if (c == '>') //交还给p
                {
                    str.Append(c);
                    return P;
                }
                else if (s.Contains(c) == true) { return Ptag; }
                else if (c == ' ')
                {
                    if (i + 1 < text.Length)
                    {
                        if (new char[] { ' ', '/', '=', '>' }.Contains(text[i + 1]) == false)
                        {
                            str.Append(c);
                        }
                    }
                    return Ptag;
                }
                else
                {
                    str.Append(c);
                    return Ptag;
                }
            };
            #endregion

            #region - 注释处理机 -
            Pcomment = i =>
            {
                char c = text[i];
                if (c == '>' && text.Substring(i - 2, 3) == "-->")
                {
                    return P;
                }
                else
                {
                    return Pcomment;
                }
            };
            #endregion

            for (int index = 0; index < text.Length; index++)
            {
                state = (Func<int, object>)state(index);
            }

            return str.ToString();
        }
    }
}
