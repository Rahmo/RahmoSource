using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Caching;
using System.Web.Mvc;
using ICStars.Data;
using ICStars2_0.BusinessLayer;
using ICStars2_0.Common;
using ICStars2_0.Mvc.Filter;
using System.Runtime.CompilerServices;

namespace ICStars2_0.Areas.SHTracker.Controllers
{
    [MvcAuthorize(Roles = "admin,admin_backup")]
    public class DatabaseController : Controller
    {
        //
        // GET: /SHTracker/Backup/

        public ActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Backup()
        {
            var FileNameFormat = Server.MapPath("/log/db/SHTracker_{0}_" + DateTime.Now.ToString("MM-dd-yyyy") + ".sql");
            string[] tableNameKeyIDs = Request.Form["Tables"].Split(',');
            foreach (string tableNameKeyID in tableNameKeyIDs)
            {
                var bts = new BackupToSql(tableNameKeyID.Split('|')[0], tableNameKeyID.Split('|')[1]);
                bts.FileNameFormat = FileNameFormat;
                new Thread(bts.Run).Start();
            }
            ViewBag.StartChecking = true;
            return View("Index");
        }

        public ActionResult GetBackupStatus()
        {
            string tableName = Request.QueryString["table"];
            BackupToSql bts = BackupToSql.GetInstance(tableName);
            if (bts != null)
            {
                return Content(bts.GetStatus());
            }
            return Content("done");
        }

        public ActionResult Query()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Query(int method, string sql)
        {
            sql = sql.Trim();
            ViewBag.SQL = sql;
            #region =Select=

            if (method == 0)
            {
                var dt = SQLPlus.ExecuteDataTable(CommandType.Text, sql);
                var html=new StringBuilder("<table><tr>");
                foreach (DataColumn col in dt.Columns)
                {
                    html.AppendFormat("<th>{0}</th>", col.ColumnName);
                }
                html.Append("</tr>");
                foreach (DataRow row in dt.Rows)
                {
                    html.Append("<tr>");
                    foreach (DataColumn col in dt.Columns)
                    {
                        html.Append("<td>");
                        html.Append(row[col.ColumnName] + "&nbsp;");
                        html.Append("</td>");
                    }
                    html.Append("</tr>");
                }
                html.Append("</table>");
                ViewBag.HTML = html.ToString();
                return View();
            }

            #endregion

            ViewBag.HTML = string.Format("Command(s) completed successfully.<br/>{0} rows affected ", SQLPlus.ExecuteNonQuery(CommandType.Text, sql));
            return View();
        }
    }
}
