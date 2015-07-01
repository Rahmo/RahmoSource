using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.StudentServices
{
    #region =ServiceHoursCollection=
    internal class ServiceHoursCollection : IServiceHoursCollection
    {

        public int Count { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public ServiceHoursCollectionSettings Settings { get; set; }
        DataTable _table;
        [Dependency]
        public IDB_ServiceHours DB_ServiceHours { get; set; }
        public void Initalize()
        {
            if (_table != null) return;
            _table = DB_ServiceHours.List(PageIndex, PageSize, Settings);
            Count = DB_ServiceHours.Count(Settings);
        }
        #region IEnumerable<ServiceHours> 成员

        public IEnumerator<ServiceHours> GetEnumerator()
        {
            Initalize();
            foreach (DataRow row in _table.Rows)
            {
                ServiceHours m = new ServiceHours();
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
                ServiceHours m = new ServiceHours();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion
    }
    #endregion
}
