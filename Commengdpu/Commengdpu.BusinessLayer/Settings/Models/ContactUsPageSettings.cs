using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Web;

namespace Commengdpu.BusinessLayer.Settings.Models
{
    public class ContactUsPageSettings : BasePageSettings, ISettings
    {
        public string FilePath
        {
            get { return HttpContext.Current.Server.MapPath("/App_Data/Settings/ContactUsPageSettings.xml"); }
        }
        
    }
}
