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
using ICStars2_0.Model.Settings;

namespace ICStars2_0.Db
{
    #region = DBLayer ServiceHours =
    internal class DB_ServiceHours : IDB_ServiceHours, IWeakReferenceRegister
    {
        private const string ConnectionKey = "icstars";
        public int Count(ServiceHoursCollectionSettings settings)
        {
            StringBuilder sbSql = new StringBuilder("SELECT COUNT(*) FROM ServiceHours WITH(NOLOCK)");
            if(settings!=null)
            {
                if (settings.StudentID > 0)
                {
                    sbSql.AppendFormat(" WHERE StudentID={0}", settings.StudentID);
                }
            }
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, sbSql));
        }
        public DataTable List(int pageIndex, int pageSize,ServiceHoursCollectionSettings settings)
        {
            FastPaging fp = new FastPaging();
            fp.PageIndex = pageIndex;
            fp.PageSize = pageSize;
            fp.TableName = "ServiceHours";
            fp.TableReName = "sh";
            fp.QueryFields = "sh.[ID],[CBO_ID],[CourseID],[StudentID],[ServiceDate],[HoursServed],[ContactType],[Notes],Quater_Year,EngagementDescription,[MemberID],[LastEditorID],m1.FirstName+' '+m1.LastName+'('+m1.Email+')' as Creator,m2.FirstName+' '+m2.LastName+'('+m2.Email+')' as LastEditor";
            fp.PrimaryKey = "ID";
            fp.JoinSQL = "left join Member as m1 on m1.ID=sh.MemberID left join Member as m2 on m2.ID=sh.LastEditorID";
            fp.Ascending = FastPaging.IsAscending("DESC");
            fp.WithOptions = "WITH(NOLOCK)";
            if(settings!=null)
            {
                if (settings.StudentID > 0)
                {
                    fp.Condition = string.Format("StudentID={0}", settings.StudentID);
                }
            }
            return SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, fp.Build2005());
        }
        public DataRow ServiceHoursInfo(int ID)
        {

            SqlParameter[] parms = new[]{
                        new SqlParameter("@ID",SqlDbType.Int)
                    };

            parms[0].Value = ID;

            return SQLPlus.ExecuteDataRow(ConnectionKey, CommandType.Text, "SELECT * FROM ServiceHours WITH(NOLOCK) WHERE ID=@ID", parms);
        }

        public int Add(ServiceHours servicehours)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(servicehours);

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; INSERT INTO [ServiceHours]([CBO_ID],[CourseID],[StudentID],[ServiceDate],[HoursServed],[ContactType],[Notes],Quater_Year,EngagementDescription,[MemberID],[LastEditorID]) SELECT @CBO_ID,@CourseID,@StudentID,@ServiceDate,@HoursServed,@ContactType,@Notes,@Quater_Year,@EngagementDescription,@MemberID,@LastEditorID; SELECT ISNULL(@@IDENTITY,0);", parms));

        }

        public int Update(ServiceHours servicehours)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(servicehours);

            return (int)SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; UPDATE [ServiceHours]  SET [CBO_ID]=@CBO_ID,[CourseID]=@CourseID,[StudentID]=@StudentID,[ServiceDate]=@ServiceDate,[HoursServed]=@HoursServed,[ContactType]=@ContactType,[Notes]=@Notes,Quater_Year=@Quater_Year,EngagementDescription=@EngagementDescription,[MemberID]=@MemberID,[LastEditorID]=@LastEditorID WHERE [ID]=@ID; SELECT @ID AS i;", parms);
        }

        public int Delete(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "DELETE FROM ServiceHours WHERE ID = @ID;", parms);
        }
        public bool Exists(int ID)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@ID",SqlDbType.Int)
                         };
            parms[0].Value = ID;
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM ServiceHours WITH(NOLOCK) WHERE ID = @ID;", parms)) > 0;
        }

    }
    #endregion
}
