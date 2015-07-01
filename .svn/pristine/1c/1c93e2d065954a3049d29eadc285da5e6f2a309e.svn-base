using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.DbContexts;
using Commengdpu.Models.Reports;
using Commengdpu.Models.Settings;
using ICStars2_0.Common;
using ICStars2_0.Common.Lambda;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Framework;

namespace Commengdpu.DBLayer
{
    class DbProject : IDbProject, ISingletonRegister
    {
        public int Insert(Project project)
        {
            using (var db = new DefaultDbContext())
            {
                db.Projects.Add(project);
                return db.SaveChanges();
            }
        }

        public int Update(Project project)
        {
            using (var db = new DefaultDbContext())
            {
                db.Entry(project).State = EntityState.Modified;
                return db.SaveChanges();
            }
        }

        public int Delete(Project project)
        {
            using (var db = new DefaultDbContext())
            {
                db.Entry(project).State = EntityState.Deleted;
                return db.SaveChanges();
            }
        }

        public Project Create(int ID)
        {
            using (var db = new DefaultDbContext())
            {
                return
                    db.Projects.Include(p => p.Project2Categories.Select(p2c => p2c.Category))
                        .Include(p => p.Project2CommunityPartners.Select(p2cp => p2cp.CommunityPartner))
                        .Include(p=>p.Project2IndividualPartners.Select(p2ip=>p2ip.IndividualPartner))
                        .Include(p=>p.Project2Types.Select(p2t=>p2t.ProjectType))
                        .FirstOrDefault(p => p.ID == ID);
            }
        }

        public Project Create(string uniqueUrl)
        {
            using (var db = new DefaultDbContext())
            {
                return
                    db.Projects.Include(p => p.Project2Categories.Select(p2c => p2c.Category))
                        .Include(p => p.Project2CommunityPartners.Select(p2cp => p2cp.CommunityPartner))
                        .Include(p => p.Project2IndividualPartners.Select(p2ip => p2ip.IndividualPartner))
                        .Include(p => p.Project2Types.Select(p2t => p2t.ProjectType))
                        .FirstOrDefault(p => p.ProjectUniqueUrl.Equals(uniqueUrl));
            }
        }

