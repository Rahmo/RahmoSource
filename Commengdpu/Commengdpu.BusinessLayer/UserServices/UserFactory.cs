using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using Commengdpu.BusinessLayer.CategoryServices;
using Commengdpu.BusinessLayer.ProjectServices;
using Commengdpu.DBLayer;
using Commengdpu.Models;
using Commengdpu.Models.Settings;
using ICStars2_0.Common;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.UserServices
{

    class UserFactory : IUserFactory, ISingletonRegister
    {
        [Dependency]
        public IDbUser DbUser { get; set; }
        [Dependency]
        public IUser2RoleFactory User2RoleFactory { get; set; }

        public int SaveToDb(User user)
        {
            return user.ID == 0 ? DbUser.Insert(user) : DbUser.Update(user);
        }
        /// <summary>
        /// Watch out! if user2Roles is null, database will delete all roles for this user.
        /// </summary>
        /// <param name="user"></param>
        /// <param name="user2Roles"></param>
        /// <returns></returns>
        public int SaveToDb(User user, IEnumerable<User2Role> user2Roles)
        {
            if (user.ID == 0)
            {
                var r= DbUser.Insert(user);
                if (r > 0 && user2Roles != null)
                {
                    User2RoleFactory.AddToDb(user2Roles);
                }
                return r;
            }

            var r2 =DbUser.Update(user);
            if (r2 > 0)
            {
                User2RoleFactory.SaveToDb(user, user2Roles);
            }
            return r2;
        }

        public int Delete(int userId)
        {
            return DbUser.Delete(new User { ID = userId });
        }

        public IPageableCollection<User> CreateList(int pageIndex, int pageSize, UserCollectionSettings settings = null)
        {
            var list = new UserCollection(DbUser.List(pageIndex, pageSize,settings))
            {
                PageIndex = pageIndex,
                PageSize = pageSize,
                TotalCount = DbUser.Count(settings)
            };

            return list;
        }
        public User Create(int ID)
        {
            return DbUser.Create(ID);
        }

        public User Create(string campusConnectId)
        {
            return DbUser.Create(campusConnectId);
        }

        public bool Has(string campusConnectId)
        {
            return DbUser.Has(campusConnectId);
        }
    }
}
