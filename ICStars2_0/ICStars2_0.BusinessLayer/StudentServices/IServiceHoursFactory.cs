using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.BusinessLayer.StudentServices
{

    public interface IServiceHoursFactory
    {
        IServiceHoursCollection CreateServiceHoursCollection(int pageIndex, int pageSize,ServiceHoursCollectionSettings settings);
        ServiceHours Create(int id);
        ServiceHours Update(ServiceHours m, bool isUpdateLastUpdateTime = true);
        int Delete(int ID);
        bool Exists(int ID);
    }
}
