using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.Common;
using ICStars2_0.Common.Attributes;

namespace ICStars2_0.SHTracker.Database
{
    [Authorize(Roles = "admin,admin_backup")]
    public partial class Backup : System.Web.UI.Page
    {
        public string fileFormat { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            fileFormat = Server.MapPath("/log/db/SHTracker_{0}_" + DateTime.Now.ToString("MM-dd-yyyy") + ".sql");
        }
        protected void btnBuild_Click(object sender, EventArgs e)
        {
            StringBuilder textBuilder = new StringBuilder();
            string[] tableNames = Request.Form["Tables"].Split(',');
            string[] tablePrimaryKeys = Request.Form["PrimaryKeys"].Split(',');
            for (int i = 0; i < tableNames.Length; i++)
            {
                BuildSql(tableNames[i], tablePrimaryKeys[i]);
            }
            Response.Write("done!");
            //Response.Clear();                      
            //Response.ClearHeaders();
            //Response.ContentEncoding = Encoding.Unicode;
            //Response.ContentType = "application/ms-txt";
            //Response.AppendHeader("Content-Disposition",
            //                      "attachment;filename=SHTracker_" + DateTime.Now.ToString("MM-dd-yyyy") + ".sql");                 

            //Response.Write(textBuilder.ToString());
            //Response.Flush();
            //Response.End();    
        }
        public void BuildSql(string tableName,string primarykey)
        {

            var tables = GetTables(tableName,primarykey);
            
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
                
                FileHelper.WriteText(string.Format(fileFormat, table.TableName + suffix),
                                     insertbuilder.ToString());
                i++;
            }
        }
        //public static DataTable GetTable(string tableName)
        //{
        //    using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["icstars"].ConnectionString))
        //    {
        //        conn.Open();
                
        //        // Create a command and prepare it for execution
        //        using (SqlCommand cmd = conn.CreateCommand())
        //        {
        //            cmd.CommandType = CommandType.Text;
        //            cmd.CommandTimeout = 1000000;
        //            cmd.CommandText = "SELECT * FROM " + tableName;
        //            // Create the DataAdapter & DataSet
        //            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
        //            {
        //                DataSet ds = new DataSet();

        //                // Fill the DataSet using default values for DataTable names, etc
        //                da.Fill(ds);
        //                da.FillSchema(ds, SchemaType.Mapped);
        //                // Detach the SqlParameters from the command object, so they can be used again
        //                cmd.Parameters.Clear();
        //                conn.Close();
        //                // Return the dataset
        //                DataTable dt= ds.Tables[0];
        //                dt.TableName = tableName;
        //                return dt;
        //            }
        //        }
        //    }
        //}

        public static DataTable[] GetTables(string tableName,string primaryKey)
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
                        pageCount = count%2000 == 0 ? count/2000 : count/2000 + 1;
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