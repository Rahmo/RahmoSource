using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using ICStars2_0.BusinessLayer.LogServices;
using ICStars2_0.Common;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;
using log4net;

namespace ICStars2_0.BusinessLayer.HttpModules
{
    public class LoggingHttpModule : IHttpModule
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(LoggingHttpModule));
        [Dependency]
        public ISHTrackerLogFactory SHTrackerLogFactory { get; set; }

        public void Init(HttpApplication context)
        {
            SHTrackerLogFactory = ICStarsUnityContainer.Current.Resolve<ISHTrackerLogFactory>();
            context.EndRequest += delegate
                {
                    #region =log=

                    if (!context.Request.IsAuthenticated) return;
                    var extensions = new[] {".js",".css",".jpg",".jpeg",".png",".ico",".gif",".tif"};
                    if (
                        extensions.Any(
                            s =>
                            s.Equals(System.IO.Path.GetExtension(context.Request.Url.LocalPath),
                                     StringComparison.InvariantCultureIgnoreCase)))
                    {
                        return;
                    }
                    if (!context.Request.Url.AbsolutePath.StartsWith(Config.SHTrackerRoot,
                                                                    StringComparison.InvariantCultureIgnoreCase))
                    {
                        return;
                    }
                    var startsArray = new[]
                        {
                            "/ShTracker/Log/List.aspx", "/ShTracker/Top.aspx", "/ShTracker/Left.aspx"
                            , "/ShTracker/Right.aspx", "/ShTracker/Default.aspx","/SHTracker/Bottom.htm","/SHTracker/Center.htm","/SHTracker/Database/GetBackupStatus"
                        };
                    if (startsArray.Any(s => context.Request.Url.AbsolutePath.StartsWith(s,
                                                                                         StringComparison
                                                                                             .InvariantCultureIgnoreCase)))
                    {
                        return;
                    }

                    if (!string.IsNullOrEmpty(context.Request.QueryString["unlog"]))
                    {
                        return;
                    }
                    var log = new SHTrackerLog();
                    log.CreateDate = DateTime.Now;
                    log.IP = BrowserInfo.GetIp();
                    log.Url = context.Request.Url.ToString();
                    if (context.Request.UrlReferrer != null) log.UrlReferrer = context.Request.UrlReferrer.ToString();
                    log.UserName = context.User == null ? null : context.User.Identity.Name;
                    SHTrackerLogFactory.Update(log);

                    #endregion
                };
        }

        public void Dispose()
        {

        }
    }
}
