using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.StudentServices
{
    #region =ServiceHoursFactory=
    internal class ServiceHoursFactory : IServiceHoursFactory, IWeakReferenceRegister
    {
        [Dependency]
        public IDB_ServiceHours DB_ServiceHours { get; set; }

        [Dependency]
        public IStudentFactory StudentFactory { get; set; }
        [Dependency]
        public IUserData UserData { get; set; }
        public IServiceHoursCollection CreateServiceHoursCollection(int pageIndex, int pageSize,ServiceHoursCollectionSettings settings)
        {
            var i = ICStarsUnityContainer.Current.Resolve<ServiceHoursCollection>();
            i.PageIndex = pageIndex;
            i.PageSize = pageSize;
            i.Settings = settings;
            return i;
        }
        public ServiceHours Create(int id)
        {
            ServiceHours m = new ServiceHours();
            if (id > 0)
            {
                ReflectionHelper.Fill(DB_ServiceHours.ServiceHoursInfo(id), m);
            }
            return m;
        }
        public ServiceHours Update(ServiceHours m, bool isUpdateLastUpdateTime = true)
        {
            if (m.ID > 0)
            {
                m.LastEditorID = UserData.ID;
                DB_ServiceHours.Update(m);
            }
            else
            {
                m.MemberID = UserData.ID;
                m.ID = DB_ServiceHours.Add(m);
            }
            if (isUpdateLastUpdateTime)
            {
                StudentFactory.UpdateLastUpdateTime(m.StudentID);
            }
            StudentFactory.UpdateServedHours(m);
            return m;
        }
        public int Delete(int ID)
        {
            return DB_ServiceHours.Delete(ID);
        }
        public bool Exists(int ID)
        {
            return DB_ServiceHours.Exists(ID);
        }
    }
    #endregion
}
