using System;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using ICStars.Data;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Framework;
using ICStars2_0.Model;

namespace ICStars2_0.Db
{
    internal class DB_RoleManager : IDB_RoleManager, ISingletonRegister
    {
        private const string ConnectionKey = "icstars";

        private static readonly string MemberTableName = AttributeHelper.GetValueOfAttribute(typeof(BaseMember), typeof(DbTableAttribute), "Name").ToString();
        public bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            StringBuilder strSQL = new StringBuilder();
            SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@rolename",SqlDbType.VarChar,100)
            };
            parms[0].Value = roleName;
            if (throwOnPopulatedRole == true)
            {
                #region - T-SQL -
                strSQL.Append(" SELECT COUNT(u.id) FROM [Role] AS r");
                strSQL.Append(" INNER JOIN Member2Role AS t ON r.id = t.[RoleID]");
                strSQL.AppendFormat(" INNER JOIN {0} AS u ON u.id = t.[MemberID]",MemberTableName);
                strSQL.Append(" WHERE r.Name = @rolename");


                #endregion

                int i = Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, strSQL, parms));

                if (i > 0)
                {
                    throw new Exception("Role is not empty");
                }
            }
            strSQL = new StringBuilder("DELETE FROM [Role] WHERE Name = @rolename;");

            int j = Convert.ToInt32(SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, strSQL, parms));

            return (j == 1);
        }

        public void CreateRole(string roleName)
        {
            string strSQL = "INSERT INTO [Role]([Name]) SELECT @rolename WHERE NOT EXISTS(SELECT * FROM [Role] WHERE Name=@rolename);";

            SqlParameter[] parms = new SqlParameter[] {
                new SqlParameter("@rolename",SqlDbType.VarChar,100)
            };

            parms[0].Value = roleName;

            SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, strSQL, parms);
        }

        public DataTable GetAllRoles()
        {
            string strSQL = "SELECT Name FROM [Role]";

            DataTable oTable = SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, strSQL);

            return oTable;
        }
        public bool RoleExists(string roleName)
        {
            StringBuilder strSQL = new StringBuilder("SELECT COUNT(id) FROM [Role] WHERE Name = @rolename;");

            SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@rolename",SqlDbType.VarChar,100)
            };
            parms[0].Value = roleName;
            int i = Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, strSQL, parms));
            return i > 0;
        }
        public void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            #region - T-SQL -
            StringBuilder strSQL = new StringBuilder(BuildTable(usernames, roleNames));
            strSQL.Append(" INSERT INTO [Member2Role]([MemberID], [RoleID])");
            strSQL.Append(" SELECT u.id,r.id FROM @t AS t");
            strSQL.Append(" INNER JOIN [Role] AS r ON t.rolename = r.Name");
            strSQL.AppendFormat(" INNER JOIN {0} AS u ON u.CampusConnectID= t.username",MemberTableName);
            strSQL.Append(" WHERE NOT EXISTS");
            strSQL.Append(" (");
            strSQL.Append(" 	SELECT * FROM Member2Role AS t2");
            strSQL.Append(" 	WHERE u.id = t2.[MemberID]");
            strSQL.Append(" 	AND r.ID = t2.[RoleID]");
            strSQL.Append(" ) ");
            #endregion
            SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, strSQL.ToString());
        }

        public DataTable FindUsersInRole(string roleName, string usernameToMatch)
        {
            #region  - T-SQL -
            StringBuilder strSQL = new StringBuilder();
            strSQL.Append(" SELECT Name FROM [Role] AS r");
            strSQL.Append(" INNER JOIN Member2Role AS t ON r.id = t.[RoleID]");
            strSQL.AppendFormat(" INNER JOIN {0} AS u ON u.id = t.MemberID",MemberTableName);
            strSQL.Append(" WHERE r.Name = @rolename");
            strSQL.Append(" AND u.CampusConnectID LIKE @UserNameToMatch+'%'");
            SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@rolename",SqlDbType.VarChar,100),
                new SqlParameter("@UserNameToMatch",SqlDbType.VarChar,100)
            };
            parms[0].Value = roleName;
            parms[1].Value = usernameToMatch;
            #endregion

            DataTable oTable = SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, strSQL.ToString(), parms);
            return oTable;
        }

        public DataTable GetRolesForUser(string username)
        {
            #region  - T-SQL -
            StringBuilder strSQL = new StringBuilder();
            strSQL.Append(" SELECT Name FROM [Role] AS r");
            strSQL.Append(" INNER JOIN Member2Role AS t ON r.id = t.[RoleID]");
            strSQL.AppendFormat(" INNER JOIN {0} AS u ON u.id = t.[MemberID]",MemberTableName);
            strSQL.Append(" WHERE u.CampusConnectID = @username");

            SqlParameter[] parms = new SqlParameter[] {
                new SqlParameter("@username",SqlDbType.VarChar,100)
            };
            parms[0].Value = username;
            #endregion

            DataTable oTable = SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, strSQL.ToString(), parms);
            return oTable;
        }

        public DataTable GetUsersInRole(string roleName)
        {
            #region  - T-SQL -
            StringBuilder strSQL = new StringBuilder();
            strSQL.Append(" SELECT u.CampusConnectID FROM [Role] AS r");
            strSQL.Append(" INNER JOIN Member2Role AS t ON r.id = t.[RoleID]");
            strSQL.AppendFormat(" INNER JOIN {0} AS u ON u.id = t.[MemberID]",MemberTableName);
            strSQL.Append(" WHERE r.Name = @rolename ");
            SqlParameter[] parms = new SqlParameter[] {
                    new SqlParameter("@rolename",SqlDbType.VarChar,100)
            };
            parms[0].Value = roleName;
            #endregion

            DataTable oTable = SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, strSQL.ToString(), parms);
            return oTable;
        }

        public bool IsUserInRole(string username, string roleName)
        {
            #region - T-SQL -
            StringBuilder strSQL = new StringBuilder();
            strSQL.AppendFormat(" SELECT COUNT(ID) FROM {0} AS u",MemberTableName);
            strSQL.Append(" WHERE EXISTS");
            strSQL.Append(" 	(");
            strSQL.Append(" 	SELECT * FROM Member2Role AS t");
            strSQL.Append(" 	WHERE u.id = [MemberID]");
            strSQL.Append(" 	AND EXISTS");
            strSQL.Append(" 		(");
            strSQL.Append(" 		SELECT * FROM Role AS r");
            strSQL.Append(" 		WHERE r.id = t.[RoleID]");
            strSQL.Append(" 		AND r.Name = @rolename");
            strSQL.Append(" 		)");
            strSQL.Append(" 	)");
            strSQL.Append(" AND u.CampusConnectID = @username");

            SqlParameter[] parms = new SqlParameter[] {
                new SqlParameter("@username",SqlDbType.VarChar,100),
                new SqlParameter("@rolename",SqlDbType.VarChar,100)
                };
            parms[0].Value = username;
            parms[1].Value = roleName;
            #endregion

            int i = Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, strSQL, parms));

            return i > 0;
        }

        public void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            #region - T-SQL -
            StringBuilder strSQL = new StringBuilder(BuildTable(usernames, roleNames));
            strSQL.AppendFormat("DELETE FROM Member2Role  WHERE EXISTS(SELECT NULL AS EMPTY FROM {0} AS m INNER JOIN @t AS t ON t.username=m.CampusConnectID INNER JOIN Role AS r ON r.Name=t.rolename WHERE m.ID=MemberID AND r.ID=RoleID)",MemberTableName);
            #endregion

            SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, strSQL);
        }

        #region - BuildTable -
        string BuildTable(string[] usernames, string[] roleNames)
        {
            StringBuilder strTable = new StringBuilder("DECLARE @t table(rolename varchar(50),username varchar(50));");
            foreach (string rolename in roleNames)
            {
                foreach (string username in usernames)
                {
                    strTable.AppendFormat(" INSERT INTO @t SELECT '{0}','{1}';", rolename, username);
                }
            }

            return strTable.ToString();
        }
        #endregion
    }
}
