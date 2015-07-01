using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ICStars2_0.Mvc.Filter
{
    public class CalendarAuthorize : MvcAuthorize
    {
        public CalendarAuthorize()
        {
            UnauthorizedRedirectUrl = "/Account/Calendar/Login?ReturnUrl=/Calendar";
            IsRedirectOnly = true;
        }
    }
    public class CalendarOverrideAuthorize : MvcOverrideAuthorize
    {
        public CalendarOverrideAuthorize()
        {
            UnauthorizedRedirectUrl = "/Account/Calendar/Login?ReturnUrl=/Calendar";
            IsRedirectOnly = true;
        }
    }
}
