using System.Collections.Generic;
using System.Data;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.MemberServices
{
    #region =RoleCollection=
    internal class RoleCollection : IRoleCollection
    {

        public int Count { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        readonly DataTable _table;
        public RoleCollection(int pageIndex, int pageSize)
        {
            PageIndex = pageIndex;
            PageSize = pageSize;
            _table = DB_Role.List(pageIndex, pageSize);
            Count = DB_Role.Count();
        }

        #region IEnumerable<Role> 成员

        public IEnumerator<Role> GetEnumerator()
        {
            foreach (DataRow row in _table.Rows)
            {
                Role m = new Role();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion

        #region IEnumerable 成员

        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            foreach (DataRow row in _table.Rows)
            {
                Role m = new Role();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion
    }
    #endregion
}
