using System.Data.Entity;

namespace ICStars2_0.Model.DbContexts
{
    public class OtherDbContext:DbContext
    {
        public OtherDbContext()
            : base("icstars")
        {
        }
        public DbSet<ProjectRequestForm> ProjectRequestFormProfiles { get; set; }
        public DbSet<Member> Members { get; set; }
        public DbSet<SHTrackerLog> ShTrackerLogs { get; set; }

        public DbSet<son_student> son_students { get; set; }
        public DbSet<son_cboprogram> son_cboprograms { get; set; }
        public DbSet<son_cbochoice> son_cbochoices { get; set; }
        public DbSet<MCI_TimeLog> MCI_TimeLogs { get; set; }
        public DbSet<MCI_Period> MCI_Periods { get; set; }

        public DbSet<MeridaExtensionApplication> MeridaExtensionApplications { get; set; }

       
    }
}
