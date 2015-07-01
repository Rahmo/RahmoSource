using System.Data.Entity;
using System.Security.Principal;

namespace Commengdpu.Models.DbContexts
{
    public class RoleDbContext : DbContext
    {
        public RoleDbContext()
            : base(Config.DefaultConnectionStringKey)
        {

            Configuration.LazyLoadingEnabled = false;
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<User2Role> User2Roles { get; set; }
    }
}
