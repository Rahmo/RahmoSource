using System;
using System.Configuration.Provider;
using System.Collections.Specialized;
using System.Web;
using ICStars2_0.Db;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.Provider
{
    /// <summary>
    /// Role Management
    /// created by li hui
    /// </summary>
    public class ICStarsRoles : BaseRoles, IRoles,ISingletonRegister
    {
        /// <summary>
        /// not using [Dependency] here is because it is called by the .net not UnityContainer
        /// </summary>
        public IDB_RoleManager DB_RoleManager
        {
            get { return ICStarsUnityContainer.Current.Resolve<IDB_RoleManager>(); }
        }

        #region = Current =

        private static IRoles _icstarsroles;
        private static object _locker = new object();
        public static IRoles Current
        {
            get
            {
                if (_icstarsroles == null)
                {
                    lock (_locker)
                    {
                        if (_icstarsroles == null)
                        {
                            _icstarsroles = ICStarsUnityContainer.Current.Resolve<IRoles>();
                        }
                    }
                }
                return _icstarsroles;
            }
        }

        #endregion

        #region = Initialize =
        public override void Initialize(string name, NameValueCollection config)
        {
            if (config == null)
                throw new ArgumentNullException("config");
            if (String.IsNullOrEmpty(name))
                name = "ICStarsRoles";
            if (string.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "roles provider");
            }

            base.Initialize(name, config);


            _AppName = config["applicationName"];
            if (string.IsNullOrEmpty(_AppName))
                _AppName = SecUtility.GetDefaultAppName();

            if (_AppName.Length > 255)
            {
                throw new ProviderException("Roles provider name is overlong, the longest number is 255.");
            }

            config.Remove("connectionStringName");
            config.Remove("applicationName");
            config.Remove("description");
            if (config.Count > 0)
            {
                string attribUnrecognized = config.GetKey(0);
                if (!String.IsNullOrEmpty(attribUnrecognized))
                    throw new ProviderException("Provider unrecognized attribute: " + attribUnrecognized);
            }
        }
        #endregion

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            SecUtility.CheckArrayParameter(ref roleNames, true, true, true, 255, "roleNames");
            SecUtility.CheckArrayParameter(ref usernames, true, true, true, 255, "usernames");
            DB_RoleManager.AddUsersToRoles(usernames, roleNames);
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 255, "roleName");
            SecUtility.CheckParameter(ref usernameToMatch, true, true, false, 255, "usernameToMatch");

            return DataTable2Array(DB_RoleManager.FindUsersInRole(roleName, usernameToMatch));
        }


        public override string[] GetRolesForUser(string username)
        {
            SecUtility.CheckParameter(ref username, true, false, true, 255, "username");
            if (username.Length < 1)
                return new string[0];

            return DataTable2Array(DB_RoleManager.GetRolesForUser(username));
        }

        public override string[] GetUsersInRole(string roleName)
        {
            SecUtility.CheckParameter(ref roleName, true, true, true, 255, "roleName");


            return DataTable2Array(DB_RoleManager.GetUsersInRole(roleName));
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            string cachekey = "IsUserInRole_" + username + "_" + roleName;
            if (HttpContext.Current.Cache[cachekey] == null)
            {
                SecUtility.CheckParameter(ref username, true, false, true, 255, "username");
                if (username.Length < 1)
                    return false;
                SecUtility.CheckParameter(ref roleName, true, true, true, 255, "roleName");


                CacheInsert(cachekey, DB_RoleManager.IsUserInRole(username, roleName));
            }

            return Convert.ToBoolean(HttpContext.Current.Cache[cachekey]);
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            SecUtility.CheckArrayParameter(ref roleNames, true, true, true, 255, "roleNames");
            SecUtility.CheckArrayParameter(ref usernames, true, true, true, 255, "usernames");
            DB_RoleManager.RemoveUsersFromRoles(usernames, roleNames);
        }

        #region - ApplicationName -
        private string _AppName = "ICStars";

        public override string ApplicationName
        {
            get { return _AppName; }
            set
            {
                if (_AppName != value)
                {
                    _AppName = value;
                }
            }
        }
        #endregion

        
    }
}
