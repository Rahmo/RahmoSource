using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Linq.Expressions;
using System.Net.Configuration;
using System.Runtime.Remoting.Messaging;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.DbContexts;
using Commengdpu.Models.Settings;
using ICStars2_0.Common.Lambda;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Framework;

namespace Commengdpu.DBLayer
{
    class DbCommunityPartner:IDbCommunityPartner,ISingletonRegister
    {
        public int Insert(CommunityPartner model)
        {
            using (var db = new DefaultDbContext())
            {
                db.CommunityPartners.Add(model);
                return db.SaveChanges();
            }
        }

        public int Update(CommunityPartner model)
        {
            using (var db = new DefaultDbContext())
            {
                db.Entry(model).State = EntityState.Modified;
                return db.SaveChanges();
            }
        }

        public int Delete(CommunityPartner model)
        {
            using (var db = new DefaultDbContext())
            {
                db.Entry(model).State = EntityState.Deleted;
                return db.SaveChanges();
            }
        }

        public CommunityPartner Create(int ID)
        {
            using (var db = new DefaultDbContext())
            {
                return
                    db.CommunityPartners.Include(
                        c => c.CommunityPartner2IndividualPartners.Select(i => i.IndividualPartner))
                        .Include(c=>c.Project2CommunityPartners.Select(i=>i.Project))
                        .FirstOrDefault(c => c.ID == ID);
            }
        }

        public CommunityPartner Create(string uniqueUrl)
        {
            using (var db = new DefaultDbContext())
            {
                return
                    db.CommunityPartners.Include(
                        c => c.CommunityPartner2IndividualPartners.Select(i => i.IndividualPartner))
                        .Include(c => c.Project2CommunityPartners.Select(i => i.Project))
                        .FirstOrDefault(c => c.UniqueUrl.Equals(uniqueUrl));
            }
        }

        public IEnumerable<CommunityPartnerForList> List(int top=10, CommunityPartnerCollectionSettings settings = null)
        {
            using (var db = new DefaultDbContext())
            {
                var sql = new StringBuilder();
                sql.AppendFormat("select TOP {0} ID,Name,UniqueUrl From CommunityPartner where 1=1", top);
                List<SqlParameter> param = null;
                if (settings != null)
                {
                    param = new List<SqlParameter>();
                    if (!string.IsNullOrEmpty(settings.NameKeywords))
                    {
                        param.Add(new SqlParameter("@keyword", SqlDbType.VarChar, 100) {Value = settings.NameKeywords});
                        if (settings.IsRanked)
                        {
                            sql.Length = 0;
                            sql.Append(
                                "select c.ID,c.Name,c.UniqueUrl,k.RANK From CommunityPartner as c inner join FREETEXTTABLE(CommunityPartner,name,@keyword) as k on c.ID=k.[KEY]");
                  
                        }
                        else
                        {
                            sql.Append(" AND freetext(name,@keyword)");
                        }
                    }
                    if (!string.IsNullOrEmpty(settings.NameKeywords) && settings.IsRanked)
                    {
                        sql.Append(" ORDER BY k.RANK DESC");
                    }
                }
                return db.Database.SqlQuery<CommunityPartnerForList>(sql.ToString(), param.ToArray()).ToList();
            }
        }

        public IEnumerable<CommunityPartner> List(int pageIndex, int pageSize, CommunityPartnerCollectionSettings settings = null)
        {
            using (var db = new DefaultDbContext())
            {
                var predicate = BuildPredicate(db, settings);
                return db.CommunityPartners.Where(predicate).OrderByDescending(a => a.ID)
                    .Skip((pageIndex - 1)*pageSize)
                    .Take(pageSize)
                    .Select(c=>new
                    {
                        c,
                        Creator =
                            db.Users.Where(u => u.ID == c.CreatorUserID)
                                .Select(u => new { Name = u.FirstName + ", " + u.LastName })
                                .FirstOrDefault(),
                        LastEditor =
                            db.Users.Where(u => u.ID == c.LastEditorUserID)
                                .Select(u => new { Name = u.FirstName + ", " + u.LastName })
                                .FirstOrDefault()
                    })
                    .AsNoTracking().ToList().Select(c =>
                    {
                        var r = ReflectionHelper.Fill(c.c, new CommunityPartner());
                        r.Creator = c.Creator != null ? c.Creator.Name : "";
                        r.LastEditor = c.LastEditor != null ? c.LastEditor.Name : "";
                        return r;
                    });
            }
        }

        public int Count(CommunityPartnerCollectionSettings settings = null)
        {
            using (var db = new DefaultDbContext())
            {
                var predicate = BuildPredicate(db, settings);
                return db.CommunityPartners.Where(predicate).AsNoTracking().Count();
            }
        }

        public bool ExistsUniqueUrl(string nameUrl)
        {
            using (var db = new DefaultDbContext())
            {
                return db.CommunityPartners.Any(a => a.UniqueUrl.Equals(nameUrl));
            }
        }
        /// <summary>
        /// Build a Lambda expression as a condition to filter Community Partners
        /// </summary>
        /// <param name="db">DefaultDbContext</param>
        /// <param name="settings">CommunityPartnerCollectionSettings</param>
        /// <returns>Lambda expression for "Where"</returns>
        private Expression<Func<CommunityPartner, bool>> BuildPredicate(DefaultDbContext db, CommunityPartnerCollectionSettings settings)
        {
            var predicate = PredicateBuilder.True<CommunityPartner>();

            if (settings != null)
            {
                if (!string.IsNullOrEmpty(settings.NameKeywords))
                {
                    predicate = predicate.And(c => c.Name.StartsWith(settings.NameKeywords));
                }

            }
            return predicate;
        } 
    }
}
