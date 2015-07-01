using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Common.ConfigSections;
using ICStars2_0.Framework.HttpSecurity;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Framework
{
    public class ICStars2_0PageHandlerFactory : PageHandlerFactory
    {
        public override System.Web.IHttpHandler GetHandler(System.Web.HttpContext context, string requestType,
            string virtualPath, string path)
        {
            var page =
                base.GetHandler(context, requestType, virtualPath, path)
                    as Page;
            if (page == null) return null;
            var t = page.GetType();
            if (context == null) return (Page) ICStarsUnityContainer.Current.Resolve(t);
            #region =Obsolete See Web.config=

            //object[] httpsAttributes = t.GetCustomAttributes(typeof (HttpsAttribute), true);

            //if (httpsAttributes != null && httpsAttributes.Length > 0)
            //{
            //    if (!context.Request.IsSecureConnection)
            //    {
            //        SecureRedirection sRedirection = new SecureRedirection(context, null);
            //        sRedirection.Go();
            //    }
            //}

            #endregion
            var attributes = t.GetCustomAttributes(typeof (AuthorizeAttribute), true);

            if (attributes.Length <= 0) return (Page) ICStarsUnityContainer.Current.Resolve(t);
            var attr = (AuthorizeAttribute) attributes[0];
            if (!context.Request.IsAuthenticated)
            {
                return BuildLogoutHandler(attr.UnauthorizedRedirectUrl);
            }
            var isStudentApp = context.Request.Url.AbsolutePath.StartsWith("/SHTracker/StudentApp",
                StringComparison.InvariantCultureIgnoreCase);
        
            if (context.Request.Url.AbsolutePath.StartsWith("/SHTracker",
                StringComparison.InvariantCultureIgnoreCase) && !isStudentApp)
            {
                if (string.IsNullOrEmpty(Common.SteansCookie.SteansCookieHelper.GetQuarterYear))
                {
                    return BuildLogoutHandler(attr.UnauthorizedRedirectUrl);
                }
            }
            if (string.IsNullOrEmpty(attr.Roles) || IsInRoles(attr.Roles, Roles.GetRolesForUser()))
                return (Page) ICStarsUnityContainer.Current.Resolve(t);
            return isStudentApp ? BuildLogoutHandler(attr.UnauthorizedRedirectUrl) : new UnAuthorizedHandler();
        }

        private static IHttpHandler BuildLogoutHandler(string unauthorizedRedirectUrl)
        {
            var logout = new LogoutHandler();
            if (!string.IsNullOrEmpty(unauthorizedRedirectUrl))
            {
                logout.RedirectUrl = unauthorizedRedirectUrl;
            }
            return logout; ;
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
    }
}
