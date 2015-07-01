using System;
using System.Configuration;
using System.Reflection;

namespace ICStars2_0.Framework
{
    /// <summary>
    /// Debug模式检查器
    /// created by lihui 20110707
    /// </summary>
    public abstract class BaseDebugChecker
    {
        /// <summary>
        /// 是否DEBUG模式，是抛出异常
        /// </summary>
        public void IsDebug()
        {
#if DEBUG
            if (Convert.ToBoolean(ConfigurationManager.AppSettings["IsOnline"]))
            {

                throw new Exception(string.Format("DEBUG model is not allowed! Please compile DLL by using RELEASE model. Error DLL name：：{0}",
                                                  Assembly.GetAssembly(this.GetType()).GetName()));
            }
#endif
        }
    }
}
