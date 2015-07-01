using System;
using System.Data.Entity;
using System.Reflection;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.WebPages;
using DataAnnotationsExtensions.ClientValidation;
using ICStars2_0.App_Start;
using ICStars2_0.Areas.SHTracker.Controllers;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Mvc;
using Microsoft.Practices.Unity;
using log4net;

namespace ICStars2_0
{
    public class Global : System.Web.HttpApplication
    {

        private static readonly ILog Logger = LogManager.GetLogger(typeof(Global));
        protected void Application_Start(object sender, EventArgs e)
        {
#if DEBUG
            if (Config.IsOnline)
            {
                throw new Exception(string.Format("DEBUG model is not allowed! Please compile DLL by using RELEASE model. Error DLL name：{0}",
                                                  Assembly.GetAssembly(this.GetType()).FullName));
            }
#endif
#if !DEBUG
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
#endif

            //DisplayModeProvider.Instance.Modes.Insert(0, new
            //    DefaultDisplayMode("mobile")
            //{
            //    ContextCondition = (context => context.GetOverriddenUserAgent().IndexOf
            //        ("iPhone", StringComparison.OrdinalIgnoreCase) >= 0 || context.Request.Browser.IsMobileDevice)
            //});
            #region =Code First Entity Framework=

            Database.SetInitializer<SHTrackerDbContext>(null);
            Database.SetInitializer<ArticleDbContext>(null);
            Database.SetInitializer<CourseDbContext>(null);
            Database.SetInitializer<OtherDbContext>(null);
            Database.SetInitializer<MemberDbContext>(null);
            Database.SetInitializer<WebDbContext>(null);
            Database.SetInitializer<MvpDbContext>(null);
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
            ICStarsUnityContainer.Current.Resolve<IMemberFactory>().CreateSuperAdminUser();
            DataAnnotationsModelValidatorProviderExtensions.RegisterValidationExtensions();
            #region =Register Timer=
            ScheduleTasksController.SetTimerAtApplicationStart();

            #endregion
        }

        protected void Session_Start(object sender, EventArgs e)
        {

        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {
            Exception objExp = Server.GetLastError().GetBaseException();
            if (objExp is HttpRequestValidationException)
            {
                Context.Server.ClearError();
                Response.Clear();
                Response.StatusCode = 200;
                Response.Redirect("/InvalidRequest.html");
                Response.End();
                return;
            }
            if (objExp != null)
            {
                Log4NetHelper.WriteLog(objExp, Logger);
            }
        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}