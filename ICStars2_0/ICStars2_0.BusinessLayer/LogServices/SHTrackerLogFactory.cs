using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.LogServices
{
    #region =SHTrackerLogFactory=
    internal class SHTrackerLogFactory : ISHTrackerLogFactory, IWeakReferenceRegister
    {
        [Dependency]
        public IDB_SHTrackerLog DbShTrackerLog { get; set; }
        public ISHTrackerLogCollection CreateSHTracherLogCollection(int pageIndex, int pageSize)
        {
            var i = ICStarsUnityContainer.Current.Resolve<SHTrackerLogCollection>();
            i.PageIndex = pageIndex;
            i.PageSize = pageSize;
            i.Initalize();
            return i;
        }
        public SHTrackerLog Create(int id)
        {
            SHTrackerLog m = new SHTrackerLog();
            if (id > 0)
            {
                ReflectionHelper.Fill(DbShTrackerLog.SHTracherLogInfo(id), m);
            }
            return m;
        }
        public SHTrackerLog Update(SHTrackerLog m)
        {
            if (m.ID > 0)
            {
                DbShTrackerLog.Update(m);
            }
            else
            {
                m.ID = DbShTrackerLog.Add(m);
            }
            return m;
        }
        public int Delete(int ID)
        {
            return DbShTrackerLog.Delete(ID);
        }
        public bool Exists(int ID)
        {
            return DbShTrackerLog.Exists(ID);
        }
    }
    #endregion
}
