using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.Db
{
    public interface IDB_CBO
    {
        int Count(CBOCollectionSettings settings);
        DataTable List(int pageIndex, int pageSize,CBOCollectionSettings settings);
        DataRow CBOInfo(int ID);
        int Add(CBO cbo);
        int Update(CBO cbo);
        int Delete(int ID);
        bool Exists(int ID);
        int UpdateSlc(int id, string slc);
        
        bool Exists(string cboName);
    }
}
