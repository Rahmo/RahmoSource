using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using ICStars.Data;
using ICStars2_0.Framework;

namespace ICStars2_0.Db
{
    
    

    #region = DBLayer Member2CBO =
    internal class DB_Member2CBO : IDB_Member2CBO, IWeakReferenceRegister
    {
        private const string ConnectionKey = "icstars";
        
        public int Add(int memberId, int cboId)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@MemberID",SqlDbType.Int){Value=memberId},
                            new SqlParameter("@CBOID",SqlDbType.Int){Value=cboId}
                     };

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; INSERT INTO [Member2CBO]([MemberID],[CBOID] ) SELECT @MemberID,@CBOID WHERE NOT EXISTS(SELECT NULL AS EMPTY FROM Member2CBO WHERE MemberID=@MemberID AND CBOID=@CBOID); SELECT ISNULL(@@IDENTITY,0);", parms));

        }

        public int Delete(int memberId, int cboId)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@MemberID",SqlDbType.Int){Value=memberId},
                            new SqlParameter("@CBOID",SqlDbType.Int){Value=cboId}
                     };
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "DELETE FROM Member2CBO WHERE MemberID=@MemberID AND CBOID=@CBOID;", parms);
        }

        public DataTable GetCBOIDList(int memberId)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@MemberID",SqlDbType.Int){Value=memberId}
                     };
            return SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, "SELECT CBOID FROM Member2CBO WHERE MemberID=@MemberID;", parms);
        }
    }
    #endregion
            
}
