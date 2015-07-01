using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Commengdpu.DBLayer
{
    public interface IDB_RoleManager
    {
        bool DeleteRole(string roleName, bool throwOnPopulatedRole);
        void CreateRole(string roleName);
        string[] GetAllRoles();
        bool RoleExists(string roleName);
        void AddUsersToRoles(string[] usernames, string[] roleNames);
        string[] FindUsersInRole(string roleName, string usernameToMatch);
        string[] GetRolesForUser(string username);
        string[] GetUsersInRole(string roleName);
        bool IsUserInRole(string username, string roleName);
        void RemoveUsersFromRoles(string[] usernames, string[] roleNames);
    }
}
