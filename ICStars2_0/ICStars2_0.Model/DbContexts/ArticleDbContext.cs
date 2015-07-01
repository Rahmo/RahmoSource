using System.Data.Entity;

namespace ICStars2_0.Model.DbContexts
{
    public class ArticleDbContext:DbContext
    {
        public ArticleDbContext()
            : base("icstars")
        {
        }
        public DbSet<Article> Articles { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<Article2Category> Article2Categories { get; set; }
    }
}
