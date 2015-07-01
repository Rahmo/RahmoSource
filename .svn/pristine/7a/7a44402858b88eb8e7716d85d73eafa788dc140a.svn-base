using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using ICStars.Data;
using ICStars2_0.Common;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.Db
{
    #region = DBLayer CBO =
    internal class DB_CBO : IDB_CBO, IWeakReferenceRegister
    {
        private const string ConnectionKey = "icstars";
        private static readonly string MemberTableName = AttributeHelper.GetValueOfAttribute(typeof(BaseMember), typeof(DbTableAttribute), "Name").ToString();
        public int Count(CBOCollectionSettings settings)
        {
            StringBuilder strSql = new StringBuilder("SELECT COUNT(*) FROM CBO WITH(NOLOCK)");
            List<SqlParameter> parms = new List<SqlParameter>();
            if(settings!=null)
            {
                strSql.Append(" WHERE 1=1");
                if(settings.CourseID>0 
                    || !string.IsNullOrEmpty(settings.Quater_Year)
                    || settings.QuaterYearArray!=null
                    || settings.StudentType!=StudentType.All
                    )
                {

                    strSql.Append(@" AND EXISTS
(
	SELECT NULL AS EMPTY FROM Student2CBO AS s2c
	WHERE s2c.CBOID=CBO.ID");
                    if (settings.CourseID > 0)
                    {
                        parms.Add(
                                           new SqlParameter("@CourseID", SqlDbType.Int) { Value = settings.CourseID });
                        strSql.Append(" AND EXISTS(SELECT NULL AS EMPTY FROM Student As s WHERE s.ID=s2c.StudentID AND s.CourseID=@CourseID)");
                    }
                    if (settings.StudentType != StudentType.All)
                    {
                        strSql.Append(" AND EXISTS(SELECT NULL AS EMPTY FROM Student As s WHERE s.ID=s2c.StudentID AND s.[Type]=@Type)");
                        parms.Add(new SqlParameter("@Type", SqlDbType.Int) { Value = (int)settings.StudentType });
                    }
                    if (!string.IsNullOrEmpty(settings.Quater_Year))
                    {
                        parms.Add(new SqlParameter("@Quater_Year", SqlDbType.VarChar, 50) { Value = settings.Quater_Year });
                        strSql.Append(" AND s2c.Quater_Year=@Quater_Year");
                    }
                    if (settings.QuaterYearArray != null)
                    {
                        strSql.AppendFormat(" AND s2c.Quater_Year in ({0})", settings.QuaterYearArray.Select(s => string.Format("'{0}'", s.Replace("'", "''"))).ToString(","));
                    }
                    strSql.Append(")");
                }
                if(settings.IsCheckSLC)
                {
                    parms.Add(
                                       new SqlParameter("@SLC", SqlDbType.VarChar, 100) { Value = settings.SLC });
                    strSql.Append(" AND SLC=@SLC");
                }
            }
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, strSql,parms.ToArray()));
        }
        public DataTable List(int pageIndex, int pageSize,CBOCollectionSettings settings)
        {
            List<SqlParameter> parms = new List<SqlParameter>();
            StringBuilder strCondition = new StringBuilder("1=1");
            FastPaging fp = new FastPaging();
            fp.PageIndex = pageIndex;
            fp.PageSize = pageSize;
            fp.TableName = "CBO";
            fp.TableReName = "c";
            fp.JoinSQL = string.Format("LEFT JOIN {0} AS m ON m.CampusConnectID=c.SLC", MemberTableName);
            fp.QueryFields = "c.[ID],[Name],c.ContactFristName,c.ContactLastName,c.ContactEmail,c.ContactPhone,c.[Address],SLC,m.Email AS SLC_Email, m.Phone AS SLC_Phone,m.OfficeHours AS SLC_OfficeHours";
            fp.PrimaryKey = "Name";
            fp.Ascending = FastPaging.IsAscending("ASC");
            fp.WithOptions = "WITH(NOLOCK)";
            if (settings != null)
            {
                if (settings.CourseID > 0 
                    || !string.IsNullOrEmpty(settings.Quater_Year)
                    || settings.QuaterYearArray!=null
                    || settings.StudentType!=StudentType.All)
                {

                    strCondition.Append(@" AND EXISTS
(
	SELECT NULL AS EMPTY FROM Student2CBO AS s2c
	WHERE s2c.CBOID=c.ID");
                    if (settings.CourseID > 0)
                    {
                        parms.Add(
                                           new SqlParameter("@CourseID", SqlDbType.Int) { Value = settings.CourseID });
                        strCondition.Append(" AND EXISTS(SELECT NULL AS EMPTY FROM Student As s WHERE s.ID=s2c.StudentID AND s.CourseID=@CourseID)");
                    }
                    if (settings.StudentType != StudentType.All)
                    {
                        strCondition.Append(" AND EXISTS(SELECT NULL AS EMPTY FROM Student As s WHERE s.ID=s2c.StudentID AND s.[Type]=@Type)");
                        parms.Add(new SqlParameter("@Type", SqlDbType.Int) { Value = (int)settings.StudentType });
                    }
                    if (!string.IsNullOrEmpty(settings.Quater_Year))
                    {
                        parms.Add(new SqlParameter("@Quater_Year", SqlDbType.VarChar, 50) { Value = settings.Quater_Year });
                        strCondition.Append(" AND s2c.Quater_Year=@Quater_Year");
                    }
                    if (settings.QuaterYearArray != null)
                    {
                        strCondition.AppendFormat(" AND s2c.Quater_Year in ({0})", settings.QuaterYearArray.Select(s => string.Format("'{0}'", s.Replace("'", "''"))).ToString(","));
                    }
                    strCondition.Append(")");
                }
                if(settings.IsCheckSLC)
                {

                    parms.Add(
                                       new SqlParameter("@SLC", SqlDbType.VarChar, 100) { Value = settings.SLC });
                    strCondition.Append(" AND SLC=@SLC");
                }
                fp.Condition = strCondition.ToString();

            }
            return SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, fp.Build2005(),parms.ToArray());
        }

        public int UpdateSlc(int id, string slc)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@SLC",SqlDbType.VarChar,100){Value=slc},
                                new SqlParameter("@ID",SqlDbType.Int){Value=id}
                         };
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "UPDATE CBO SET SLC=@SLC WHERE ID=@ID;", parms);
        }
        public DataRow CBOInfo(int ID)
        {

            SqlParameter[] parms = new[]{
                        new SqlParameter("@ID",SqlDbType.Int)
                    };

            parms[0].Value = ID;

            return SQLPlus.ExecuteDataRow(ConnectionKey, CommandType.Text, "SELECT * FROM CBO WITH(NOLOCK) WHERE ID=@ID", parms);
        }

        public int Add(CBO cbo)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(cbo);

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; INSERT INTO [CBO]([Name],ContactFristName,ContactLastName, ContactEmail,ContactPhone,[Address],[Mission]) SELECT @Name,@ContactFristName,@ContactLastName,@ContactEmail,@ContactPhone,@Address,@Mission; SELECT ISNULL(@@IDENTITY,0);", parms));

        }

        public int Update(CBO cbo)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(cbo);

            return (int)SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; UPDATE [CBO]  SET [Name]=@Name,ContactFristName=@ContactFristName,ContactLastName=@ContactLastName,ContactEmail=@ContactEmail,ContactPhone=@ContactPhone,[Address]=@Address, [Mission]=@Mission WHERE [ID]=@ID; SELECT @ID AS i;", parms);
        }

        public int Delete(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "DELETE FROM CBO WHERE ID = @ID;", parms);
        }
        public bool Exists(int ID)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@ID",SqlDbType.Int)
                         };
            parms[0].Value = ID;
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM CBO WITH(NOLOCK) WHERE ID = @ID;", parms)) > 0;
        }
        public bool Exists(string cboName)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@Name",SqlDbType.VarChar,200)
                         };
            parms[0].Value = cboName;
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM CBO WITH(NOLOCK) WHERE Name = @Name;", parms)) > 0;
        }

    }
    #endregion
}
