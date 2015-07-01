using System;
using System.Collections.Generic;
using System.Web;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.Common.Attributes;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Account
{
    /// <summary>
    /// Summary description for CheckAccountExists
    /// </summary>
    [Authorize(Roles = "admin,admin_account,admin_account_slc")]
    public class CheckAccountExists : IHttpHandler
    {
        private IMemberFactory _memberFactory;

        [Dependency]
        public IMemberFactory MemberFactory
        {
            get { return _memberFactory; }
            set { _memberFactory = value; }
        }

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Clear();
            
            string s = context.Request.QueryString["qk"];
            string username = context.Request.QueryString[s];
            if(string.IsNullOrEmpty(username))
            {
                context.Response.Write("false");
                context.Response.End();
                return;
            }
            bool result = !MemberFactory.Exists(username);
            context.Response.Write(result.ToString().ToLower());
            context.Response.End();
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}