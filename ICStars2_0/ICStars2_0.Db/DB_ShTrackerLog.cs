using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using ICStars.Data;
using ICStars2_0.Common;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Framework;
using ICStars2_0.Model;

namespace ICStars2_0.Db
{
    #region = DBLayer SHTrackerLog =
    internal class DB_ShTrackerLog : IDB_SHTrackerLog, IWeakReferenceRegister
    {
        private const string ConnectionKey = "icstars";
        public int Count()
        {
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM SHTrackerLog WITH(NOLOCK)"));
        }
        public DataTable List(int pageIndex, int pageSize)
        {
            FastPaging fp = new FastPaging();
            fp.PageIndex = pageIndex;
            fp.PageSize = pageSize;
            fp.TableName = "SHTrackerLog";
            fp.QueryFields = "[ID],[UserName],[Url],[CreateDate],[IP],[UrlReferrer]";
            fp.PrimaryKey = "ID";
            fp.Ascending = FastPaging.IsAscending("DESC");
            fp.WithOptions = "WITH(NOLOCK)";
            return SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, fp.Build2005());
        }
        public DataRow SHTracherLogInfo(int ID)
        {

            SqlParameter[] parms = new[]{
                        new SqlParameter("@ID",SqlDbType.Int)
                    };

            parms[0].Value = ID;

            return SQLPlus.ExecuteDataRow(ConnectionKey, CommandType.Text, "SELECT * FROM SHTrackerLog WITH(NOLOCK) WHERE ID=@ID", parms);
        }

        public int Add(SHTrackerLog shtracherlog)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(shtracherlog);

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; INSERT INTO [SHTrackerLog]([UserName],[Url],[CreateDate],[IP],[UrlReferrer] ) SELECT @UserName,@Url,@CreateDate,@IP,@UrlReferrer; SELECT ISNULL(@@IDENTITY,0);", parms));

        }

        public int Update(SHTrackerLog shtracherlog)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(shtracherlog);

            return (int)SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; UPDATE [SHTrackerLog]  SET [UserName]=@UserName,[Url]=@Url,[CreateDate]=@CreateDate,[IP]=@IP,[UrlReferrer]=@UrlReferrer WHERE [ID]=@ID; SELECT @ID AS i;", parms);
        }

        public int Delete(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "DELETE FROM SHTrackerLog WHERE ID = @ID;", parms);
        }
        public bool Exists(int ID)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@ID",SqlDbType.Int)
                         };
            parms[0].Value = ID;
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM SHTrackerLog WITH(NOLOCK) WHERE ID = @ID;", parms)) > 0;
        }

    }
    #endregion
}
