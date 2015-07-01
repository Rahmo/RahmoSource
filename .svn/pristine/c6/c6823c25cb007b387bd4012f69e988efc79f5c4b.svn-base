using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.SessionState;
using ICStars2_0.BusinessLayer.LogServices;
using ICStars2_0.Common;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.HttpHandlers
{
    public class LoggingIHttpHandler : IHttpHandler, IReadOnlySessionState
    {
        [Dependency]
        public ISHTrackerLogFactory SHTrackerLogFactory { get; set; }
        public void ProcessRequest(HttpContext context)
        {

            #region =log=

            var log = new SHTrackerLog();
            log.CreateDate = DateTime.Now;
            log.IP = BrowserInfo.GetIp();
            if (context != null)
            {
                log.Url = context.Request.Url.ToString();
                if (context.Request.UrlReferrer != null) log.UrlReferrer = context.Request.UrlReferrer.ToString();
                log.UserName = context.User.Identity.Name;
            }
            SHTrackerLogFactory.Update(log);

            #endregion
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}
