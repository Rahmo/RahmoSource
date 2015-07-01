using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Compilation;
using System.Web.Security;
using ICStars2_0.Common;
using ICStars2_0.Common.Attributes;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Framework
{
    public class ICStars2_0HandlerFactory : IHttpHandlerFactory
    {
        public string GetVirtualPath(string url, HttpContext context)
        {
            BrowserInfo bi = new BrowserInfo(context);
            return Regex.Replace(url, bi.SiteRoot, string.Empty, RegexOptions.IgnoreCase);
        }

        public IHttpHandler GetHandler(HttpContext context, string requestType, string url, string pathTranslated)
        {
            string virtualpath = GetVirtualPath(url, context);

            IHttpHandler handler =
                BuildManager.CreateInstanceFromVirtualPath(virtualpath, typeof (IHttpHandler)) as IHttpHandler;
            if (handler == null)
            {
                return null;
            }

            object[] attributes = handler.GetType().GetCustomAttributes(typeof(AuthorizeAttribute), true);

            if (attributes != null && attributes.Length > 0)
            {
                if (!context.Request.IsAuthenticated)
                {
                    return new LogoutHandler();
                }
                if (context.Request.Url.AbsolutePath.StartsWith("/SHTracker",
                            StringComparison.InvariantCultureIgnoreCase))
                {
                    if (string.IsNullOrEmpty(Common.SteansCookie.SteansCookieHelper.GetQuarterYear))
                    {
                        return new LogoutHandler();
                    }
                }
                var roles = ((AuthorizeAttribute)attributes[0]).Roles;
                if (!string.IsNullOrEmpty(roles) && !IsInRoles(roles, Roles.GetRolesForUser()))
                {
                    return new UnAuthorizedHandler();
                }
            }
            return (IHttpHandler)ICStarsUnityContainer.Current.Resolve(handler.GetType());
        }

        private static bool IsInRoles(string nodeRoles, IEnumerable<string> userroles)
        {
            foreach (string role in nodeRoles.Split(','))
            {
                if (role.Equals("*")) return true;
                if (userroles.Contains("*")) return true;
                if (userroles.Contains(role)) return true;
            }
            return false;
        }
        public void ReleaseHandler(IHttpHandler handler)
        {

        }
    }
}
