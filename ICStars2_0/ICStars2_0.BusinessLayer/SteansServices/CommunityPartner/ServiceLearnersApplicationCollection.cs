﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db.Steans;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.SteansServices.CommunityPartner
{
    #region =ServiceLearnersApplicationCollection=
    internal class ServiceLearnersApplicationCollection : IServiceLearnersApplicationCollection
    {

        public int Count { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public ServiceLearnersApplicationCollectionSettings Settings { get; set; }
        DataTable _table;
        [Dependency]
        public IDB_ServiceLearnersApplication DB_ServiceLearnersApplication { get; set; }
        public void Initalize()
        {
            if (_table != null) return;
            _table = DB_ServiceLearnersApplication.List(PageIndex, PageSize,Settings);
            Count = DB_ServiceLearnersApplication.Count(Settings);
        }
        #region IEnumerable<ServiceLearnersApplication> 成员

        public IEnumerator<ServiceLearnersApplication> GetEnumerator()
        {
            Initalize();
            foreach (DataRow row in _table.Rows)
            {
                ServiceLearnersApplication m = new ServiceLearnersApplication();
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
                ServiceLearnersApplication m = new ServiceLearnersApplication();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion
    }
    #endregion
}
