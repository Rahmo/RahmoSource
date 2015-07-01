using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.DbContexts;
using ICStars2_0.Framework;

namespace Commengdpu.DBLayer
{
    class DbProject2CommunityPartner:IDbProject2CommunityPartner,ISingletonRegister
    {
        public int Insert(IEnumerable<Project2CommunityPartner> project2CommunityPartners)
        {
            using (var db = new DefaultDbContext())
            {
                foreach (var p2c in project2CommunityPartners)
                {
                    db.Project2CommunityPartners.Add(p2c);
                }
                return db.SaveChanges();
            }
        }

        public int Update(IEnumerable<Project2CommunityPartner> project2CommunityPartners)
        {
            using (var db = new DefaultDbContext())
            {
                foreach (var p2c in project2CommunityPartners)
                {
                    db.Entry(p2c).State=EntityState.Modified;
                }
                return db.SaveChanges();
            }
        }

        public int Delete(IEnumerable<Project2CommunityPartner> project2CommunityPartners)
        {
            using (var db = new DefaultDbContext())
            {
                foreach (var p2c in project2CommunityPartners)
                {
                    db.Entry(p2c).State = EntityState.Deleted;
                }
                return db.SaveChanges();
            }
        }

        public int DeleteByProjectId(int projectId)
        {
            using (var db = new DefaultDbContext())
            {
                return db.Database.ExecuteSqlCommand("Delete From Project2CommunityPartner Where ProjectID=@ProjectID", new[] { new SqlParameter("@ProjectID", SqlDbType.Int) { Value = projectId } });
                
            }
        }

        public IEnumerable<Project2CommunityPartner> List(int projectId)
        {
            using (var db = new DefaultDbContext())
            {
                return db.Project2CommunityPartners.Where(p2c => p2c.ProjectID == projectId).ToList();
            }
        }
    }
}
