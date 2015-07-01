using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;

namespace Commengdpu.BusinessLayer.ProjectServices
{
    public interface IUser2RoleFactory
    {
        /// <summary>
        /// Only add new records
        /// </summary>
        /// <returns></returns>
        int AddToDb(IEnumerable<User2Role> user2Roles);
        /// <summary>
        /// It would Automatically apply data inserting/modifying/deleting.
        /// </summary>
        /// <returns></returns>
        int SaveToDb(User user, IEnumerable<User2Role> user2Roles);
    }
}
