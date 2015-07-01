using System.Collections.Generic;
using Commengdpu.BusinessLayer.CategoryServices;
using Commengdpu.Models;
using Commengdpu.Models.Settings;

namespace Commengdpu.BusinessLayer.UserServices
{
    public interface IUserFactory
    {
        int SaveToDb(User model);
        /// <summary>
        /// Watch out! if user2Roles is null, database will delete all roles for this user.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="user2Roles"></param>
        /// <returns></returns>
        int SaveToDb(User model, IEnumerable<User2Role> user2Roles);
        int Delete(int userId);
        IPageableCollection<User> CreateList(int pageIndex, int pageSize, UserCollectionSettings settings = null);
        User Create(int ID);
        User Create(string campusConnectId);
        bool Has(string campusConnectId);
    }
}
