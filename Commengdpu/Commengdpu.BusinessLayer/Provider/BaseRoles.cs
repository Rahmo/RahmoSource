using System;
using System.Collections.Specialized;
using System.Data;
using System.Web;
using System.Web.Security;
using Commengdpu.DBLayer;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.Provider
{
    /// <summary>
    /// Roles Manager
    /// This cannot be resovled by UntiyContainer, it is called by the system.
    /// So we cannot user Dependency Injection here.
    /// we use ICStarsUnityContainer.Current.Resolve<IDB_RoleManager>() instead
    /// </summary>
    public abstract class BaseRoles : RoleProvider
    {
        public IDB_RoleManager DB_RoleManager { 
            get { return ICStarsUnityContainer.Current.Resolve<IDB_RoleManager>(); }
        }
        public string GetRoleForUser(string username)
        {
            string[] roles = GetRolesForUser(username);
            if (roles != null && roles.Length > 0)
            {
                return roles[0];
            }
            return string.Empty;
        }
        public override abstract string[] GetRolesForUser(string username);
        public override bool RoleExists(string roleName)
        {
            try
            {
                SecUtility.CheckParameter(ref roleName, true, true, true, 255, "roleName");
            }
            catch
            {
                return false;
            }
            return DB_RoleManager.RoleExists(roleName);
        }

        public override string[] GetAllRoles()
        {

            return DB_RoleManager.GetAllRoles();
        }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            SecUtility.CheckArrayParameter(ref roleNames, true, true, true, 255, "roleNames");
            SecUtility.CheckArrayParameter(ref usernames, true, true, true, 255, "usernames");

            DB_RoleManager.AddUsersToRoles(usernames, roleNames);
        }

        public override void CreateRole(string roleName)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 255, "roleName");

            DB_RoleManager.CreateRole(roleName);
        }

        /// <summary>
        /// delete a role
        /// </summary>
        /// <param name="roleName"></param>
        /// <param name="throwOnPopulatedRole">if make a confirmation</param>
        /// <returns></returns>
        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 255, "roleName");

            return DB_RoleManager.DeleteRole(roleName, throwOnPopulatedRole);
        }

        #region - DataTable2Array -
        protected string[] DataTable2Array(DataTable oTable)
        {
            if (oTable == null) return null;
            StringCollection sc = new StringCollection();

            foreach (DataRow r in oTable.Rows)
            {
                sc.Add(r[0].ToString().Trim());
            }


            string[] allUsers = new string[sc.Count];
            sc.CopyTo(allUsers, 0);
            return allUsers;
        }
        #endregion

        protected void CacheInsert(string key, object value)
        {
            HttpContext.Current.Cache.Insert(key, value, null, DateTime.Now.AddMinutes(2), TimeSpan.Zero, System.Web.Caching.CacheItemPriority.Normal, null);
        }
    }
}
