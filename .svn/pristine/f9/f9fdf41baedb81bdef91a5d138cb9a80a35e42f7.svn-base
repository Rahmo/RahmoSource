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
    class DbUser : IDbUser, ISingletonRegister
    {
        public int Insert(User user)
        {
            using (var db = new RoleDbContext())
            {
                db.Users.Add(user);
                return db.SaveChanges();
            }
        }

        public int Update(User user)
        {
            using (var db = new RoleDbContext())
            {
                db.Entry(user).State = EntityState.Modified;
                return db.SaveChanges();
            }
        }

        public int Delete(User user)
        {
            using (var db = new RoleDbContext())
            {
                db.Entry(user).State = EntityState.Deleted;
                return db.SaveChanges();
            }
        }

        public User Create(int ID)
        {
            using (var db = new RoleDbContext())
            {
                return db.Users.Include(u => u.User2Roles.Select(u2r => u2r.Role)).SingleOrDefault(u => u.ID == ID);
            }
        }

        public User Create(string campusConnectId)
        {
            using (var db = new RoleDbContext())
            {
                return db.Users.Include(u => u.User2Roles.Select(u2r => u2r.Role)).SingleOrDefault(u => u.UserName.Equals(campusConnectId));
            }
        }

        public bool Has(string campusConnectId)
        {
            using (var db = new RoleDbContext())
            {
                return db.Users.Any(u => u.UserName.Equals(campusConnectId));
            }
        }

        public IEnumerable<User> List(int pageIndex, int pageSize, UserCollectionSettings settings = null)
        {
            using (var db = new RoleDbContext())
            {
                var predicate = BuildPredicate(db, settings);
                return db.Users.Include(u => u.User2Roles.Select(u2r => u2r.Role)).Where(predicate).OrderByDescending(a => a.ID)
                    .Skip((pageIndex - 1) * pageSize)
                    .Take(pageSize).AsNoTracking().ToList();
            }
        }

        public int Count(UserCollectionSettings settings = null)
        {
            using (var db = new RoleDbContext())
            {
                var predicate = BuildPredicate(db, settings);
                return db.Users.Where(predicate).AsNoTracking().Count();
            }
        }
        /// <summary>
        /// Build a Lambda expression as a condition to filter users
        /// </summary>
        /// <param name="db">RoleDbContext</param>
        /// <returns>Lambda expression for "Where"</returns>
        private Expression<Func<User, bool>> BuildPredicate(RoleDbContext db, UserCollectionSettings settings)
        {
            var predicate = PredicateBuilder.True<User>();

            if (settings != null)
            {
                if (!string.IsNullOrEmpty(settings.FilterByRoleName))
                {
                    predicate =
                        predicate.And(
                            u =>
                                db.User2Roles.Any(
                                    u2r =>
                                        u2r.UserID == u.ID &&
                                        db.Roles.Any(
                                            r => r.ID == u2r.RoleID && r.RoleName.Equals(settings.FilterByRoleName))));
                }
                if (settings.FilterByRoleId>0)
                {
                    predicate =
                        predicate.And(
                            u => db.User2Roles.Any(u2r => u2r.UserID == u.ID && u2r.RoleID == settings.FilterByRoleId));
                }
                if (settings.HasNoRole)
                {
                    predicate = predicate.And(u => db.User2Roles.All(u2r => u2r.UserID != u.ID));
                }
            }
            return predicate;
        } 
    }
}
