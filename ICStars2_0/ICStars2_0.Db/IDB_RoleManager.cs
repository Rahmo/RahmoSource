using System.Data;

namespace ICStars2_0.Db
{
    public interface IDB_RoleManager
    {
        bool DeleteRole(string roleName, bool throwOnPopulatedRole);
        void CreateRole(string roleName);
        DataTable GetAllRoles();
        bool RoleExists(string roleName);
        void AddUsersToRoles(string[] usernames, string[] roleNames);
        DataTable FindUsersInRole(string roleName, string usernameToMatch);
        DataTable GetRolesForUser(string username);
        DataTable GetUsersInRole(string roleName);
        bool IsUserInRole(string username, string roleName);
        void RemoveUsersFromRoles(string[] usernames, string[] roleNames);
    }
}