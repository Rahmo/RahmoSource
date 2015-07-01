using System.Collections.Generic;
using System.Data;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.SteansServices.CommunityInternshipServices
{
    #region =CommunityInternshipCollection=
    internal class CommunityInternshipCollection : ICommunityInternshipCollection
    {

        public int Count { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        DataTable _table;
        [Dependency]
        public IDB_CommunityInternship DB_CommunityInternship { get; set; }
        public void Initalize()
        {
            if (_table != null) return;
            _table = DB_CommunityInternship.List(PageIndex, PageSize);
            Count = DB_CommunityInternship.Count();
        }
        #region IEnumerable<CommunityInternship> 成员

        public IEnumerator<CommunityInternship> GetEnumerator()
        {
            Initalize();
            foreach (DataRow row in _table.Rows)
            {
                CommunityInternship m = new CommunityInternship();
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
                CommunityInternship m = new CommunityInternship();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion
    }
    #endregion
}
