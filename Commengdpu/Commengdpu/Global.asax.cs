using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using Commengdpu.App_Start;
using Commengdpu.BusinessLayer;
using Commengdpu.Models.DbContexts;
using ICStars2_0.Framework;
using ICStars2_0.Mvc;
using log4net;

namespace Commengdpu
{
    // Note: For instructions on enabling IIS6 or IIS7 classic mode, 
    // visit http://go.microsoft.com/?LinkId=9394801
    public class Global : System.Web.HttpApplication
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(Global));
        protected void Application_Start()
        {
#if DEBUG
            if (Config.IsOnline)
            {
                throw new Exception(string.Format("DEBUG model is not allowed! Please compile DLL by using RELEASE model. Error DLL name：{0}",
                                                  Assembly.GetAssembly(this.GetType()).FullName));
            }
#endif

            //FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);

            #region =Code First Entity Framework=

            Database.SetInitializer<DefaultDbContext>(null);
            Database.SetInitializer<RoleDbContext>(null);
            #endregion
            #region =Dependency Injection=

            ICStarsUnityFactory.RegisterDependency();

            ControllerBuilder.Current.SetControllerFactory(new ICStarsDependencyMvcControllerFactory());
            #endregion
            AreaRegistration.RegisterAllAreas();

            //WebApiConfig.Register(GlobalConfiguration.Configuration);

            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            //AuthConfig.RegisterAuth();

            log4net.Config.XmlConfigurator.Configure();
        }
    }
}