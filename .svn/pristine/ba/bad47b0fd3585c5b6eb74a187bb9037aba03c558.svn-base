using System.Collections.Generic;
using System.Linq;
using Commengdpu.BusinessLayer.CategoryServices;
using Commengdpu.BusinessLayer.Provider;
using Commengdpu.DBLayer;
using Commengdpu.Models;
using Commengdpu.Models.Settings;
using ICStars2_0.Common;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.RoleServices
{

    class RoleFactory : IRoleFactory, ISingletonRegister
    {
        [Dependency]
        public IDbRole DbRole { get; set; }
        [Dependency]
        public IUserData UserData { get; set; }
        public int SaveToDb(Role role)
        {
            role.CreatorUserID = UserData.ID;
            return role.ID == 0 ? DbRole.Insert(role) : DbRole.Update(role);
        }

       public Role Create(int ID)
        {
            return DbRole.Create(ID);
        }

        public IEnumerable<Role> List()
        {
            return DbRole.List();
        }
    }
}
