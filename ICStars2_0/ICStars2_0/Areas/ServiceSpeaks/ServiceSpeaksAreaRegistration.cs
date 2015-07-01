using System.Web.Mvc;

namespace ICStars2_0.Areas.ServiceSpeaks
{
    public class ServiceSpeaksAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "ServiceSpeaks";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "ServiceSpeaks_default",
                "ServiceSpeaks/{controller}/{action}/{id}",
                new { controller="Home", action = "Index", id = UrlParameter.Optional },
                new[] { "ICStars2_0.Areas.ServiceSpeaks.Controllers" }
            );
        }
    }
}
