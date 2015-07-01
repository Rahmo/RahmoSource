using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.DbContexts;
using ICStars2_0.Common.Lambda;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Framework;

namespace Commengdpu.DBLayer
{
    internal class DB_RoleManager : IDB_RoleManager, ISingletonRegister
    {
        public bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            using (var db = new RoleDbContext())
            {
                if (throwOnPopulatedRole == true)
                {

                    if (db.Roles.Any(
                        r => db.User2Roles.Any(u2r => u2r.RoleID == r.ID && db.Users.Any(u => u.ID == u2r.UserID))))
                    {
                        throw new Exception("Role is not empty");
                    }
                }
                return db.Database.ExecuteSqlCommand("DELETE FROM [Role] WHERE Name = @rolename;", new[]
                {
                    new SqlParameter("@rolename", SqlDbType.VarChar, 100)
                }) > 0;
            }
        }

        public void CreateRole(string roleName)
        {
            using (var db = new RoleDbContext())
            {
                if (db.Roles.Any(r => r.RoleName.Equals(roleName))) return;
                db.Roles.Add(new Role {RoleName = roleName});
                db.SaveChanges();
            }
        }

        public string[] GetAllRoles()
        {
            using (var db = new RoleDbContext())
            {
                return db.Roles.Select(r => r.RoleName).ToArray();
            }
        }
        public bool RoleExists(string roleName)
        {
            using (var db = new RoleDbContext())
            {
                return db.Roles.Any(r => r.RoleName.Equals(roleName));
            }
        }
        public void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            using (var db = new RoleDbContext())
            {
                var userIdArray = db.Users.Where(u => usernames.Any(s => u.UserName.Equals(s))).Select(u => u.ID);
                var roleIdArray = db.Roles.Where(r => roleNames.Any(s => r.RoleName.Equals(s))).Select(r => r.ID);
                var user2roleArray =
                    userIdArray.SelectMany(u => roleIdArray.Select(r => new {u, r}))
                        .ToList()
                        .Select(u2r => new User2Role {UserID = u2r.u, RoleID = u2r.r});
                foreach (var user2Role in user2roleArray)
                {
                    if (db.User2Roles.Any(u2r => u2r.UserID == user2Role.UserID && u2r.RoleID == user2Role.RoleID))
                        continue;
                    db.User2Roles.Add(user2Role);
                }
                db.SaveChanges();
            }

        }

        public string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            using (var db = new RoleDbContext())
            {
                var users =
                    db.Users.Where(
                        u =>
                            db.User2Roles.Any(
                                u2r =>
                                    u2r.UserID == u.ID &&
                                    db.Roles.Any(r => r.ID == u2r.RoleID && r.RoleName.Equals(roleName))));
                if (!string.IsNullOrEmpty(usernameToMatch))
                {
                    users = users.Where(u => u.UserName.StartsWith(usernameToMatch));
                }
                return users.Select(u => u.UserName).ToArray();
            }
        }

        public string[] GetRolesForUser(string username)
        {
            using (var db = new RoleDbContext())
            {
                return
                    db.Roles.Where(
                        r =>
                            db.User2Roles.Any(
                                u2r =>
                                    u2r.RoleID == r.ID &&
                                    db.Users.Any(u => u.ID == u2r.UserID && u.UserName.Equals(username))))
                        .Select(r => r.RoleName)
                        .ToArray();
            }
        }

        public string[] GetUsersInRole(string roleName)
        {
            using (var db = new RoleDbContext())
            {
                return
                    db.Users.Where(
                        u =>
                            db.User2Roles.Any(
                                u2r =>
                                    u2r.UserID == u.ID &&
                                    db.Roles.Any(r => r.ID == u2r.RoleID && r.RoleName.Equals(roleName))))
                        .Select(u => u.UserName).ToArray();
            }
        }

        public bool IsUserInRole(string username, string roleName)
        {
            using (var db = new RoleDbContext())
            {
                return
                    db.User2Roles.Any(
                        u2r =>
                            db.Users.Any(u => u.UserName.Equals(username) && u.ID == u2r.UserID) &&
                            db.Roles.Any(r => r.RoleName.Equals(roleName) && r.ID == u2r.RoleID));
            }
        }

        public void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            using (var db = new RoleDbContext())
            {
                var userIdArray = db.Users.Where(u => usernames.Any(s => u.UserName.Equals(s))).Select(u => u.ID);
                var roleIdArray = db.Roles.Where(r => roleNames.Any(s => r.RoleName.Equals(s))).Select(r => r.ID);
                var user2roleArray =
                    userIdArray.SelectMany(u => roleIdArray.Select(r => new { u, r }))
                        .ToList()
                        .Select(u2r => new User2Role { UserID = u2r.u, RoleID = u2r.r });
                foreach (var user2Role in user2roleArray)
                {
                    if (!db.User2Roles.Any(u2r => u2r.UserID == user2Role.UserID && u2r.RoleID == user2Role.RoleID))
                        continue;
                    db.Entry(user2Role).State = EntityState.Deleted;
                }
                db.SaveChanges();
            }
        }

        
    }
}
