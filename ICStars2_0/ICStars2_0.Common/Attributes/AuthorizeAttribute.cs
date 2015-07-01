using System;
using System.Collections.Generic;
using System.Text;

namespace ICStars2_0.Common.Attributes
{
    [AttributeUsage(AttributeTargets.All)]
    public class AuthorizeAttribute : Attribute
    {
        private string _roles;

        public string Roles
        {
            get { return _roles; }
            set { _roles = value; }
        }
        private string _users;

        public string Users
        {
            get { return _users; }
            set { _users = value; }
        }

        public string UnauthorizedRedirectUrl { get; set; }
    }
}
