using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.DbContexts;
using ICStars2_0.Framework;

namespace Commengdpu.DBLayer
{
    class DbProject2Category:IDbProject2Category,ISingletonRegister
    {
        public int Insert(IEnumerable<Project2Category> project2Categories)
        {
            using (var db = new DefaultDbContext())
            {
                foreach (var p2c in project2Categories)
                {
                    db.Project2Categories.Add(p2c);
                }
                return db.SaveChanges();
            }
        }

        public int Update(IEnumerable<Project2Category> project2Categories)
        {
            using (var db = new DefaultDbContext())
            {
                foreach (var p2c in project2Categories)
                {
                    db.Entry(p2c).State=EntityState.Modified;
                }
                return db.SaveChanges();
            }
        }

        public int Delete(IEnumerable<Project2Category> project2Categories)
        {
            using (var db = new DefaultDbContext())
            {
                foreach (var p2c in project2Categories)
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
                return db.Database.ExecuteSqlCommand("Delete From Project2Category Where ProjectID=@ProjectID", new[] { new SqlParameter("@ProjectID", SqlDbType.Int) { Value = projectId } });

            }
        }

        public IEnumerable<Project2Category> List(int projectId)
        {
            using (var db = new DefaultDbContext())
            {
                return db.Project2Categories.Where(p2c => p2c.ProjectID == projectId).ToList();
            }
        }

        public IEnumerable<Project2Category> GetProject2Categories(int[] projectIds)
        {
            using (var db = new DefaultDbContext())
            {
                return
                    db.Project2Categories.Include(p => p.Category)
                        .Where(p => projectIds.Any(id => id == p.ProjectID))
                        .ToList();
            }
        }
    }
}
