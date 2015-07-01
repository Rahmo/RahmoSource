using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using ICStars2_0.Common.ConfigSections;

namespace ICStars2_0.Framework.HttpSecurity
{
    internal class SecureRedirection
    {
        public HttpContext Context { get; set; }
        public string TargetUrl { get; set; }
        public SecureRedirection(HttpContext context, string targetUrl)
        {
            Context = context;
            TargetUrl = targetUrl;
        }

        public void Go()
        {
            Context.Response.StatusCode = 301;
            Context.Response.RedirectLocation = TargetUrl ?? Context.Request.Url.AbsoluteUri.Replace("http://", "https://");
            Context.Response.End();
        }
    }
}
