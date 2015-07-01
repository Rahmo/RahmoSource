using System.Data.Entity;

namespace ICStars2_0.Model.DbContexts
{
    public class MemberDbContext : DbContext
    {
        public MemberDbContext()
            : base("icstars")
        {
        }
        public DbSet<Member> Members { get; set; }
        public DbSet<Member2Role> Member2Roles { get; set; }
        public DbSet<Role> Roles { get; set; }
    }
}
