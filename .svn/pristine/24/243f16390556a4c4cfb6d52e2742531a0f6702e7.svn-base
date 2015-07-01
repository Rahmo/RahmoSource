using System;
using System.Text.RegularExpressions;

namespace ICStars2_0.Common
{
    public static class HtmlHelper
    {
        /// <summary>
        /// 压缩html代码
        /// </summary>
        /// <param name="text">The text.</param>
        /// <returns></returns>
        public static string Compress(string text)
        {
            text = Regex.Replace(text, @"<!--\S*?-->", string.Empty);
            text = Regex.Replace(text, @"^\s+|\s+$", string.Empty);
            text = Regex.Replace(text, "\n", " ");
            text = Regex.Replace(text, @">\s+?<", "><");
            text = Regex.Replace(text, @"\s{2,}", " ");
            text = Regex.Replace(text, " {2,}", @"\s");
            text = Regex.Replace(text, @"\s{2,}", @"\s");
        
            return text;
        }

        #region = 提取HTML控件的指定属性 =

        /// <summary>
        /// Pickups the HTML control attribute.
        /// </summary>
        /// <param name="html"></param>
        /// <param name="tagName">Name of the tag.</param>
        /// <param name="attributeName">Name of the attribute.</param>
        /// <param name="remoteUri">The remote URI.</param>
        /// <param name="extensionName"></param>
        /// <returns></returns>
        public static string[] PickupAttribute(string html, string tagName, string attributeName, Uri remoteUri, string extensionName)
        {
            Regex re;
            if (string.IsNullOrEmpty(extensionName))
            {
                re = new Regex("<" + tagName + " .*?" + attributeName + "=[\"'](?<" + attributeName + ">[^>]+?)[\"'].*?/?>", RegexOptions.IgnoreCase | RegexOptions.Singleline);
            }
            else
            {
                re = new Regex("<" + tagName + " .*?" + attributeName + "=[\"'](?<" + attributeName + ">[^>]+?\\." + extensionName + ")[\"'].*?/?>", RegexOptions.IgnoreCase | RegexOptions.Singleline);
            }


            MatchCollection matches = re.Matches(html);

            string[] string_array = new string[matches.Count];

            int i = 0;
            foreach (Match match in matches)
            {
                string word = match.Groups[attributeName].Value.Replace("\"", "");

                if (word.StartsWith("http"))
                {

                }
                else if (word.StartsWith("/")) //root 处理
                {
                    if (remoteUri != null)
                    {
                        word = remoteUri.ToString().Replace(remoteUri.AbsolutePath, string.Empty) + word;
                    }
                }

                string_array[i] = word;
                i++;
            }

            return string_array;
        }

        public static string[] PickupAttribute(string html, string tagName, string attributeName)
        {
            return PickupAttribute(html, tagName, attributeName, null, null);
        }
        #endregion

        #region = RemoveHtml =
        /// <summary>
        /// Removes the HTML.
        /// </summary>
        /// <param name="html">The HTML.</param>
        /// <returns></returns>
        public static string RemoveHtml(string html)
        {
            if (string.IsNullOrEmpty(html)) return string.Empty;
            html = Regex.Replace(html, "<br[^>]*?/?>", " ");
            html = Regex.Replace(html, @"<[\s|\S]+?>", string.Empty);
            html = Regex.Replace(html, "&nbsp;", " ");
            html = Regex.Replace(html, @"\s", " ");
            html = Regex.Replace(html, " {2,}", " ");
            return html;
        }
        #endregion

