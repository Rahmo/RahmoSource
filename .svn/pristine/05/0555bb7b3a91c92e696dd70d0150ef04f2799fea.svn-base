using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.SteansServices.EventRequest
{
    #region =EventRequestFormCollection=
    internal class EventRequestFormCollection : IEventRequestFormCollection
    {

        public int Count { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        DataTable _table;
        [Dependency]
        public IDB_EventRequestForm DB_EventRequestForm { get; set; }
        public void Initalize()
        {
            if (_table != null) return;
            _table = DB_EventRequestForm.List(PageIndex, PageSize);
            Count = DB_EventRequestForm.Count();
        }
        #region IEnumerable<EventRequestForm> 成员

        public IEnumerator<EventRequestForm> GetEnumerator()
        {
            Initalize();
            foreach (DataRow row in _table.Rows)
            {
                EventRequestForm m = new EventRequestForm();
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
                EventRequestForm m = new EventRequestForm();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion
    }
    #endregion
}
