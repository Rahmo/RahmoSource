using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.Profile;

namespace ICStars2_0.Model
{
    public class MyProfile:ProfileBase
    {
        public static MyProfile GetProfile()
        {
            return GetProfile(HttpContext.Current.User.Identity.Name);
        }
        public static MyProfile GetProfile(string username)
        {
            return Create(username) as MyProfile;
        }
        [SettingsAllowAnonymous(false)]
        public int ID
        {
            get { return (int)base["ID"]; }
            set { base["ID"] = value; }
        }
        [SettingsAllowAnonymous(false)]
        public string RealName
        {
            get { return base["RealName"] as string; }
            set { base["RealName"] = value; }
        }
        [SettingsAllowAnonymous(false)]
        public string QuarterYear
        {
            get { return base["QuarterYear"] as string; }
            set { base["QuarterYear"] = value; }
        }
    }
}
