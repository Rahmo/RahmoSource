using System.Data.Entity;

namespace ICStars2_0.Model.DbContexts
{
    public class SHTrackerDbContext : DbContext
    {
        public SHTrackerDbContext()
            : base("icstars")
        {
        }
        public DbSet<Course> Courses { get; set; }
        public DbSet<Student> Students { get; set; }
        public DbSet<Student2CBO> Student2CBOs { get; set; }
        public DbSet<CBO> Cbos { get; set; }
        public DbSet<ServiceHours> ServiceHourses { get; set; }
        public DbSet<Member> Members { get; set; }
        public DbSet<Member2Role> Member2Roles { get; set; }
        public DbSet<Role> Roles { get; set; }
        public DbSet<CBOTask> CboTasks { get; set; }
        public DbSet<Course2CBOTask> Course2CboTasks { get; set; }
        public DbSet<Program> Programs { get; set; }
        public DbSet<Student2Program> Student2Programs { get; set; }

        

    }
}
