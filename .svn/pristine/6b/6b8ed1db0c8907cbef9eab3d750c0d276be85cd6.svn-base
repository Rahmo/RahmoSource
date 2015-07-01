using System.Web.Mvc;

namespace ICStars2_0.Areas.SHTracker
{
    public class SHTrackerAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "SHTracker";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "SHTracker_List",
                "SHTracker/{controller}/{action}/{page}",
                new { page = 1 },
                new { page = @"\d+", action = @"\w*?List" },
                new[] { "ICStars2_0.Areas.SHTracker.Controllers" }
                );
            context.MapRoute(
                "SHTracker_default",
                "SHTracker/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional },
                new[] { "ICStars2_0.Areas.SHTracker.Controllers" }
            );
        }
    }
}
