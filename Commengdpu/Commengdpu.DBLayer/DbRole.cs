using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
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
    class DbRole : IDbRole, ISingletonRegister
    {
        public int Insert(Role role)
        {
            using (var db = new RoleDbContext())
            {
                db.Roles.Add(role);
                return db.SaveChanges();
            }
        }

        public int Update(Role role)
        {
            using (var db = new RoleDbContext())
            {
                db.Entry(role).State = EntityState.Modified;
                return db.SaveChanges();
            }
        }

        public Role Create(int ID)
        {
            using (var db = new RoleDbContext())
            {
                return db.Roles.Find(ID);
            }
        }

        public IEnumerable<Role> List()
        {
            using (var db = new RoleDbContext())
            {
                return db.Roles.ToList();
            }
        }
    }
}
