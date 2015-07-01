using System.Data.Entity;

namespace ICStars2_0.Model.DbContexts
{
    public class WebDbContext:DbContext
    {
        public WebDbContext()
            : base("icstars")
        {
        }
        public DbSet<WebsiteNav> WebsiteNavProfiles { get; set; }
        public DbSet<WebPage> WebPages { get; set; }

        public DbSet<CalendarEvent> CalendarEvents { get; set; }

        public DbSet<Member> Members { get; set; }
        public DbSet<CalendarEventRepeatSettings> CalendarEventRepeatSettingses { get; set; }
        public DbSet<CalendarEventDeletedDate> CalendarEventDeletedDates { get; set; }
    }
}
