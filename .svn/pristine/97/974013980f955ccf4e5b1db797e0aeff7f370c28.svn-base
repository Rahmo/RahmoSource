using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.Settings;

namespace Commengdpu.DBLayer
{
    public interface IDbUser
    {
        int Insert(User user);
        int Update(User user);
        int Delete(User user);
        User Create(int ID);
        User Create(string campusConnectId);
        bool Has(string campusConnectId);
        IEnumerable<User> List(int pageIndex, int pageSize, UserCollectionSettings settings = null);
        int Count(UserCollectionSettings settings = null);
    }
}
