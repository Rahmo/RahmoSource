using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;

namespace ICStars2_0.Common
{
    public static class MimeExtensionHelper
    {
        static object locker = new object();
        static object mimeMapping;
        static readonly MethodInfo GetMimeMappingMethodInfo;

        static MimeExtensionHelper()
        {
            Type mimeMappingType = Assembly.GetAssembly(typeof(HttpRuntime)).GetType("System.Web.MimeMapping");
            if (mimeMappingType == null)
                throw new SystemException("Couldnt find MimeMapping type");
            GetMimeMappingMethodInfo = mimeMappingType.GetMethod("GetMimeMapping", BindingFlags.Static | BindingFlags.NonPublic | BindingFlags.Public);
            if (GetMimeMappingMethodInfo == null)
                throw new SystemException("Couldnt find GetMimeMapping method");
            if (GetMimeMappingMethodInfo.ReturnType != typeof(string))
                throw new SystemException("GetMimeMapping method has invalid return type");
            if (GetMimeMappingMethodInfo.GetParameters().Length != 1 && GetMimeMappingMethodInfo.GetParameters()[0].ParameterType != typeof(string))
                throw new SystemException("GetMimeMapping method has invalid parameters");
        }
        public static string GetMimeType(string filename)
        {
            lock (locker)
                return (string)GetMimeMappingMethodInfo.Invoke(mimeMapping, new object[] { filename });
        }
    }
}
