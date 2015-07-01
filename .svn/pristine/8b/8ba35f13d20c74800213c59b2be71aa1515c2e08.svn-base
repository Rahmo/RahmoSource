using System.Web.Mvc;

namespace ICStars2_0.Areas.MCI
{
    public class MCIAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "MCI";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "MCI_default",
                "MCI/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new[] { "ICStars2_0.Areas.MCI.Controllers" }
            );
        }
    }
}