        public IEnumerable<ProjectForList> List(int top=10, ProjectCollectionSettings settings = null)
        {
            using (var db = new DefaultDbContext())
            {
                var sql = new StringBuilder("select ID,Name,ProjectUniqueUrl,Description,Thumbnail,[Address],City,County,[State],ZipCode From Project where 1=1");
                List<SqlParameter> param = null;
                if (settings != null)
                {
                    param = new List<SqlParameter>();
                    if (!string.IsNullOrEmpty(settings.NameKeywords))
                    {
                        param.Add(new SqlParameter("@keyword", SqlDbType.VarChar, 100) { Value = settings.NameKeywords });
                        if (settings.IsRanked)
                        {
                            sql.Length = 0;
                            sql.AppendFormat(
                                "select c.ID,c.Name,c.ProjectUniqueUrl,c.Description,c.Thumbnail,c.[Address],c.City,c.County,c.[State],c.ZipCode,k.RANK From Project as c inner join FREETEXTTABLE(Project,({0}),@keyword) as k on c.ID=k.[KEY]", settings.FulltextIndexFields);

                        }
                        else
                        {
                            sql.AppendFormat(" AND freetext(({0}),@keyword)",settings.FulltextIndexFields);
                        }
                    }
                    if (!string.IsNullOrEmpty(settings.NameKeywords) && settings.IsRanked)
                    {
                        sql.Append(" ORDER BY k.RANK DESC");
                    }
                }
                return db.Database.SqlQuery<ProjectForList>(sql.ToString(), param.ToArray()).ToList();
            }
        }
        public IEnumerable<Project> List(int pageIndex, int pageSize, string[] categories)
        {
            //with Categories(ID,ParentID,Name)
            //as
            //(
            //    select ID,ParentID,Name from Category where name in ('Impact Areas','Activities','sub-activ')
            //    UNION ALL select a.ID,a.ParentID,a.Name from Category as a join Categories as b on a.ParentID=b.ID
            //)
            //--select * from Categories
            //select top 10 ID from project where exists(
            //    select null as empty from Project2Category where ProjectID=project.ID
            //    and exists(
            //        select null as empty from Categories where Project2Category.CategoryID=ID
            //    )
            //)
            
            var parms = new List<SqlParameter>();
            for (int i = 0; i < categories.Length; i++)
            {
                parms.Add(new SqlParameter("@category"+i,SqlDbType.VarChar,100){Value=categories[i]});
            }
            var cte = string.Format(@";with Categories(ID,ParentID,Name)
            as
            (
                select ID,ParentID,Name from Category where name in ({0})
                UNION ALL select a.ID,a.ParentID,a.Name from Category as a join Categories as b on a.ParentID=b.ID
            )", parms.Select(p => p.ParameterName).Aggregate((x, y) => x + "," + y));
            var fp = new FastPaging
            {
                PageIndex = pageIndex,
                PageSize = pageSize,
                TableName = "Project",
                TableReName="p",
                QueryFields = "*",
                PrimaryKey = "ID",
                Ascending = FastPaging.IsAscending("DESC"),
                Condition = @"exists(
                select null as empty from Project2Category where ProjectID=p.ID
                and exists(
                    select null as empty from Categories where Project2Category.CategoryID=ID
                )
            )"
            };
            using (var db = new DefaultDbContext())
            {
                return db.Database.SqlQuery<Project>(cte + fp.Build2005(), parms.ToArray()).ToList();
            }
        }
        public int Count(string[] categories)
        {
            var parms = new List<SqlParameter>();
            for (int i = 0; i < categories.Length; i++)
            {
                parms.Add(new SqlParameter("@category" + i, SqlDbType.VarChar, 100){Value=categories[i]});
            }
            var sql = string.Format(@";with Categories(ID,ParentID,Name)
            as
            (
                select ID,ParentID,Name from Category where name in ({0})
                UNION ALL select a.ID,a.ParentID,a.Name from Category as a join Categories as b on a.ParentID=b.ID
            )
            select count(*) from project where exists(
                select null as empty from Project2Category where ProjectID=project.ID
                and exists(
                    select null as empty from Categories where Project2Category.CategoryID=ID
                )
            )
", parms.Select(p => p.ParameterName).Aggregate((x, y) => x + "," + y));
            
            using (var db = new DefaultDbContext())
            {
                return db.Database.SqlQuery<int>(sql, parms.ToArray()).Single();
            }
        }
        public IEnumerable<Project> List(int pageIndex, int pageSize, ProjectCollectionSettings settings = null)
        {
            using (var db = new DefaultDbContext())
            {
                if (settings != null)
                {
                    if (settings.IsShowCreatorEditor)
                    {
                        return db.Projects.OrderByDescending(a => a.ID)
                    .Skip((pageIndex - 1) * pageSize)
                    .Take(pageSize)
                    .Select(p => new
                    {
                        p,
                        Creator =
                            db.Users.Where(u => u.ID == p.CreatorUserID)
                                .Select(u => new { Name = u.FirstName + ", " + u.LastName })
                                .FirstOrDefault(),
                        LastEditor =
                            db.Users.Where(u => u.ID == p.LastEditorUserID)
                                .Select(u => new { Name = u.FirstName + ", " + u.LastName })
                                .FirstOrDefault()
                    })
                    .AsNoTracking().ToList().Select(p =>
                    {
                        var r = ReflectionHelper.Fill(p.p, new Project());
                        r.Creator = p.Creator != null ? p.Creator.Name : "";
                        r.LastEditor = p.LastEditor != null ? p.LastEditor.Name : "";
                        return r;
                    });
                    }
                }
                return db.Projects.OrderByDescending(a => a.ID)
                    .Skip((pageIndex - 1)*pageSize)
                    .Take(pageSize)
                    .AsNoTracking().ToList();
            }
        }

        public int Count(ProjectCollectionSettings settings=null)
        {
            using (var db = new DefaultDbContext())
            {
                return db.Projects.AsNoTracking().Count();
            }
        }
        public bool ExistsUniqueUrl(string nameUrl)
        {
            using (var db = new DefaultDbContext())
            {
                return db.Projects.Any(a => a.ProjectUniqueUrl.Equals(nameUrl));
            }
        }

        public OverrallBaseTotalReport BuildOverrallBaseTotalReports(ReportSettings settings = null)
        {
            using (var db = new DefaultDbContext())
            {
                var predicate = PredicateBuilder.True<Project>();
                if (settings != null)
                {
                    if (settings.StartDate != null && settings.EndDate != null)
                    {
                        predicate =
                            predicate.And(p => p.EndDate >= settings.StartDate &&
                                               p.StartDate <= settings.EndDate);
                    }
                }
                return new OverrallBaseTotalReport
                {
                    EstimatedNumberofIndividualsServed =
                        db.Projects.Where(predicate).AsNoTracking().Sum(p => p.EstimatedNumberofIndividualsServed),
                    NumberofStudentsServedAtLeast20HoursPerTerm =
                        db.Projects.Where(predicate).AsNoTracking().Sum(p => p.NumberofStudentsServedAtLeast20HoursPerTerm),
                    NumberofStudentsSupportedByCNSC =
                        db.Projects.Where(predicate).AsNoTracking().Sum(p => p.NumberofStudentsSupportedByCNSC)
                };
            }
        }

        /// <summary>
        /// Build a Lambda expression as a condition to filter projects
        /// </summary>
        /// <param name="db">DefaultDbContext</param>
        /// <param name="settings">ProjectCollectionSettings</param>
        /// <returns>Lambda expression for "Where"</returns>
        private Expression<Func<Project, bool>> BuildPredicate(DefaultDbContext db, ProjectCollectionSettings settings)
        {
            var predicate = PredicateBuilder.True<Project>();

            if (settings != null)
            {
                

            }
            return predicate;
        } 
    }
}
