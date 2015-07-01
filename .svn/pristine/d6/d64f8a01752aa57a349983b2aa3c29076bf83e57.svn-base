using System.Data.Entity;
using System.Security.Principal;

namespace Commengdpu.Models.DbContexts
{
    public class DefaultDbContext : DbContext
    {
        public DefaultDbContext()
            : base(Config.DefaultConnectionStringKey)
        {

            Configuration.LazyLoadingEnabled = false;
        }

        public DbSet<Category> Categories { get; set; }
        public DbSet<ProjectType> ProjectTypes { get; set; }
        public DbSet<CommunityPartner> CommunityPartners { get; set; }
        public DbSet<CommunityPartner2IndividualPartner> CommunityPartner2IndividualPartners { get; set; }
        public DbSet<IndividualPartner> IndividualPartners { get; set; }
        public DbSet<Project> Projects { get; set; }
        public DbSet<Project2Type> Project2Types { get; set; }
        public DbSet<Project2Category> Project2Categories { get; set; }
        public DbSet<Project2CommunityPartner> Project2CommunityPartners { get; set; }
        public DbSet<Project2IndividualPartner> Project2IndividualPartners { get; set; }
        public DbSet<User> Users { get; set; }
    }
}
