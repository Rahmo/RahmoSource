using System.Web.Mvc;

namespace ICStars2_0.Areas.Calendar
{
    public class CalendarAreaRegistration : AreaRegistration
    {
        public override string AreaName
        {
            get
            {
                return "Calendar";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context)
        {
            context.MapRoute(
                "Calendar_default",
                "Calendar/{controller}/{action}/{id}",
                new { action = "Index",controller="Reservation", id = UrlParameter.Optional }
            );
        }
    }
}
