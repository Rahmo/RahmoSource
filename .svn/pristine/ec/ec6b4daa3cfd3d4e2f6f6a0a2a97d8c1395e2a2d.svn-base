using System;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.Common;
using log4net;

namespace ICStars2_0.Mvc.Filter
{
    [AttributeUsage(AttributeTargets.All,AllowMultiple=true)]
    public class MvcAuthorize : FilterAttribute, IAuthorizationFilter 
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(MvcAuthorize));
        

        public string Roles { get; set; }
        /// <summary>
        /// To be authorized, the user must at lease have one role.
        /// </summary>
        public bool IsRolesRequired { get; set; }
        public string Users { get; set; }
        public string UnauthorizedRedirectUrl { get; set; }
        /// <summary>
        /// True Redirect to login url
        /// Fase If logined without authorized roles, stop redirecting and show error content
        /// </summary>
        public bool IsRedirectOnly { get; set; }
        public bool Disabled { get; set; }

        #region IAuthorizationFilter
        internal virtual void OnAuthorizing(AuthorizationContext filterContext)
        {
            if (Disabled) return;
            if (DetectMvcOverrideAuthorize(filterContext)) return;
            var result = Authorize(filterContext);
            if (result != null)
            {
                filterContext.Result = result;
            }
        }
        private bool DetectMvcOverrideAuthorize(AuthorizationContext filterContext)
        {
            var action = filterContext.ActionDescriptor;
            return action.IsDefined(typeof(MvcOverrideAuthorize), true);
        }

        internal ActionResult Authorize(AuthorizationContext filterContext)
        {
            try
            {

                if (!filterContext.HttpContext.Request.IsAuthenticated)
                {
                    return BuildUnauthorizedResult(filterContext);
                }
                if (
                    filterContext.HttpContext.Request.Url != null && filterContext.HttpContext.Request.Url.AbsolutePath.StartsWith("/SHTracker",
                        StringComparison.InvariantCultureIgnoreCase))
                {
                    if (string.IsNullOrEmpty(Common.SteansCookie.SteansCookieHelper.GetQuarterYear))
                    {
                        return BuildUnauthorizedResult(filterContext);
                    }

                }

                if (!string.IsNullOrEmpty(Users))
                {
                    var userarray = Users.Split(',');
                    if (userarray.Contains(filterContext.HttpContext.User.Identity.Name))
                        return null;
                }
                var userRoles =
                    System.Web.Security.Roles.GetRolesForUser(filterContext.HttpContext.User.Identity.Name);
                if (userRoles.Length == 0 && IsRolesRequired)
                {
                    return BuildUnauthorizedResult(filterContext);
                }
                if (!string.IsNullOrEmpty(Roles))
                {
                    var rolearray = Roles.Split(',');
                    if (!userRoles.Any(rolearray.Contains))
                    {
                        return BuildUnauthorizedResult(filterContext);
                    }
                }
                if (!IsRolesRequired && string.IsNullOrEmpty(Users) && string.IsNullOrEmpty(Roles))
                {
                    return null;
                }
            }
            catch (Exception exp)
            {
                string useragent = string.Empty;
                string url = string.Empty;
                string urlReferrer = string.Empty;
                if (HttpContext.Current != null)
                {
                    useragent = HttpContext.Current.Request.UserAgent;
                    url = string.Format("{0}", HttpContext.Current.Request.Url);

                    urlReferrer = string.Format("{0}", HttpContext.Current.Request.UrlReferrer);
                }
                Logger.Error(
                    string.Format(
                        "UserName:{0}\r\nIP:{1}\r\nUserAgent:{2}\r\nURL:{3}\r\nURLReferrer:{4}\r\nMessage:{5}\r\nSource:{6}",
                        HttpContext.Current != null ? HttpContext.Current.User.Identity.Name : "",
                        BrowserInfo.GetIp(), useragent,
                        url, urlReferrer, exp.Message,
                        exp.StackTrace),exp);
                return new ContentResult() {Content = "Error! Please contact the administrator!"};
            }
            return null;
        }
        public void OnAuthorization(AuthorizationContext filterContext)
        {
            OnAuthorizing(filterContext);
        }

        private ActionResult BuildUnauthorizedResult(AuthorizationContext filterContext)
        {
            if (!IsRedirectOnly) return new ContentResult() {Content = "You are not allowed to access！"};
            if (filterContext.HttpContext.Request.IsAjaxRequest())
            {
                return new JsonResult() { Data = "unauthorized", JsonRequestBehavior = JsonRequestBehavior.AllowGet };
            }
            if (!string.IsNullOrEmpty(UnauthorizedRedirectUrl))
            {
                return
                    new RedirectResult(UnauthorizedRedirectUrl + "?returnUrl=" +
                                       filterContext.HttpContext.Request.Url.AbsolutePath);
            }
            return new HttpUnauthorizedResult();
        }
        #endregion

    }
}
