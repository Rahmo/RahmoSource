using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Common;
using ICStars2_0.Mvc.Filter;

namespace ICStars2_0.Areas.Steans.Controllers
{
    
    public class StaffController : Controller
    {
        //
        // GET: /Steans/Staff/
        [Authorize]
        [HtmlFilter(false)]
        public ActionResult AccessForm()
        {
            string relativePath = Request.QueryString["p"];
            string fullPath = string.Format("{1}/{0}", relativePath,Server.MapPath("/App_Data/Staff"));
            FileInfo file = new FileInfo(fullPath);
            //var s = file.Extension;
            //var ss = MimeExtensionHelper.GetMimeType(fullPath);
            return File(fullPath, MimeExtensionHelper.GetMimeType(fullPath),file.Name);
        }

    }
}
