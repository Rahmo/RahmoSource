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
    class DbUser2Role:IDbUser2Role,ISingletonRegister
    {
        public int Insert(IEnumerable<User2Role> user2Roles)
        {
            using (var db = new RoleDbContext())
            {
                foreach (var p2c in user2Roles)
                {
                    db.User2Roles.Add(p2c);
                }
                return db.SaveChanges();
            }
        }

        public int Update(IEnumerable<User2Role> user2Roles)
        {
            using (var db = new RoleDbContext())
            {
                foreach (var p2c in user2Roles)
                {
                    db.Entry(p2c).State=EntityState.Modified;
                }
                return db.SaveChanges();
            }
        }

        public int Delete(IEnumerable<User2Role> user2Roles)
        {
            using (var db = new RoleDbContext())
            {
                foreach (var p2c in user2Roles)
                {
                    db.Entry(p2c).State = EntityState.Deleted;
                }
                return db.SaveChanges();
            }
        }

        public int DeleteByUserId(int userId)
        {
            using (var db = new RoleDbContext())
            {
                return db.Database.ExecuteSqlCommand("Delete From User2Role Where UserID=@UserID",
                    new[] {new SqlParameter("@UserID", SqlDbType.Int) {Value = userId}});

            }
        }

        public IEnumerable<User2Role> List(int userId)
        {
            using (var db = new RoleDbContext())
            {
                return db.User2Roles.Where(p2c => p2c.UserID == userId).ToList();
            }
        }
    }
}
