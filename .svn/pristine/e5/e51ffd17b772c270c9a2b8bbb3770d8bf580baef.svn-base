using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Enum;

namespace ICStars2_0.Db
{
    public interface IDB_EventRequestForm
    {
        int Count();
        DataTable List(int pageIndex, int pageSize);
        DataRow EventRequestFormInfo(int ID);
        int Add(EventRequestForm eventrequestform);
        int Update(EventRequestForm eventrequestform);
        int Delete(int ID);
        bool Exists(int ID);
        bool UpdateStatus(int ID, EventRequestFormStatus status);
    }
}
