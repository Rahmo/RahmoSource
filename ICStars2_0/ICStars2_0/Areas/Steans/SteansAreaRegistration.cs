using System.Web.Mvc;

namespace ICStars2_0.Areas.Steans
{
    public class SteansAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Steans";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Steans_default",
                "Steans/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new[] { "ICStars2_0.Areas.Steans.Controllers" }
            );
        }
    }
}
