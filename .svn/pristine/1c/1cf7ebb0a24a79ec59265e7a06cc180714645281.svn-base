using System;
using System.Configuration;
using System.Linq;
using System.Web;
using ICStars2_0.Common.ConfigSections;

namespace ICStars2_0.Framework.HttpSecurity
{
    public class HttpSecurityModule : IHttpModule
    {
        private HttpsConfiguration _config { get; set; }
        
        public void Init(HttpApplication context)
        {
            _config = ConfigurationManager.GetSection("HttpsConfiguration") as HttpsConfiguration;

            if (_config == null || _config.Mode == Mode.Off)
            {
                return;
            }

            context.BeginRequest += context_AcquireRequestState;

        }
       
        void context_AcquireRequestState(object sender, EventArgs e)
        {
            var application = sender as HttpApplication;
            RequestProcessor rp=new RequestProcessor(application.Context,_config);
            rp.Process();
        }
        public void Dispose()
        {
            
        }
    }
}
