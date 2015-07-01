using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;

namespace ICStars2_0.Mvc.Filter
{
    [AttributeUsage(AttributeTargets.Method, AllowMultiple = true)]
    public class MvcOverrideAuthorize:MvcAuthorize
    {
        internal override void OnAuthorizing(AuthorizationContext filterContext)
        {
            if (Disabled) return;
            var result = Authorize(filterContext);
            if (result != null)
            {
                filterContext.Result = result;
            }
        }
    }
}
