using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model.DbContexts
{
    public class GeoDbContext : DbContext 
    {
        public GeoDbContext()
            //This the one u use in the webconfig in connection string the name 
            : base("icstars")
        {
        }
        public DbSet<GEO133> GEO133 { get; set; }
        public DbSet<GeoOnlineInformation> GeoOnlineInformations { get; set; }
        public DbSet<GeoSiteData> GeoSiteDatas { get; set; }
    }
}
