using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.CBOServices
{
    #region =CBOCollection=
    internal class CBOCollection : ICBOCollection
    {

        public int Count { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public CBOCollectionSettings Settings { get; set; }
        DataTable _table;
        [Dependency]
        public IDB_CBO DB_CBO { get; set; }
        public void Initalize()
        {
            if (_table != null) return;
            if(PageIndex==0 || PageSize ==0)
            {
                _table=new DataTable();
                return;
            }
            _table = DB_CBO.List(PageIndex, PageSize,Settings);
            Count = DB_CBO.Count(Settings);
        }
        #region IEnumerable<CBO> 成员

        public IEnumerator<CBO> GetEnumerator()
        {
            Initalize();
            foreach (DataRow row in _table.Rows)
            {
                CBO m = new CBO();
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
                CBO m = new CBO();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion
    }
    #endregion
}
