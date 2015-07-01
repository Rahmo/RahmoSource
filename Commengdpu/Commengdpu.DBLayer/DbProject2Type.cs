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
    class DbProject2Type:IDbProject2Type,ISingletonRegister
    {
        public int Insert(IEnumerable<Project2Type> project2Types)
        {
            using (var db = new DefaultDbContext())
            {
                foreach (var p2c in project2Types)
                {
                    db.Project2Types.Add(p2c);
                }
                return db.SaveChanges();
            }
        }

        public int Update(IEnumerable<Project2Type> project2Types)
        {
            using (var db = new DefaultDbContext())
            {
                foreach (var p2c in project2Types)
                {
                    db.Entry(p2c).State=EntityState.Modified;
                }
                return db.SaveChanges();
            }
        }

        public int Delete(IEnumerable<Project2Type> project2Types)
        {
            using (var db = new DefaultDbContext())
            {
                foreach (var p2c in project2Types)
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
                return db.Database.ExecuteSqlCommand("Delete From Project2Type Where ProjectID=@ProjectID", new[] { new SqlParameter("@ProjectID", SqlDbType.Int) { Value = projectId } });

            }
        }

        public IEnumerable<Project2Type> List(int projectId)
        {
            using (var db = new DefaultDbContext())
            {
                return db.Project2Types.Where(p2c => p2c.ProjectID == projectId).ToList();
            }
        }
    }
}
