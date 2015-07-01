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
using Commengdpu.Models.Settings;
using ICStars2_0.Common.Lambda;
using ICStars2_0.Framework;

namespace Commengdpu.DBLayer
{
    class DbIndividualPartner : IDbIndividualPartner, ISingletonRegister
    {
        public int Insert(IndividualPartner model)
        {
            using (var db = new DefaultDbContext())
            {
                db.IndividualPartners.Add(model);
                return db.SaveChanges();
            }
        }

        public int Update(IndividualPartner model)
        {
            using (var db = new DefaultDbContext())
            {
                db.Entry(model).State = EntityState.Modified;
                return db.SaveChanges();
            }
        }

        public int Delete(IndividualPartner model)
        {
            using (var db = new DefaultDbContext())
            {
                db.Entry(model).State = EntityState.Deleted;
                return db.SaveChanges();
            }
        }

        public IndividualPartner Create(int ID)
        {
            using (var db = new DefaultDbContext())
            {
                return
                    db.IndividualPartners.Include(
                        i => i.CommunityPartner2IndividualPartners.Select(c => c.CommunityPartner))
                        .Include(i=>i.Project2IndividualPartners.Select(p=>p.Project))
                        .FirstOrDefault(i => i.ID == ID);
            }
        }

        public IndividualPartner Create(string uniqueUrl)
        {
            using (var db = new DefaultDbContext())
            {
                return
                    db.IndividualPartners.Include(
                        i => i.CommunityPartner2IndividualPartners.Select(c => c.CommunityPartner))
                        .Include(i => i.Project2IndividualPartners.Select(p => p.Project))
                        .FirstOrDefault(i => i.UniqueUrl.Equals(uniqueUrl));
            }
        }

        public IEnumerable<IndividualPartnerForList> List(int top=10, IndividualPartnerCollectionSettings settings = null)
        {
            using (var db = new DefaultDbContext())
            {
                var sql = new StringBuilder();
                sql.AppendFormat("select TOP {0} ID,FirstName,LastName,UniqueUrl From IndividualPartner where 1=1", top);
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
                            sql.Append(
                                "select c.ID,c.FirstName,c.LastName,c.UniqueUrl,k.RANK From IndividualPartner as c inner join FREETEXTTABLE(IndividualPartner,(FirstName,LastName),@keyword) as k on c.ID=k.[KEY]");

                        }
                        else
                        {
                            sql.Append(" AND freetext((FirstName,LastName),@keyword)");
                        }
                    }
                    if (!string.IsNullOrEmpty(settings.NameKeywords) && settings.IsRanked)
                    {
                        sql.Append(" ORDER BY k.RANK DESC");
                    }
                }
                return db.Database.SqlQuery<IndividualPartnerForList>(sql.ToString(), param.ToArray()).ToList();
            }
        }
        public IEnumerable<IndividualPartner> List(int pageIndex, int pageSize, IndividualPartnerCollectionSettings settings = null)
        {
            using (var db = new DefaultDbContext())
            {
                var predicate = BuildPredicate(db, settings);
                return db.IndividualPartners.Where(predicate)
                    .OrderByDescending(a => a.ID)
                    .Skip((pageIndex - 1) * pageSize)
                    .Take(pageSize)
                    .Select(i => new
                    {
                        i.ID,
                        i.FirstName,
                        i.LastName,
                        i.CreateDate,
                        i.CreatorUserID,
                        i.DPUID,
                        i.Email,
                        i.LastEditorUserID,
                        i.LastModifiedDate,
                        i.PersonalStatement,
                        i.Phone,
                        i.Thumbnail,
                        i.UniqueUrl,
                        Creator = db.Users.Where(u => u.ID == i.CreatorUserID).Select(u => new { Name = u.FirstName + ", " + u.LastName }).FirstOrDefault(),
                        LastEditor = db.Users.Where(u => u.ID == i.LastEditorUserID).Select(u => new { Name = u.FirstName + ", " + u.LastName }).FirstOrDefault()
                    })
                    .AsNoTracking().ToList().Select(i=>new IndividualPartner()
                    {
                        ID=i.ID,
                        FirstName=i.FirstName,
                        LastName=i.LastName,
                        CreateDate=i.CreateDate,
                        CreatorUserID = i.CreatorUserID,
                        DPUID=i.DPUID,
                        Email=i.Email,
                        LastEditorUserID = i.LastEditorUserID,
                        LastModifiedDate=i.LastModifiedDate,
                        PersonalStatement=i.PersonalStatement,
                        Phone=i.Phone,
                        Thumbnail=i.Thumbnail,
                        UniqueUrl=i.UniqueUrl,
                        Creator=i.Creator!=null?i.Creator.Name:"",
                        LastEditor= i.LastEditor!=null?i.LastEditor.Name:""
                    });
            }
        }

        public int Count(IndividualPartnerCollectionSettings settings = null)
        {
            using (var db = new DefaultDbContext())
            {
                var predicate = BuildPredicate(db, settings);
                return db.IndividualPartners.Where(predicate).AsNoTracking().Count();
            }
        }

        public bool ExistsUniqueUrl(string nameUrl)
        {
            using (var db = new DefaultDbContext())
            {
                return db.IndividualPartners.Any(a => a.UniqueUrl.Equals(nameUrl));
            }
        }
        /// <summary>
        /// Build a Lambda expression as a condition to filter Individual Partners
        /// </summary>
        /// <param name="db">DefaultDbContext</param>
        /// <param name="settings">IndividualPartnerCollectionSettings</param>
        /// <returns>Lambda expression for "Where"</returns>
        private Expression<Func<IndividualPartner, bool>> BuildPredicate(DefaultDbContext db, IndividualPartnerCollectionSettings settings)
        {
            var predicate = PredicateBuilder.True<IndividualPartner>();

            if (settings != null)
            {
                if (!string.IsNullOrEmpty(settings.NameKeywords))
                {
                    predicate = predicate.And(c => c.FirstName.StartsWith(settings.NameKeywords));
                }

            }
            return predicate;
        } 
    }
}
