using System.Web;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.Common;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Account
{
    /// <summary>
    /// Summary description for CheckCampusConnectIDExists
    /// </summary>
    public class CheckCampusConnectIDExists : IHttpHandler
    {
        [Dependency]
        public IMemberFactory MemberFactory { get; set; }
        public void ProcessRequest(HttpContext context)
        {
            context.Response.Clear();
            if (!RequestHelper.IsAjaxRequest(context.Request)
                 || !RequestHelper.IsDePaulRequest(context.Request))
            {
                context.Response.Write("Unauthorized Request!");
                context.Response.End();
                return;
            }
            string s = context.Request.QueryString["qk"];
            string ccid = context.Request.QueryString[s];
            if (string.IsNullOrEmpty(ccid))
            {
                context.Response.Write("false");
                context.Response.End();
                return;
            }
            bool result = !MemberFactory.Exists(ccid);
            context.Response.Write(result.ToString().ToLower());
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