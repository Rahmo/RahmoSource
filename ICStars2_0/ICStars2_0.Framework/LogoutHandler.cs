using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace ICStars2_0.Framework
{
    public class LogoutHandler : IHttpHandler
    {
        public LogoutHandler()
        {
            RedirectUrl = "/Account/Logout";
        }
        public string RedirectUrl { get; set; }
        public void ProcessRequest(HttpContext context)
        {
            context.Response.Redirect(RedirectUrl);
            context.Response.End();
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
}
