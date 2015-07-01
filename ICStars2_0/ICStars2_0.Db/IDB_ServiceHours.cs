using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.Db
{
    public interface IDB_ServiceHours
    {
        int Count(ServiceHoursCollectionSettings settings);
        DataTable List(int pageIndex, int pageSize,ServiceHoursCollectionSettings settings);
        DataRow ServiceHoursInfo(int ID);
        int Add(ServiceHours servicehours);
        int Update(ServiceHours servicehours);
        int Delete(int ID);
        bool Exists(int ID);
    }
}
