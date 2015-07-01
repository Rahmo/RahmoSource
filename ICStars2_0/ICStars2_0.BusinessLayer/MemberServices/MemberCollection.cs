using System.Collections.Generic;
using System.Data;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.MemberServices
{
    #region =MemberCollection=
    internal class MemberCollection : IMemberCollection
    {
        [Dependency]
        public IDB_Member DB_Member { get; set; }
        public int Count { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public MemberCollectionSettings Settings { get; set; }
        DataTable _table;
        public void Initalize()
        {
            if (_table != null) return;
            _table = DB_Member.List(PageIndex, PageSize, Settings);
            Count = DB_Member.Count(Settings);
        }

        #region IEnumerable<Member> 成员

        public IEnumerator<Member> GetEnumerator()
        {
            Initalize();
            foreach (DataRow row in _table.Rows)
            {
                Member m = new Member();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion

        #region IEnumerable 成员

        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            Initalize();
            foreach (DataRow row in _table.Rows)
            {
                Member m = new Member();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion
    }
    #endregion
}
