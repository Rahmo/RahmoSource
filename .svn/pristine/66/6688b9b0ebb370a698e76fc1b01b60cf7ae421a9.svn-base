using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using ICStars2_0.Common.ConfigSections;

namespace ICStars2_0.Framework.HttpSecurity
{


    internal class RequestProcessor
    {
        public HttpContext Context { get; set; }
        public HttpsConfiguration Config { get; set; }
        public RequestProcessor(HttpContext context,HttpsConfiguration config)
        {
            Context = context;
            Config = config;
        }

        public void Process()
        {
            if (Context.Request.IsSecureConnection) return;
            IEnumerable<HttpsPath> pathLIst = Config.Paths.Cast<HttpsPath>();
            var ignorePaths = pathLIst.Where(p => p.Security == RequestSecurity.Ignore);
            var securePaths = pathLIst.Where(p => p.Security == RequestSecurity.Secure);
            PathsMatcher ignoreMatcher = new PathsMatcher(Context,ignorePaths);
            if (ignoreMatcher.IsMatch()) return;
            PathsMatcher secureMatcher = new PathsMatcher(Context, securePaths);
            if (!secureMatcher.IsMatch()) return;
            SecureRedirection secureRedirection=new SecureRedirection(Context,null);
            secureRedirection.Go();
        }
    }
}
