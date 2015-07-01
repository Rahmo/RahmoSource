using System.Text.RegularExpressions;

namespace ICStars2_0.Common
{
    public static class ValidateHelper
    {
        /// <summary>
        /// 是否是数值类型
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool IsNumber(string str)
        {
            if (string.IsNullOrEmpty(str)) return false;
            return Regex.IsMatch(str,RegexHelper.Number);
        }
        /// <summary>
        /// 是否Email
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool IsEmail(string str)
        {
            if (string.IsNullOrEmpty(str)) return false;
            return Regex.IsMatch(str, RegexHelper.Email);
        }
        /// <summary>
        /// 是否电话号码,格式010-66525245
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool IsPhone(string str)
        {
            if (string.IsNullOrEmpty(str)) return false;
            return Regex.IsMatch(str, RegexHelper.Phone);
        }
        /// <summary>
        /// 是否手机号,格式13612345678
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool IsMobile(string str)
        {
            if (string.IsNullOrEmpty(str)) return false;
            return Regex.IsMatch(str, RegexHelper.Mobile);
        }
        /// <summary>
        /// 验证是否是中文
        /// </summary>
        /// <param name="str"></param>
        /// <returns></returns>
        public static bool IsChinese(string str)
        {
            return Regex.IsMatch(str, RegexHelper.Chinese);
        }
    }
}
