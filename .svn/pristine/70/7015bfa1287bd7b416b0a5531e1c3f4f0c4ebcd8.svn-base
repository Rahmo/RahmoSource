using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Model;

namespace ICStars2_0.Db
{
    public interface IDB_SHTrackerLog
    {
        int Count();
        DataTable List(int pageIndex, int pageSize);
        DataRow SHTracherLogInfo(int ID);
        int Add(SHTrackerLog shtracherlog);
        int Update(SHTrackerLog shtracherlog);
        int Delete(int ID);
        bool Exists(int ID);
    }
}
