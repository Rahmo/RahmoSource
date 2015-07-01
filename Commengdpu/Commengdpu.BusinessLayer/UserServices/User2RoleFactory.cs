using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.DBLayer;
using Commengdpu.Models;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.ProjectServices
{
    class User2RoleFactory:IUser2RoleFactory,ISingletonRegister
    {
        [Dependency]
        public IDbUser2Role DbUser2Role { get; set; }

        public int AddToDb(IEnumerable<User2Role> user2Roles)
        {
            return DbUser2Role.Insert(user2Roles);
        }

        public int SaveToDb(User user, IEnumerable<User2Role> user2Roles)
        {
            if (user2Roles == null)
            {
                return DbUser2Role.DeleteByUserId(user.ID);
            }
            var originalList = DbUser2Role.List(user.ID);
            var newList = user2Roles;
            var forDeleting = originalList.Where(o => newList.All(n => n.RoleID != o.RoleID));
            var forAdding = newList.Where(n => originalList.All(o => o.RoleID != n.RoleID));
            var result = 0;
            if (forDeleting.Any())
            {
                result += DbUser2Role.Delete(forDeleting);
            }
            if (forAdding.Any())
            {
                result += DbUser2Role.Insert(forAdding);
            }
            return result;
        }
    }
}
