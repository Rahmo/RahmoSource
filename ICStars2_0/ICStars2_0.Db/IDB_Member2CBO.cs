using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace ICStars2_0.Db
{
    public interface IDB_Member2CBO
    {
        int Add(int memberId,int cboId);
        int Delete(int memberId, int cboId );
        DataTable GetCBOIDList(int memberId);
    }
}
