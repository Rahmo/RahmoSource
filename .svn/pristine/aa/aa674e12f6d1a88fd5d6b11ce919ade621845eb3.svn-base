using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Framework;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.MemberServices
{
    #region =RoleFactory=
    internal class RoleFactory : IRoleFactory, IWeakReferenceRegister
    {
        public IRoleCollection CreateRoleCollection(int pageIndex, int pageSize)
        {
            return new RoleCollection(pageIndex, pageSize);
        }
        public Role Create(int id)
        {
            Role m = new Role();
            if (id > 0)
            {
                ReflectionHelper.Fill(DB_Role.RoleInfo(id), m);
            }
            return m;
        }
        public Role Update(Role m)
        {
            if (m.ID > 0)
            {
                DB_Role.Update(m);
            }
            else
            {
                m.ID = DB_Role.Add(m);
            }
            return m;
        }
        public int Delete(int ID)
        {
            return DB_Role.Delete(ID);
        }
        public bool Exists(int ID)
        {
            return DB_Role.Exists(ID);
        }
    }
    #endregion
}
