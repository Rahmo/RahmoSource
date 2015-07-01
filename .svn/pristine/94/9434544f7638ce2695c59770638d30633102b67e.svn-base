using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Text;
using ICStars2_0.Mvc.Filter;

namespace Commengdpu.BusinessLayer.Authentication
{
    public class AdminAuthorize : MvcAuthorize
    {
        public AdminAuthorize()
        {
            UnauthorizedRedirectUrl = "/Admin/Account/Login";
            IsRedirectOnly = true;
            IsRolesRequired = true;
        }

    }
}
