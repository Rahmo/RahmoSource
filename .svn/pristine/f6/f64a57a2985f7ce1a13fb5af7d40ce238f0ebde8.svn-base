using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.ModelConfiguration.Conventions;
using System.Linq;
using System.Text;

namespace ICStars2_0.Model.DbContexts
{
     
  public  class MvpDbContext : DbContext
    {
        public MvpDbContext()
            : base("icstars")
        {
        }
        public DbSet<MVPSite> Sites { get; set; }
        public DbSet<Organization> Organizations { get; set; }
      public DbSet<Storyboard> Storyboards { get; set; }

      public DbSet<ImageGallery> ImageGallery { get; set; }
    
  
  
  }



}
