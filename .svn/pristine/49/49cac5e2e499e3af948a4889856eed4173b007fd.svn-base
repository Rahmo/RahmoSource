using System;
using System.Security.Cryptography;
using System.Text;

namespace ICStars2_0.Common
{
    public static class MathHelper
    {
        public static string Md5(string str)
        {
            byte[] TemData = Encoding.Default.GetBytes(str);
            MD5 md5 = new MD5CryptoServiceProvider();
            string EncodeStr = BitConverter.ToString(md5.ComputeHash(TemData)).Replace("-", "");
            return EncodeStr;
        }
        public static string Md5Web(string str)
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5");
        }
    }
}
