using System;
using System.Collections.Generic;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text.RegularExpressions;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using ICStars2_0.Common.Reflection;

namespace ICStars2_0.Common
{
    /// <summary>
    /// Excel access
    /// created by lihui 20100716
    /// </summary>
    public static class ExcelHelper
    {
        #region =2007 Office System Driver: Data Connectivity Components=

        public static DataTable ExecuteDataTable(string filePath, string sheetName)
        {
            var t = OleDbHelper.ExecuteDataTable(BuildConnectionString(filePath), CommandType.Text,
                                                     string.Format(@"SELECT * FROM [{0}$]", sheetName));
            #region =过滤空行=

            var rowListForRemove = new List<DataRow>();
            for (var i = 0; i < t.Rows.Count; i++)
            {
                var isNull = true;
                for (var j = 0; j < t.Columns.Count; j++)
                {
                    var o = t.Rows[i][j];
                    if (o == null || o is DBNull)
                        continue;
                    var s = Convert.ToString(o);
                    if (string.IsNullOrEmpty(s.Trim()))
                        continue;
                    isNull = false;
                    break;
                }
                if (isNull)
                    rowListForRemove.Add(t.Rows[i]);
            }
            foreach (var row in rowListForRemove)
            {
                t.Rows.Remove(row);
            }
            #endregion
            return t;
        }
        private static string BuildConnectionString(string filePath)
        {
            var fi = new FileInfo(filePath);
            if (!fi.Exists)
            {
                throw new IOException(string.Format("文件[{0}]不存在！", filePath));
            }
            if (fi.Extension.ToLower().Equals(".xls"))
            {
                return string.Format(
                        @"Provider=Microsoft.Jet.OLEDB.4.0;Data Source={0};Extended Properties='Excel 8.0;HDR=Yes;IMEX=1;'",
                        filePath);
            }
            if (fi.Extension.ToLower().Equals(".xlsx"))
            {
                //要求安装office2007数据连接组件
                return string.Format(
                    @"Provider=Microsoft.ace.oledb.12.0;Data Source={0};Extended Properties='Excel 12.0;HDR=Yes;IMEX=1;'",
                    filePath);
            }
            throw new Exception("文件类型必须是Excel!");
        }

        #endregion
        #region =Open XML SDK=
        /// <summary>
        /// 
        /// </summary>
        /// <typeparam name="T">Property names of T must be exactly same as column names in the Excel.</typeparam>
        /// <param name="table">Built table from the Excel.</param>
        /// <returns></returns>
        public static IEnumerable<T> BuildList<T>(object[,] table)
        {
            var list = new List<T>();
            Type t = typeof(T);
                PropertyInfo[] props = t.GetProperties();
            for (int i = 1; i < table.GetLength(0); i++)
            {
                var item = Activator.CreateInstance<T>();
                for (int j = 0; j < table.GetLength(1); j++)
                {
                    var title = Regex.Replace(table[0, j].ToString(), @"\s+", string.Empty);

                    var prop =
                        props.FirstOrDefault(p => p.Name.Equals(title, StringComparison.InvariantCultureIgnoreCase));
                    if (prop != null && table[i, j] != null && !string.IsNullOrEmpty(table[i, j].ToString().Trim()))
                    {
                        prop.SetValue(item, ConvertHelper.ChangeType(table[i, j], prop.PropertyType), null);
                    }
                }
                list.Add(item);
            }
            return list;
        } 
        public static object[,] BuildTable(Stream inputStream)
        {
            object[,] table = null;
            using (var doc =
                SpreadsheetDocument.Open(
                    inputStream, false))
            {
                Sheet sheet = doc.WorkbookPart.Workbook.Descendants<Sheet>().FirstOrDefault();

                var worksheetPart = (WorksheetPart) doc.WorkbookPart.GetPartById(sheet.Id);

                var headers = worksheetPart.Worksheet.Descendants<Row>()
                                           .FirstOrDefault(x => x.RowIndex == 1);
                SheetData sheetData = worksheetPart.Worksheet.GetFirstChild<SheetData>();
                var allRows = sheetData.Elements<Row>()
                                       .Where(x => x.RowIndex > 1 && !string.IsNullOrEmpty(x.InnerText)).ToList();
                var headerCells = headers.Descendants<Cell>().ToList();
                var headerCellReferences =
                    headerCells.Select(c => Regex.Replace(c.CellReference, @"\d+", string.Empty)).ToArray();
                
                SharedStringTablePart sstPart = doc.WorkbookPart.GetPartsOfType<SharedStringTablePart>().First();
                SharedStringTable ssTable = sstPart.SharedStringTable;

                WorkbookStylesPart workbookStylesPart = doc.WorkbookPart.GetPartsOfType<WorkbookStylesPart>().First();

                CellFormats cellFormats = workbookStylesPart.Stylesheet.CellFormats;
                var headerStrings = headerCells.Select(c => ProcessCellValue(c, ssTable, cellFormats)).ToArray();
                table = new object[allRows.Count + 1,headerStrings.Length];
                //assign column title to the table
                for (int i = 0; i < headerStrings.Length; i++)
                {
                    table[0, i] = headerStrings[i];
                }

                //assign all cell values to the table
                for (int i = 0; i < allRows.Count; i++)
                {
                    var cells = allRows[i].Elements<Cell>().Select(c =>
                        {
                            c.CellReference = Regex.Replace(c.CellReference, @"\d+", string.Empty);
                            return c;
                        });
                    for (int j = 0; j < headerCells.Count; j++)
                    {
                        table[i + 1, j] =
                            ProcessCellValue(
                                cells.FirstOrDefault(
                                       c =>
                                       c.CellReference == headerCellReferences[j]),
                                ssTable, cellFormats);
                    }
                }
            }
            return table;
        }
        /// <summary>
        /// Process the valus of a cell and return a .NET value
        /// </summary>
        private static object ProcessCellValue(Cell c, SharedStringTable ssTable, CellFormats cellFormats)
        {
            if (c == null) return null;
            // If there is no data type, this must be a string that has been formatted as a number
            if (c.DataType == null)
            {
                if (c.CellValue == null) return string.Empty;
                if (c.StyleIndex == null) return c.CellValue.Text;
                CellFormat cf =
                    cellFormats.Descendants<CellFormat>()
                               .ElementAt<CellFormat>(Convert.ToInt32(c.StyleIndex.Value));
                if (cf.NumberFormatId >= 0 && cf.NumberFormatId <= 13) // This is a number
                {
                    return Convert.ToDecimal(c.CellValue.Text);
                }
                if (cf.NumberFormatId >= 14 && cf.NumberFormatId <= 22) // This is a date
                {
                    return DateTime.FromOADate(Convert.ToDouble(c.CellValue.Text));
                }
                return c.CellValue.Text;
            }

