using System.Collections.Generic;
using System.Data;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.MemberServices
{
    #region =Member2RoleCollection=
    public class Member2RoleCollection : IEnumerable<Member2Role>
    {

        public int Count { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        readonly DataTable _table;
        public Member2RoleCollection(int pageIndex, int pageSize)
        {
            PageIndex = pageIndex;
            PageSize = pageSize;
            _table = DB_Member2Role.List(pageIndex, pageSize);
            Count = DB_Member2Role.Count();
        }

        #region IEnumerable<Member2Role> 成员

        public IEnumerator<Member2Role> GetEnumerator()
        {
            foreach (DataRow row in _table.Rows)
            {
                Member2Role m = new Member2Role();
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
                Member2Role m = new Member2Role();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion
    }
    #endregion
}
