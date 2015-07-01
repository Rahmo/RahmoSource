using System.Data.Entity;

namespace ICStars2_0.Model.DbContexts
{
    public class CourseDbContext:DbContext
    {
        public CourseDbContext()
            : base("icstars")
        {
        }

        public DbSet<Course> Courses { get; set; }
        public DbSet<UniverseCourse> UniverseCourses { get; set; }
        public DbSet<HistoricalFaculty> HistoricalFaculties { get; set; }
        public DbSet<HistoricalCourse> HistoricalCourses { get; set; }
    }
}
