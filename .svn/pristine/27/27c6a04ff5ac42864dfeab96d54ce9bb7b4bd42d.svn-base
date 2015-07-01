using System;
using ICStars2_0.Framework;

namespace Commengdpu.BusinessLayer.Provider
{
    /// <summary>
    /// Get logined user information
    /// </summary>
    public interface IUserData
    {
        int ID { get; }
        string DPUID { get; }
        string QuarterYear { get; }
        string[] QuarterYears { get; }
        string RealName { get; }
    }

    class UserData : IUserData,ISingletonRegister
    {
        public int ID {get { return Convert.ToInt32(Get("ID")); } }
        public string DPUID { get { return Get("DPUID"); } }

        public string QuarterYear
        {
            get { return Get("QuarterYear"); }
        }

        public string[] QuarterYears
        {
            get
            {
                return QuarterYear.IndexOf(',') < 0 ? null : QuarterYear.Split(',');
            }
        }

        public string RealName
        {
            get { return Get("RealName"); }
        }

        private string Get(string key)
        {
            return ICStars2_0.Common.SteansCookie.SteansCookieHelper.Get(key);
        }
    }
}
