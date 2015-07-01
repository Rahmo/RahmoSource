using System.Web;
using CampusConnect.MediatorLibrary;
using ICStars2_0.Common;

namespace ICStars2_0.Account
{
    /// <summary>
    /// Summary description for CheckCampusConnect
    /// </summary>
    public class CheckCampusConnect : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.Clear();
            if(!RequestHelper.IsAjaxRequest(context.Request)
                || !RequestHelper.IsDePaulRequest(context.Request))
            {
                context.Response.Write("Unauthorized Request!");
                context.Response.End();
                return;
            }
            string ccid = context.Request.QueryString["ccid"];
            string ccpwd = context.Request.QueryString["ccp"];
            if (string.IsNullOrEmpty(ccid) || string.IsNullOrEmpty(ccpwd))
            {
                context.Response.Write("false");
                context.Response.End();
                return;
            }
            ICampusConnectMediator ccMediaor = CampusConnectFactory.CreateCampusConnectMediaor();
            context.Response.Write(ccMediaor.GetEmplId(ccid,ccpwd).ToLower());
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