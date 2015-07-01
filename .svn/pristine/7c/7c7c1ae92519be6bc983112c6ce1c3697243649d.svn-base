using System;
using System.IO;
using System.Web;
using ICStars2_0.Framework;

namespace ICStars2_0.BusinessLayer.TimerEvent.Events
{
    //this doesn't work in the production environment because the server will kill the thread that would run for a long time
    //So if we wanna use this, we have to contact IS center to make a strategy for this.
    internal class DatabaseBackupEvent : NotificationEvent, INotification, IWeakReferenceRegister
    {
        protected override string FilePath
        {
            get { return HttpContext.Current.Server.MapPath("/App_Data/Settings/Notification/DatabaseBackupEvent.xml"); }
        }

        protected override void Process()
        {
            string rootpath = System.AppDomain.CurrentDomain.BaseDirectory;
            var btsList = new[]
                {
                    new BackupToSql("CBO", "ID")
                    ,
                    new BackupToSql("Course", "ID")
                    ,
                    new BackupToSql("EventRequestForm", "ID")
                    ,
                    new BackupToSql("ProjectRequestForm", "ID")
                    ,
                    new BackupToSql("Member", "ID")
                    ,
                    new BackupToSql("Member2Role", "MemberID")
                    ,
                    new BackupToSql("Member2CBO", "MemberID")
                    ,
                    new BackupToSql("Role", "ID")
                    ,
                    new BackupToSql("ServiceHours", "ID")
                    ,
                    new BackupToSql("ServiceLearnersApplication", "ID")
                    ,
                    new BackupToSql("Student", "ID")
                    ,
                    new BackupToSql("Student2CBO", "StudentID")
                    ,
                    new BackupToSql("WebsiteNav", "ID")
                };
            foreach (var sql in btsList)
            {
                var datestamp = DateTime.Now.ToString("MM-dd-yyyy");
                var folderpath = rootpath + "/log/db/" + datestamp;
                if (!Directory.Exists(folderpath))
                {
                    Directory.CreateDirectory(folderpath);
                }
                sql.FileNameFormat = folderpath + "/SHTracker_{0}_" + datestamp + ".sql";
                sql.Run();
                //new Thread(sql.Run).Start();
                //Thread.Sleep(1000);
            }
        }
    }
}
