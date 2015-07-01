using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace ICStars2_0.BusinessLayer.SteansSettings.Model
{
    public class QuarterListSettings:ISettings
    {
        public string FilePath {
            get
            {
                return HttpContext.Current == null
                           ? string.Format("{0}/App_Data/Settings/QuarterListSettings.xml",
                                           Config.SiteLocalRootPath)
                           : HttpContext.Current.Server.MapPath("/App_Data/Settings/QuarterListSettings.xml");
            }
        }

        public string[] QuarterList { get; set; }
        public string CurrentQuarter { get; set; }
        public QuarterListSettings()
        {
            QuarterList = new string[] {};

        }
    }
}
