using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.MemberServices
{
    #region =Member2RoleFactory=
    public static class Member2RoleFactory
    {
        public static Member2Role Create(int id)
        {
            Member2Role m = new Member2Role();
            if (id > 0)
            {
                ReflectionHelper.Fill(DB_Member2Role.Member2RoleInfo(id), m);
            }
            return m;
        }
        public static int Add(Member2Role m)
        {
            return DB_Member2Role.Add(m);
        }
        public static int Delete(int ID)
        {
            return DB_Member2Role.Delete(ID);
        }
        public static bool Exists(int ID)
        {
            return DB_Member2Role.Exists(ID);
        }

    }
    #endregion
}