        #region = Filter HTML =
        /// <summary>
        /// Filters the script.
        /// </summary>
        /// <param name="content">The content.</param>
        /// <returns></returns>
        public static string FilterScript(string content)
        {
            if (string.IsNullOrEmpty(content) == true)
            {
                return content;
            }
            string regexstr = @"(?i)<script([^>])*>(\w|\W)*?</script([^>])*>";//@"<script.*</script>";
            content = Regex.Replace(content, regexstr, string.Empty, RegexOptions.IgnoreCase);
            content = Regex.Replace(content, "<script([^>])*?>", string.Empty, RegexOptions.IgnoreCase);
            content = Regex.Replace(content, "</script>", string.Empty, RegexOptions.IgnoreCase);

            regexstr = @" href *= *[\s\S]*?script *:.+?""";
            //content = Regex.Replace(content, regexstr, string.Empty, RegexOptions.IgnoreCase);

            regexstr = @" on\w+?="".+?"" ";
            content = Regex.Replace(content, regexstr, " ", RegexOptions.IgnoreCase);

            return content;
        }

        public static string FilterIFrame(string content)
        {
            if (string.IsNullOrEmpty(content) == true)
            {
                return content;
            }
            string regexstr = @"(?i)<iframe([^>])*>(\w|\W)*</iframe([^>])*>";//@"<script.*</script>";
            content = Regex.Replace(content, regexstr, string.Empty, RegexOptions.IgnoreCase);
            content = Regex.Replace(content, "<iframe([^>])*>", string.Empty, RegexOptions.IgnoreCase);
            return Regex.Replace(content, "</iframe>", string.Empty, RegexOptions.IgnoreCase);
        }

        public static string FilterFrameset(string content)
        {
            if (string.IsNullOrEmpty(content) == true)
            {
                return content;
            }
            string regexstr = @"(?i)<iframe([^>])*>(\w|\W)*</frameset([^>])*>";//@"<script.*</script>";
            content = Regex.Replace(content, regexstr, string.Empty, RegexOptions.IgnoreCase);
            content = Regex.Replace(content, "<frameset([^>])*>", string.Empty, RegexOptions.IgnoreCase);
            return Regex.Replace(content, "</frameset>", string.Empty, RegexOptions.IgnoreCase);
        }
        /// <summary>
        /// 过滤特殊符号，只剩汉字或字符
        /// </summary>
        /// <param name="content"></param>
        /// <returns></returns>
        public static string FilterSymbol(string content)
        {
            string PATTERN = @"[^0-9A-z\u4e00-\u9fa5]";
            content = Regex.Replace(content, PATTERN, string.Empty, RegexOptions.IgnoreCase);
            //content = Regex.Replace(content, @"[_\^\[\]\\]", string.Empty, RegexOptions.IgnoreCase);
            return content;
        }
        public static string FilterHidden(string content)
        {
            //<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
            if (string.IsNullOrEmpty(content) == true)
            {
                return content;
            }
            string regexstr = @"(?i)<input[^>]*type=""?hidden""?[^>]*>";
            content = Regex.Replace(content, regexstr, string.Empty, RegexOptions.IgnoreCase);
            return content;
        }
        //Regex.Replace(html, @"<form[\S|\s]+?>", "<form>", RegexOptions.IgnoreCase);
        public static string FilterForm(string content)
        {
            if (string.IsNullOrEmpty(content) == true)
            {
                return content;
            }
            string regexstr = @"<form[\S|\s]+?>";
            content = Regex.Replace(content, regexstr, "<form>", RegexOptions.IgnoreCase);
            return content;
        }
        public static string FilterUnsafe(string content)
        {
            if (string.IsNullOrEmpty(content) == true)
            {
                return content;
            }
            content = Regex.Replace(content, "\n", "@#@#@");
            content = RemoveHtml(content);
            content = FilterForm(content);
            content = FilterFrameset(content);
            content = FilterHidden(content);
            content = FilterIFrame(content);
            content = FilterScript(content);
            content = Regex.Replace(content, "@#@#@", "\n");
            content = Regex.Replace(content, "\n+", "\n");
            return content;
        }
        #endregion

        #region =txt to Html=
        public static string TxtToHtml(string text)
        {
            if (string.IsNullOrEmpty(text)) return string.Empty;
            text = Regex.Replace(text, "\n", "<br />");
            return text;
        }
        #endregion
    }
}
