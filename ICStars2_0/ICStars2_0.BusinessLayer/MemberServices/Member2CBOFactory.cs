using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using ICStars2_0.Db;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.MemberServices
{
    #region =Member2CBOFactory=
    internal class Member2CBOFactory : IMember2CBOFactory, IWeakReferenceRegister
    {
        [Dependency]
        public IDB_Member2CBO DB_Member2CBO { get; set; }

        public int Create(int memberId, int cboId)
        {
            return DB_Member2CBO.Add(memberId, cboId);
        }

        public IEnumerable<int> GetCBOIDList(int memberId)
        {
            return from DataRow row in DB_Member2CBO.GetCBOIDList(memberId).Rows select Convert.ToInt32(row["CBOID"]);
        }

        public int Delete(int memberId, int cboId)
        {
            return DB_Member2CBO.Delete(memberId,cboId);
        }
    }
    #endregion
}
