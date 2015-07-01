using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace ICStars.Data
{
    #region = SQLPlus =
    /// <summary>
    /// 此类仅传入连接串的KEY，不能传连接串。
    /// 如需使用连接串，请用SqlHelper
    /// </summary>
    public static class SQLPlus
    {
        private static string GetConnectionString(string connectionKey)
        {
            if (!string.IsNullOrEmpty(ConfigurationManager.AppSettings["IsEncryptedSQLPlus"]))
            {
                try
                {
                    bool isEncrpted = Convert.ToBoolean(ConfigurationManager.AppSettings["IsEncryptedSQLPlus"]);
                    if (isEncrpted)
                    {
                        return
                            ICStars2_0.Common.EncryptDecryptHelper.Decrypt(
                                ConfigurationManager.ConnectionStrings[connectionKey].ConnectionString,
                                ICStars2_0.Common.Const.CONNECTION_ENCRYPTED_KEY);
                    }
                }catch(Exception exp)
                {
#if DEBUG
                    throw exp;
#endif
                    throw new Exception("The connection string is not correct or the configuration of appsettings is wrong!");
                }
            }
            return ConfigurationManager.ConnectionStrings[connectionKey].ConnectionString;
        }

        #region ExecuteNonQuery
        public static int ExecuteNonQuery(string connectionKey, CommandType commandType, string commandText)
        {
            return SqlHelper.ExecuteNonQuery(GetConnectionString(connectionKey), commandType, commandText);
        }

        public static int ExecuteNonQuery(CommandType commandType, StringBuilder commandText)
        {
            return ExecuteNonQuery(commandType, commandText.ToString());
        }
        public static int ExecuteNonQuery(CommandType commandType, string commandText)
        {
            string connectionKey = ConfigurationManager.AppSettings["DefaultConnectionString"];
            return ExecuteNonQuery(connectionKey, commandType, commandText);
        }
        public static int ExecuteNonQuery(string connectionKey, CommandType commandType, StringBuilder commandText)
        {
            return ExecuteNonQuery(connectionKey, commandType, commandText.ToString(), (SqlParameter[])null);
        }
        public static int ExecuteNonQuery(string connectionKey, CommandType commandType, StringBuilder commandText, SqlParameter[] commandParameters)
        {
            return ExecuteNonQuery(connectionKey, commandType, commandText.ToString(), commandParameters);
        }
        public static int ExecuteNonQuery(string connectionKey, CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            return SqlHelper.ExecuteNonQuery(GetConnectionString(connectionKey), commandType, commandText, commandParameters);
        }

        public static int ExecuteNonQuery(CommandType commandType, StringBuilder commandText, SqlParameter[] commandParameters)
        {
            return ExecuteNonQuery(commandType, commandText.ToString(), commandParameters);
        }
        public static int ExecuteNonQuery(CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            string connectionString = ConfigurationManager.AppSettings["DefaultConnectionString"];
            return ExecuteNonQuery(connectionString, commandType, commandText, commandParameters);
        }


        public static int ExecuteNonQuery(string connectionKey, string spName, SqlParameter[][] parameterValues)
        {
            return SqlHelper.ExecuteNonQuery(GetConnectionString(connectionKey), spName, parameterValues);
        }

        public static int ExecuteNonQuery(string spName, SqlParameter[] parameterValues)
        {
            string connectionKey = ConfigurationManager.AppSettings["DefaultConnectionString"];
            return ExecuteNonQuery(connectionKey, CommandType.StoredProcedure, spName, parameterValues);
        }
        #endregion

        #region ExecuteDataset
        public static DataSet ExecuteDataset(string connectionKey, CommandType commandType, StringBuilder commandText)
        {
            return ExecuteDataset(connectionKey, commandType, commandText.ToString(), (SqlParameter[])null);
        }
        public static DataSet ExecuteDataset(string connectionKey, CommandType commandType, string commandText)
        {
            return ExecuteDataset(connectionKey, commandType, commandText, (SqlParameter[])null);
        }
        public static DataSet ExecuteDataset(CommandType commandType, StringBuilder commandText)
        {
            string connectionString = ConfigurationManager.AppSettings["DefaultConnectionString"];
            return ExecuteDataset(connectionString, commandType, commandText.ToString());
        }
        public static DataSet ExecuteDataset(CommandType commandType, string commandText)
        {
            string connectionString = ConfigurationManager.AppSettings["DefaultConnectionString"];
            return ExecuteDataset(connectionString, commandType, commandText);
        }
        public static DataSet ExecuteDataset(string connectionKey, CommandType commandType, StringBuilder commandText, SqlParameter[] commandParameters)
        {
            return SqlHelper.ExecuteDataset(GetConnectionString(connectionKey), commandType, commandText.ToString(), commandParameters);
        }
        public static DataSet ExecuteDataset(string connectionKey, CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            return SqlHelper.ExecuteDataset(GetConnectionString(connectionKey), commandType, commandText, commandParameters);
        }
        public static DataSet ExecuteDataset(CommandType commandType, StringBuilder commandText, SqlParameter[] commandParameters)
        {
            string connectionString = ConfigurationManager.AppSettings["DefaultConnectionString"];
            return ExecuteDataset(connectionString, commandType, commandText.ToString(), commandParameters);
        }
        public static DataSet ExecuteDataset(CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            string connectionString = ConfigurationManager.AppSettings["DefaultConnectionString"];
            return ExecuteDataset(connectionString, commandType, commandText, commandParameters);
        }

        /// <summary>
        /// Execute a stored procedure via a SqlCommand (that returns a resultset) against the database specified in 
        /// the connection string using the provided parameter values.  This method will query the database to discover the parameters for the 
        /// stored procedure (the first time each stored procedure is called), and assign the values based on parameter order.
        /// </summary>
        /// <remarks>
        /// This method provides no access to output parameters or the stored procedure's return value parameter.
        /// 
        /// e.g.:  
        ///  DataSet ds = ExecuteDataset(connString, "GetOrders", 24, 36);
        /// </remarks>
        /// <param name="connectionString">A valid connection string for a SqlConnection</param>
        /// <param name="spName">The name of the stored procedure</param>
        /// <param name="parameterValues">An array of objects to be assigned as the input values of the stored procedure</param>
        /// <returns>A dataset containing the resultset generated by the command</returns>
        public static DataSet ExecuteDataset(string connectionKey, string spName, SqlParameter[] parameterValues)
        {
            return SqlHelper.ExecuteDataset(GetConnectionString(connectionKey), spName, parameterValues);
        }
        public static DataSet ExecuteDataset(string spName, SqlParameter[] parameterValues)
        {
            string connectionString = ConfigurationManager.AppSettings["DefaultConnectionString"];
            return ExecuteDataset(connectionString, spName, parameterValues);
        }
        #endregion ExecuteDataset

        #region ExecuteDataTable

        public static DataTable ExecuteDataTable(string connectionKey, CommandType commandType, StringBuilder commandText)
        {
            return ExecuteDataTable(connectionKey, commandType, commandText.ToString());
        }
        public static DataTable ExecuteDataTable(string connectionKey, CommandType commandType, string commandText)
        {
            return ExecuteDataset(connectionKey, commandType, commandText, (SqlParameter[])null).Tables[0];
        }

        public static DataTable ExecuteDataTable(CommandType commandType, StringBuilder commandText)
        {
            return ExecuteDataTable(commandType, commandText.ToString());
        }
        public static DataTable ExecuteDataTable(CommandType commandType, string commandText)
        {
            string connectionString = ConfigurationManager.AppSettings["DefaultConnectionString"];
            return ExecuteDataTable(connectionString, commandType, commandText);
        }

        /// <summary>
        /// Execute a SqlCommand (that returns a resultset) against the database specified in the connection string 
        /// using the provided parameters.
        /// </summary>
        /// <remarks>
        /// e.g.:  
        ///  DataTable ds = ExecuteDataTable(CommandType.StoredProcedure, "GetOrders", new SqlParameter("@prodid", 24));
        /// </remarks>
        /// <param name="commandType">The CommandType (stored procedure, text, etc.)</param>
        /// <param name="commandText">The stored procedure name or T-SQL command</param>
        /// <param name="commandParameters">An array of SqlParamters used to execute the command</param>
        /// <returns>A dataset containing the resultset generated by the command</returns>
        public static DataTable ExecuteDataTable(string connectionKey, CommandType commandType, StringBuilder commandText, SqlParameter[] commandParameters)
        {
            return ExecuteDataTable(connectionKey, commandType, commandText.ToString(), commandParameters);
        }
        public static DataTable ExecuteDataTable(string connectionKey, CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            string connectionString = GetConnectionString(connectionKey);
            DataSet ds = SqlHelper.ExecuteDataset(connectionString, commandType, commandText, commandParameters);
            return SqlHelper.ExecuteDataset(connectionString, commandType, commandText, commandParameters).Tables[0];
            //if (ds.Tables.Count == 1)
            //{
            //    return SqlHelper.ExecuteDataset(connectionString, commandType, commandText, commandParameters).Tables[0];
            //}

            //return null;
        }

        public static DataTable ExecuteDataTable(CommandType commandType, StringBuilder commandText, SqlParameter[] commandParameters)
        {
            return ExecuteDataTable(commandType, commandText.ToString(), commandParameters);
        }
        public static DataTable ExecuteDataTable(CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            string connectionString = ConfigurationManager.AppSettings["DefaultConnectionString"];
            return ExecuteDataTable(connectionString, commandType, commandText, commandParameters);
        }

        /// <summary>
        /// Execute a stored procedure via a SqlCommand (that returns a resultset) against the database specified in 
        /// the connection string using the provided parameter values.  This method will query the database to discover the parameters for the 
        /// stored procedure (the first time each stored procedure is called), and assign the values based on parameter order.
        /// </summary>
        /// <remarks>
        /// This method provides no access to output parameters or the stored procedure's return value parameter.
        /// 
        /// e.g.:  
        ///  DataTable ds = ExecuteDataTable(connString, "GetOrders", 24, 36);
        /// </remarks>
        /// <param name="connectionString">A valid connection string for a SqlConnection</param>
        /// <param name="spName">The name of the stored procedure</param>
        /// <param name="parameterValues">An array of objects to be assigned as the input values of the stored procedure</param>
        /// <returns>A dataset containing the resultset generated by the command</returns>
        public static DataTable ExecuteDataTable(string connectionKey, string spName, SqlParameter[] parameterValues)
        {
            return SqlHelper.ExecuteDataset(GetConnectionString(connectionKey), spName, parameterValues).Tables[0];
        }
        public static DataTable ExecuteDataTable(string spName, SqlParameter[] parameterValues)
        {
            string connectionString = ConfigurationManager.AppSettings["DefaultConnectionString"];
            return ExecuteDataTable(connectionString, spName, parameterValues);
        }
        #endregion ExecuteDataset

        #region ExecuteScalar

        public static object ExecuteScalar(string connectionKey, CommandType commandType, StringBuilder commandText, SqlParameter[] commandParameters)
        {
            return ExecuteScalar(connectionKey, commandType, commandText.ToString(), commandParameters);
        }
        public static object ExecuteScalar(string connectionKey, CommandType commandType, StringBuilder commandText)
        {
            return ExecuteScalar(connectionKey, commandType, commandText.ToString());
        }
        public static object ExecuteScalar(string connectionKey, CommandType commandType, string commandText)
        {
            return SqlHelper.ExecuteScalar(GetConnectionString(connectionKey), commandType, commandText);
        }

        public static object ExecuteScalar(string connectionKey, CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            return SqlHelper.ExecuteScalar(GetConnectionString(connectionKey), commandType, commandText, commandParameters);
        }

        public static object ExecuteScalar(CommandType commandType, StringBuilder commandText, SqlParameter[] commandParameters)
        {
            return ExecuteScalar(commandType, commandText.ToString(), commandParameters);
        }
        public static object ExecuteScalar(CommandType commandType, StringBuilder commandText)
        {
            return ExecuteScalar(commandType, commandText.ToString(), (SqlParameter[])null);
        }

        public static object ExecuteScalar(CommandType commandType, string commandText)
        {
            return ExecuteScalar(ConfigurationManager.AppSettings["DefaultConnectionString"], commandType, commandText, (SqlParameter[])null);
        }
        public static object ExecuteScalar(CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            return ExecuteScalar(ConfigurationManager.AppSettings["DefaultConnectionString"], commandType, commandText, commandParameters);
        }

        public static object ExecuteScalar(string connectionKey, string spName, SqlParameter[] parameterValues)
        {
            return ExecuteScalar(connectionKey, CommandType.StoredProcedure, spName, parameterValues);
        }
        #endregion ExecuteScalar

        #region ExecuteDataRow
        public static DataRow ExecuteDataRow(string connectionKey, CommandType commandType, string commandText)
        {
            return ExecuteDataRow(connectionKey, commandType, commandText, null);
        }
        public static DataRow ExecuteDataRow(string connectionKey, CommandType commandType, StringBuilder commandText)
        {
            return ExecuteDataRow(connectionKey, commandType, commandText.ToString(), null);
        }
        public static DataRow ExecuteDataRow(CommandType commandType, StringBuilder commandText)
        {
            return ExecuteDataRow(commandType, commandText.ToString());
        }

        public static DataRow ExecuteDataRow(CommandType commandType, string commandText)
        {
            DataTable oTable = ExecuteDataTable(commandType, commandText);

            if (oTable.Rows.Count == 1)
            {
                return oTable.Rows[0];
            }

            return null;
        }

        public static DataRow ExecuteDataRow(CommandType commandType, StringBuilder commandText, SqlParameter[] commandParameters)
        {
            return ExecuteDataRow(commandType, commandText.ToString(), commandParameters);
        }
        public static DataRow ExecuteDataRow(CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            DataTable oTable = ExecuteDataTable(commandType, commandText, commandParameters);

            if (oTable.Rows.Count == 1)
            {
                return oTable.Rows[0];
            }

            return null;
        }
        public static DataRow ExecuteDataRow(string connectionKey, CommandType commandType, StringBuilder commandText, SqlParameter[] commandParameters)
        {
            return ExecuteDataRow(connectionKey, commandType, commandText.ToString(), commandParameters);
        }
        public static DataRow ExecuteDataRow(string connectionKey, CommandType commandType, string commandText, SqlParameter[] commandParameters)
        {
            DataTable oTable = null;
            if (string.IsNullOrEmpty(connectionKey) == false)
            {
                oTable = ExecuteDataTable(connectionKey, commandType, commandText, commandParameters);
            }
            else
            {
                oTable = ExecuteDataTable(commandType, commandText, commandParameters);
            }

            if (oTable.Rows.Count == 1)
            {
                return oTable.Rows[0];
            }

            return null;
        }
        #endregion

        #region =BulkCopy=
        /// <summary>
        /// 批量插入数据
        /// </summary>
        /// <typeparam name="T">跟数据表同名的实体类型</typeparam>
        /// <param name="connectionKey">连接字符串KEY</param>
        /// <param name="list">包含数据的跟数据表同名的实体类集合</param>
        /// <returns></returns>
        public static bool BulkCopy<T>(string connectionKey, IEnumerable<T> list)
        {
            string connectionString = GetConnectionString(connectionKey);
            return SqlHelper.BulkCopy(connectionString, list);
        }
        #endregion
    }

    #endregion
}
