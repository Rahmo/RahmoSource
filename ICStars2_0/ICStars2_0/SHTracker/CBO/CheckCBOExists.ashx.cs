using System;
using System.Collections.Generic;
using System.Web;
using ICStars2_0.BusinessLayer.CBOServices;
using ICStars2_0.Common.Attributes;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.CBO
{

    [Authorize(Roles = "admin,admin_cbo,Staff")]
    public class CheckCBOExists : IHttpHandler
    {
        private ICBOFactory _cboFactory;
        [Dependency]
        public ICBOFactory CBOFactory
        {
            get { return _cboFactory; }
            set { _cboFactory = value; }
        }
        #region IHttpHandler Members

        public bool IsReusable
        {
            // Return false in case your Managed Handler cannot be reused for another request.
            // Usually this would be false in case you have some state information preserved per request.
            get { return false; }
        }

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Clear();

            string s = context.Request.QueryString["qk"];
            string username = context.Request.QueryString[s];
            if (string.IsNullOrEmpty(username))
            {
                context.Response.Write("false");
                context.Response.End();
                return;
            }
            bool result = !CBOFactory.Exists(username);
            context.Response.Write(result.ToString().ToLower());
        }

        #endregion
    }
}