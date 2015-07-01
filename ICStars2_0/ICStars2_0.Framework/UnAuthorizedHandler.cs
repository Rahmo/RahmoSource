using System;
using System.Collections.Generic;
using System.Text;
using System.Web;

namespace ICStars2_0.Framework
{
    public class UnAuthorizedHandler:IHttpHandler
    {
        public void ProcessRequest(HttpContext context)
        {
            context.Response.Write("You are not allowed to access！");
            context.Response.End();
        }

        public bool IsReusable
        {
            get { return false; }
        }
    }
    
}