            switch (c.DataType.Value)
            {
                case CellValues.SharedString:
                    return ssTable.ChildElements[Convert.ToInt32(c.CellValue.Text)].InnerText;
                case CellValues.Boolean:
                    return c.CellValue.Text == "1";
                case CellValues.Date:
                    return DateTime.FromOADate(Convert.ToDouble(c.CellValue.Text));
                case CellValues.Number:
                    return Convert.ToDecimal(c.CellValue.Text);
                default:
                    return c.CellValue != null ? c.CellValue.Text : string.Empty;
            }
        }
        
        #endregion
    }

    /// <summary>
    /// OleDb access
    /// created by lihui 20100716
    /// </summary>
    class OleDbHelper
    {
        #region =ExecuteDataset=

        public static DataSet ExecuteDataset(string connectionString, CommandType commandType, string commandText)
        {
            return ExecuteDataset(connectionString, commandType, commandText, (OleDbParameter[])null);
        }

        public static DataSet ExecuteDataset(string connectionString, CommandType commandType, string commandText, params OleDbParameter[] commandParameters)
        {
            using (var cn = new OleDbConnection(connectionString))
            {
                cn.Open();

                //调用重载方法
                return ExecuteDataset(cn, commandType, commandText, commandParameters);
            }
        }



        public static DataSet ExecuteDataset(OleDbConnection connection, CommandType commandType, string commandText)
        {
            return ExecuteDataset(connection, commandType, commandText, (OleDbParameter[])null);
        }

        public static DataSet ExecuteDataset(OleDbConnection connection, CommandType commandType, string commandText, params OleDbParameter[] commandParameters)
        {
            //创建一个OleDbCommand对象，并对其进行初始化
            OleDbCommand cmd = new OleDbCommand();
            PrepareCommand(cmd, connection, (OleDbTransaction)null, commandType, commandText, commandParameters);

            //创建OleDbDataAdapter对象以及DataSet
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            DataSet ds = new DataSet();

            //填充ds
            da.Fill(ds);

            // 清除cmd的参数集合	
            cmd.Parameters.Clear();
            if (cmd.Connection.State == ConnectionState.Open)
            {
                cmd.Connection.Close();
            }
            //返回ds
            return ds;
        }

        #endregion

        #region =ExecuteDataTable=

        public static DataTable ExecuteDataTable(string connectionString, CommandType commandType, string commandText)
        {
            return ExecuteDataTable(connectionString, commandType, commandText, (OleDbParameter[])null);
        }

        public static DataTable ExecuteDataTable(string connectionString, CommandType commandType, string commandText, params OleDbParameter[] commandParameters)
        {
            using (OleDbConnection cn = new OleDbConnection(connectionString))
            {
                cn.Open();

                //调用重载方法
                return ExecuteDataTable(cn, commandType, commandText, commandParameters);
            }
        }



        public static DataTable ExecuteDataTable(OleDbConnection connection, CommandType commandType, string commandText)
        {
            return ExecuteDataTable(connection, commandType, commandText, (OleDbParameter[])null);
        }

        public static DataTable ExecuteDataTable(OleDbConnection connection, CommandType commandType, string commandText, params OleDbParameter[] commandParameters)
        {
            //创建一个OleDbCommand对象，并对其进行初始化
            OleDbCommand cmd = new OleDbCommand();
            PrepareCommand(cmd, connection, (OleDbTransaction)null, commandType, commandText, commandParameters);

            //创建OleDbDataAdapter对象以及DataSet
            OleDbDataAdapter da = new OleDbDataAdapter(cmd);
            DataSet ds = new DataSet();

            //填充ds
            da.Fill(ds);

            // 清除cmd的参数集合	
            cmd.Parameters.Clear();
            if (cmd.Connection.State == ConnectionState.Open)
            {
                cmd.Connection.Close();
            }
            //返回ds
            return ds.Tables[0];
        }

        #endregion
        public static void PrepareCommand(OleDbCommand cmd, OleDbConnection conn, OleDbTransaction trans, CommandType cmdType, string cmdText, OleDbParameter[] cmdParms)
        {
            //判断连接的状态。如果是关闭状态，则打开
            if (conn.State != ConnectionState.Open)
                conn.Open();
            //cmd属性赋值
            cmd.Connection = conn;
            cmd.CommandText = cmdText;
            //是否需要用到事务处理
            if (trans != null)
                cmd.Transaction = trans;

            cmd.CommandType = cmdType;
            //添加cmd需要的存储过程参数
            if (cmdParms != null)
            {
                foreach (OleDbParameter parm in cmdParms)
                    cmd.Parameters.Add(parm);
            }
        }
    }
}
