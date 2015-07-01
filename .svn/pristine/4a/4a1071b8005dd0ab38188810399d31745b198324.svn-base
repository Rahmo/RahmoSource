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
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Settings;
using System.Linq;
namespace ICStars2_0.Db
{
    #region = DBLayer Member =
    internal class DB_Member : IDB_Member, IWeakReferenceRegister
    {
        private const string ConnectionKey = "icstars";

        private static readonly string TableName = AttributeHelper.GetValueOfAttribute(typeof (BaseMember), typeof (DbTableAttribute), "Name").ToString();

        //public bool ValidateUser(string userName, string password)
        //{
        //    StringBuilder strSQL = new StringBuilder("SELECT COUNT(*) FROM Member WITH(NOLOCK) WHERE UserName=@username AND PassWord=@userpwd AND [Status]=1");

        //    SqlParameter[] parms = new SqlParameter[] {
        //                    new SqlParameter("@username",SqlDbType.VarChar),
        //                    new SqlParameter("@userpwd",SqlDbType.VarChar)
        //             };

        //    parms[0].Value = userName;
        //    parms[1].Value = password;

        //    object o = SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, strSQL, parms);

        //    return Convert.ToInt32(o) > 0;
        //}
        public bool IsLocked(string campusConnectId)
        {
            return !Convert.ToBoolean(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, string.Format("SELECT [Status] FROM {0} WITH(NOLOCK) WHERE CampusConnectID=@CampusConnectID",TableName), new[] { new SqlParameter("@CampusConnectID", SqlDbType.VarChar, 100) { Value = campusConnectId } }));
        }
        public int Count(MemberCollectionSettings settings)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.AppendFormat("SELECT COUNT(*) FROM {0} WITH(NOLOCK)", TableName);
            SqlParameter[] parms = null;
            if(settings != null)
            {
                strSql.Append(" WHERE 1=1");
                if(settings.IsUnverified)
                {
                    strSql.Append(" AND Status=0");
                }
                if(settings.MemberType!=MemberType.NULL)
                {
                    strSql.AppendFormat(" AND EXISTS(SELECT NULL AS EMPTY FROM Member2Role WHERE {1}.ID=MemberID AND Exists(SELECT NULL AS EMPTY FROM Role WHERE RoleID=Role.ID AND Role.Name='{0}'))", settings.MemberType,TableName);
                }
                if (settings.ExcludedMemberType != MemberType.NULL)
                {
                    strSql.AppendFormat(" AND NOT EXISTS(SELECT NULL AS EMPTY FROM Member2Role WHERE {1}.ID=MemberID AND Exists(SELECT NULL AS EMPTY FROM Role WHERE RoleID=Role.ID AND Role.Name='{0}'))", settings.ExcludedMemberType,TableName);
                }
                if (settings.MemberRoles != null)
                {
                    var paraList = new List<SqlParameter>();
                    int i = 0;
                    foreach (var role in settings.MemberRoles)
                    {
                        i++;
                        paraList.Add(new SqlParameter("@role" + i, role));
                    }
                    parms = paraList.ToArray();
                    strSql.AppendFormat(
                        "  AND EXISTS(SELECT NULL AS EMPTY FROM Member2Role WHERE {1}.ID=MemberID AND Exists(SELECT NULL AS EMPTY FROM Role WHERE RoleID=Role.ID AND Role.Name in ({0})))",
                        paraList.Select(p => p.ParameterName).Where(s => s.StartsWith("@role")).ToString(","), TableName);
                }
            }
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, strSql,parms));
        }
        public DataTable List(int pageIndex, int pageSize, MemberCollectionSettings settings)
        {
            FastPaging fp = new FastPaging();
            fp.PageIndex = pageIndex;
            fp.PageSize = pageSize;
            fp.TableName = TableName;
            fp.TableReName = "m";
            fp.QueryFields = "[ID],[CampusConnectID],[Status],[Email],[IP],[Phone],[OfficeHours],[FirstName],[LastName],[EmplID],[Department],[Location],[JobTitle],[OfficePhone],[Fax],[SupervisorFirstName],[SupervisorLastName],[SupervisorEmail],[RegisterDate],[LastLoginDate]";
            fp.PrimaryKey = "ID";
            fp.Ascending = FastPaging.IsAscending("DESC");
            fp.WithOptions = "WITH(NOLOCK)";
            SqlParameter[] parms = null;
            StringBuilder strCondition = new StringBuilder();
            if (settings != null)
            {
                strCondition.Append("1=1");
                if(settings.IsUnverified)
                {
                    strCondition.Append(" AND Status=0");
                }
                if (settings.MemberType != MemberType.NULL)
                {
                    strCondition.AppendFormat("  AND EXISTS(SELECT NULL AS EMPTY FROM Member2Role WHERE m.ID=MemberID AND Exists(SELECT NULL AS EMPTY FROM Role WHERE RoleID=Role.ID AND Role.Name='{0}'))", settings.MemberType);
                }
                if (settings.ExcludedMemberType != MemberType.NULL)
                {
                    strCondition.AppendFormat("  AND NOT EXISTS(SELECT NULL AS EMPTY FROM Member2Role WHERE m.ID=MemberID AND Exists(SELECT NULL AS EMPTY FROM Role WHERE RoleID=Role.ID AND Role.Name='{0}'))", settings.ExcludedMemberType);
                }
                if(settings.MemberRoles!=null)
                {
                    var paraList = new List<SqlParameter>();
                    int i = 0;
                    foreach (var role in settings.MemberRoles)
                    {
                        i++;
                        paraList.Add(new SqlParameter("@role" + i, role));
                    }
                    
                    parms = paraList.ToArray();
                    strCondition.AppendFormat(
                        "  AND EXISTS(SELECT NULL AS EMPTY FROM Member2Role WHERE m.ID=MemberID AND Exists(SELECT NULL AS EMPTY FROM Role WHERE RoleID=Role.ID AND Role.Name in ({0})))",
                        paraList.Select(p => p.ParameterName).Where(s => s.StartsWith("@role")).ToString(","));
                }
                fp.Condition = strCondition.ToString();
            }
            return SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, fp.Build2005(),parms);
        }

        public DataRow MemberInfo(int ID)
        {

            SqlParameter[] parms = new[]{
                        new SqlParameter("@ID",SqlDbType.Int)
                    };

            parms[0].Value = ID;

            return SQLPlus.ExecuteDataRow(ConnectionKey, CommandType.Text, string.Format("SELECT * FROM {0} WITH(NOLOCK) WHERE ID=@ID",TableName), parms);
        }

        public DataRow MemberInfo(string campusConnectId)
        {
            StringBuilder strSQL = new StringBuilder();

            strSQL.AppendFormat("SELECT * FROM {0} WITH(NOLOCK) WHERE CampusConnectID=@CampusConnectID",TableName);

            SqlParameter[] parms = new SqlParameter[]{
                        new SqlParameter("@CampusConnectID",SqlDbType.VarChar,100)
                    };

            parms[0].Value = campusConnectId;

            return SQLPlus.ExecuteDataRow(ConnectionKey, CommandType.Text, strSQL, parms);
        }
        public int Add(BaseMember member)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(member);

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, string.Format("SET NOCOUNT ON; INSERT INTO [{0}]([CampusConnectID],[Status],[Email],[IP],[Phone],[OfficeHours],[FirstName],[LastName],[EmplID],[Department],[Location],[JobTitle],[OfficePhone],[Fax],[SupervisorFirstName],[SupervisorLastName],[SupervisorEmail],[RegisterDate],[LastLoginDate] ) SELECT @CampusConnectID,@Status,@Email,@IP,@Phone,@OfficeHours,@FirstName,@LastName,@EmplID,@Department,@Location,@JobTitle,@OfficePhone,@Fax,@SupervisorFirstName,@SupervisorLastName,@SupervisorEmail,@RegisterDate,@LastLoginDate; SELECT ISNULL(@@IDENTITY,0);",TableName), parms));

        }

        public int Update(BaseMember member)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(member);

            return (int)SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, string.Format("SET NOCOUNT ON; UPDATE [{0}]  SET [CampusConnectID]=@CampusConnectID,[Status]=@Status,[Email]=@Email,[IP]=@IP,[Phone]=@Phone,[OfficeHours]=@OfficeHours,[FirstName]=@FirstName,[LastName]=@LastName,[EmplID]=@EmplID,[Department]=@Department,[Location]=@Location,[JobTitle]=@JobTitle,[OfficePhone]=@OfficePhone,[Fax]=@Fax,[SupervisorFirstName]=@SupervisorFirstName,[SupervisorLastName]=@SupervisorLastName,[SupervisorEmail]=@SupervisorEmail,[RegisterDate]=@RegisterDate,[LastLoginDate]=@LastLoginDate WHERE [ID]=@ID; SELECT @ID AS i;",TableName), parms);
        }

        public int Delete(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, string.Format("DELETE FROM {0} WHERE ID = @ID;",TableName), parms);
        }
        public int Active(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, string.Format("UPDATE {0} SET [Status]=1 WHERE ID = @ID;",TableName), parms);
        }
        public int Lock(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, string.Format("UPDATE {0} SET [Status]=0 WHERE ID = @ID;",TableName), parms);
        }
        public bool Exists(int ID)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@ID",SqlDbType.Int)
                         };
            parms[0].Value = ID;
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, string.Format("SELECT COUNT(*) FROM {0} WITH(NOLOCK) WHERE ID = @ID;",TableName), parms)) > 0;
        }


        public bool Exists(string campusConnectId)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@CampusConnectID",SqlDbType.VarChar,100)
                         };
            parms[0].Value = campusConnectId;
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, string.Format("SELECT COUNT(*) FROM {0} WITH(NOLOCK) WHERE CampusConnectID = @CampusConnectID;",TableName), parms)) > 0;
        }
    }
    #endregion

}
