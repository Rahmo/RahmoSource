using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.LogServices
{
    #region =SHTrackerLogCollection=
    internal class SHTrackerLogCollection : ISHTrackerLogCollection
    {

        public int Count { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        DataTable _table;
        [Dependency]
        public IDB_SHTrackerLog DbShTrackerLog { get; set; }
        public void Initalize()
        {
            if (_table != null) return;
            _table = DbShTrackerLog.List(PageIndex, PageSize);
            Count = DbShTrackerLog.Count();
        }
        #region IEnumerable<SHTrackerLog> 成员

        public IEnumerator<SHTrackerLog> GetEnumerator()
        {
            Initalize();
            foreach (DataRow row in _table.Rows)
            {
                SHTrackerLog m = new SHTrackerLog();
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
                SHTrackerLog m = new SHTrackerLog();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion
    }
    #endregion
}
