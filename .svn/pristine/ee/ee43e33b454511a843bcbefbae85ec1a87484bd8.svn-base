using System;
using System.Data;
using System.Data.SqlClient;
using ICStars.Data;
using ICStars2_0.Common;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Model;

namespace ICStars2_0.Db
{

    #region = DBLayer Member2Role =
    public static class DB_Member2Role
    {
        private const string ConnectionKey = "icstars";
        public static int Count()
        {
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM Member2Role WITH(NOLOCK)"));
        }
        public static DataTable List(int pageIndex, int pageSize)
        {
            FastPaging fp = new FastPaging();
            fp.PageIndex = pageIndex;
            fp.PageSize = pageSize;
            fp.TableName = "Member2Role";
            fp.QueryFields = "[ID],[MemberID],[RoleID]";
            fp.PrimaryKey = "ID";
            fp.Ascending = FastPaging.IsAscending("DESC");
            fp.WithOptions = "WITH(NOLOCK)";
            return SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, fp.Build2005());
        }
        public static DataRow Member2RoleInfo(int ID)
        {

            SqlParameter[] parms = new[]{
                        new SqlParameter("@ID",SqlDbType.Int)
                    };

            parms[0].Value = ID;

            return SQLPlus.ExecuteDataRow(ConnectionKey, CommandType.Text, "SELECT * FROM Member2Role WITH(NOLOCK) WHERE ID=@ID", parms);
        }

        public static int Add(Member2Role member2role)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(member2role);

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; INSERT INTO [Member2Role]([MemberID],[RoleID] ) SELECT @MemberID,@RoleID; SELECT ISNULL(@@IDENTITY,0);", parms));

        }

        public static int Update(Member2Role member2role)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(member2role);

            return (int)SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; UPDATE [Member2Role]  SET [MemberID]=@MemberID,[RoleID]=@RoleID WHERE [ID]=@ID; SELECT @ID AS i;", parms);
        }

        public static int Delete(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "DELETE FROM Member2Role WHERE ID = @ID;", parms);
        }
        public static bool Exists(int ID)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@ID",SqlDbType.Int)
                         };
            parms[0].Value = ID;
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM Member2Role WITH(NOLOCK) WHERE ID = @ID;", parms)) > 0;
        }

    }
    #endregion
}
