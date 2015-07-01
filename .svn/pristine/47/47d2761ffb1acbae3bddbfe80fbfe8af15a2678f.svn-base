using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db.Steans;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.SteansServices.CommunityPartner
{
    #region =ServiceLearnersApplicationFactory=
    internal class ServiceLearnersApplicationFactory : IServiceLearnersApplicationFactory, IWeakReferenceRegister
    {
        [Dependency]
        public IDB_ServiceLearnersApplication DB_ServiceLearnersApplication { get; set; }
        public IServiceLearnersApplicationCollection CreateServiceLearnersApplicationCollection(int pageIndex, int pageSize,ServiceLearnersApplicationCollectionSettings settings)
        {
            var i = ICStarsUnityContainer.Current.Resolve<ServiceLearnersApplicationCollection>();
            i.PageIndex = pageIndex;
            i.PageSize = pageSize;
            i.Settings = settings;
            i.Initalize();
            return i;
        }
        public ServiceLearnersApplication Create(int id)
        {
            ServiceLearnersApplication m = new ServiceLearnersApplication();
            if (id > 0)
            {
                ReflectionHelper.Fill(DB_ServiceLearnersApplication.ServiceLearnersApplicationInfo(id), m);
            }
            return m;
        }
        public ServiceLearnersApplication Update(ServiceLearnersApplication m)
        {
            if (m.ID > 0)
            {
                DB_ServiceLearnersApplication.Update(m);
            }
            else
            {
                m.ID = DB_ServiceLearnersApplication.Add(m);
            }
            return m;
        }
        public int Delete(int ID)
        {
            return DB_ServiceLearnersApplication.Delete(ID);
        }
        public bool Exists(int ID)
        {
            return DB_ServiceLearnersApplication.Exists(ID);
        }
    }
    #endregion
}
