using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Caching;
using ICStars2_0.Common;
using log4net;

namespace ICStars2_0.BusinessLayer
{

    public class BackupToSql
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(BackupToSql));
        /// <summary>
        /// 0 processing 1 done
        /// </summary>
        public int Status { get; set; }
        public static Cache CurrentCache
        {
            get
            {
                var context = HttpContext.Current;
                return context != null ? context.Cache : HttpRuntime.Cache;
            }
        }
        public string TableName { get; set; }
        public string PrimaryKey { get; set; }
        public string StatusDescription { get; set; }
        public string Key { get; set; }
        public string FileNameFormat { get; set; }

        public BackupToSql(string tableName, string primarykey)
        {
            TableName = tableName;
            PrimaryKey = primarykey;
            Key = "BackupToSql_" + tableName;
            CurrentCache.Add(Key, this, null,
                                          DateTime.Now.AddSeconds(10),
                                          Cache.NoSlidingExpiration,
                                          CacheItemPriority.High,
                                          CacheOnRemoved);
        }
        protected void CacheOnRemoved(string key, object value, CacheItemRemovedReason reason)
        {
            if (!key.Equals(Key))
            {
                return;
            }
            if (reason != CacheItemRemovedReason.Expired)
                return;
            var bts = (BackupToSql)value;
            if (bts.Status == 0)
            {
                CurrentCache.Add(Key, value, null,
                                          DateTime.Now.AddSeconds(10),
                                          Cache.NoSlidingExpiration,
                                          CacheItemPriority.High,
                                          CacheOnRemoved);
            }


        }
        public static BackupToSql GetInstance(string tableName)
        {
            var instance = CurrentCache["BackupToSql_" + tableName];
            return instance == null ? null : (BackupToSql)instance;
        }
        public string GetStatus()
        {
            return StatusDescription;
        }
        public void Run()
        {
            try
            {
                BuildSql(TableName, PrimaryKey);
            }
            catch (Exception exp)
            {
                Log4NetHelper.WriteLog(exp, Logger);
            }
        }
        private void BuildSql(string tableName, string primarykey)
        {
            StatusDescription = "<img src=\"/images/ajax-loader_arrows.gif\">Backing up table " + tableName;
            var tables = GetTables(tableName, primarykey);

            int i = 0;
            foreach (DataTable table in tables)
            {
                var suffix = tables.Length > 1 ? i.ToString() : "";
                StringBuilder insertbuilder = new StringBuilder();
                foreach (DataRow row in table.Rows)
                {
                    insertbuilder.AppendFormat("INSERT INTO {0}(", table.TableName);
                    var n = 0;
                    foreach (DataColumn column in table.Columns)
                    {
                        n++;
                        if (n == 1) continue;//skip ROW_NUMBER

                        insertbuilder.AppendFormat("{0},", column.ColumnName);
                    }
                    var tmp = Regex.Replace(insertbuilder.ToString(), ",$", string.Empty);
                    insertbuilder.Length = 0;
                    insertbuilder.Append(tmp);

                    insertbuilder.Append(") VALUES(");
                    n = 0;
                    foreach (DataColumn column in table.Columns)
                    {
                        n++;
                        if (n == 1) continue;//skip ROW_NUMBER
                        if (row[column.ColumnName] != null && row[column.ColumnName] is DBNull == false)
                        {
                            insertbuilder.AppendFormat("'{0}',", row[column.ColumnName].ToString().Replace("'", "''"));
                        }
                        else
                        {

                            insertbuilder.Append("null,");
                        }
                    }

                    var tmp2 = Regex.Replace(insertbuilder.ToString(), ",$", string.Empty);
                    insertbuilder.Length = 0;
                    insertbuilder.Append(tmp2);
                    insertbuilder.Append(");");
                    insertbuilder.AppendLine("");
                }

                FileHelper.WriteText(string.Format(FileNameFormat, table.TableName + suffix),
                                     insertbuilder.ToString());
                i++;
                StatusDescription = "Backing up table " + tableName + suffix + " is done! Continue to backup...";
            }
            StatusDescription = "Backing up table " + tableName + " is totally done!";
            Status = 1;
        }

        private DataTable[] GetTables(string tableName, string primaryKey)
        {
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["icstars"].ConnectionString))
            {
                conn.Open();

                // Create a command and prepare it for execution
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandTimeout = 1000000;
                    cmd.CommandText = "SELECT COUNT(*) FROM " + tableName;
                    var count = (int)cmd.ExecuteScalar();
                    var pageCount = 1;
                    var pageIndex = 1;

                    if (count > 2000)
                    {
                        pageCount = count % 2000 == 0 ? count / 2000 : count / 2000 + 1;
                    }
                    var list = new List<DataTable>();
                    for (int i = 1; i <= pageCount; i++)
                    {
                        FastPaging fp = new FastPaging();
                        fp.TableName = tableName;
                        fp.QueryFields = "*";
                        fp.PageIndex = pageIndex;
                        fp.PageSize = 2000;
                        fp.PrimaryKey = primaryKey;
                        fp.PageIndex = i;
                        cmd.CommandText = fp.Build2005();
                        // Create the DataAdapter & DataSet
                        using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                        {
                            DataSet ds = new DataSet();

                            // Fill the DataSet using default values for DataTable names, etc
                            da.Fill(ds);
                            da.FillSchema(ds, SchemaType.Mapped);
                            // Detach the SqlParameters from the command object, so they can be used again
                            cmd.Parameters.Clear();
                            conn.Close();
                            // Return the dataset
                            DataTable dt = ds.Tables[0];
                            dt.TableName = tableName;
                            list.Add(dt);
                        }
                    }

                    return list.ToArray();
                }
            }
        }
    }
}
