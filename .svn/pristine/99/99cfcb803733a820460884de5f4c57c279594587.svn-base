using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.Db.Steans
{
    public interface IDB_ServiceLearnersApplication
    {
        int Count(ServiceLearnersApplicationCollectionSettings settings);
        DataTable List(int pageIndex, int pageSize,ServiceLearnersApplicationCollectionSettings settings);
        DataRow ServiceLearnersApplicationInfo(int ID);
        int Add(ServiceLearnersApplication servicelearnersapplication);
        int Update(ServiceLearnersApplication servicelearnersapplication);
        int Delete(int ID);
        bool Exists(int ID);
    }
}
