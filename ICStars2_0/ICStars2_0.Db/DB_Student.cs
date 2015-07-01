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
    #region = DBLayer Student =
    internal class DB_Student : IDB_Student, IWeakReferenceRegister
    {
        private const string ConnectionKey = "icstars";
        public DataTable ReportList(StudentReportCollectionSettings settings)
        {
            StringBuilder sbSql = new StringBuilder(@"WITH HoursTable(StudentID,CBOID,CourseID,Quater_Year, TotalHours)
AS
(
	SELECT StudentID,CBO_ID as CBOID,CourseID,Quater_Year, SUM(HoursServed)
	FROM ServiceHours
	GROUP BY StudentID,CBO_ID,CourseID,Quater_Year
)
Select s2c.Quater_Year,FirstName,Lastname,Orientation,h.TotalHours AS HoursCompleted,RequiredHours as RequiredServeHours, LastUpdateTime FROM student as s
INNER JOIN Student2CBO as s2c on s2c.StudentID=s.ID
LEFT JOIN HoursTable as h
ON h.studentID=s.ID AND h.CBOID=s2c.CBOID AND h.Quater_Year=s2c.Quater_Year AND h.CourseID=s.CourseID
WHERE s2c.CBOID=@CBO_ID AND s.CourseID=@CourseID
");
            if (!string.IsNullOrEmpty(settings.Quater_Year))
            {
                sbSql.Append(" AND s2c.Quater_Year=@Quater_Year");
            }
            if (settings.QuaterYearArray != null)
            {
                sbSql.AppendFormat(" AND s2c.Quater_Year in ({0})", settings.QuaterYearArray.Select(s => string.Format("'{0}'", s.Replace("'", "''"))).ToString(","));
            }
            if (settings.StudentType != StudentType.All)
            {
                sbSql.Append(" AND s.[Type]=@Type");
            }
            SqlParameter[] parms = new SqlParameter[]
                                       {
                                           
                                           new SqlParameter("@CBO_ID",SqlDbType.Int){Value=settings.CBOID}, 
                                           
                                           new SqlParameter("@CourseID",SqlDbType.Int){Value=settings.CourseID},
                                           new SqlParameter("@Quater_Year",SqlDbType.VarChar,50){Value=settings.Quater_Year},
                                           new SqlParameter("@Type",SqlDbType.Int){Value=(int)settings.StudentType}
                                       };
            return SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, sbSql,parms);
        }
        public int Count(StudentCollectionSettings settings)
        {
            StringBuilder sbSql = new StringBuilder("SELECT COUNT(*) FROM Student WITH(NOLOCK) INNER JOIN Student2CBO as s2c ON s2c.StudentID=Student.ID");
            List<SqlParameter> parms = new List<SqlParameter>();
            if(settings!=null)
            {
                sbSql.Append(" WHERE 1=1");
                if (!settings.IsOthersToBeCalled && !string.IsNullOrEmpty(settings.SLC))
                {
                    sbSql.Append(" AND SLC=@SLC");
                    parms.Add(new SqlParameter("@SLC", SqlDbType.VarChar, 100) { Value = settings.SLC });
                }
                if (settings.IsOthersToBeCalled && !string.IsNullOrEmpty(settings.SLC))
                {
                    sbSql.Append(" AND SLC<>@SLC");
                    parms.Add(new SqlParameter("@SLC", SqlDbType.VarChar, 100) { Value = settings.SLC });
                }
                if(!string.IsNullOrEmpty(settings.Staff))
                {
                    sbSql.Append(" AND Staff=@Staff");
                    parms.Add(new SqlParameter("@Staff", SqlDbType.VarChar, 100) {Value = settings.Staff});
                }
                if (settings.StudentType != StudentType.All)
                {
                    sbSql.Append(" AND [Type]=@Type");
                    parms.Add(new SqlParameter("@Type", SqlDbType.Int) { Value = (int)settings.StudentType });
                }
                if (!string.IsNullOrEmpty(settings.QuaterYear))
                {
                    sbSql.Append(" AND s2c.Quater_Year=@Quater_Year");
                    parms.Add(new SqlParameter("@Quater_Year", SqlDbType.VarChar, 50) { Value = settings.QuaterYear });
                }
                if (settings.QuaterYearArray != null)
                {
                    sbSql.AppendFormat(" AND s2c.Quater_Year in ({0})", settings.QuaterYearArray.Select(s => string.Format("'{0}'", s.Replace("'", "''"))).ToString(","));
                }
                if(!string.IsNullOrEmpty(settings.FirstNameForSearch))
                {
                    sbSql.Append(" AND FirstName LIKE @FirstName +'%'");
                    parms.Add(new SqlParameter("@FirstName", SqlDbType.VarChar, 50) { Value = settings.FirstNameForSearch });
                }
                if (!string.IsNullOrEmpty(settings.LastNameForSearch))
                {
                    sbSql.Append(" AND LastName LIKE @LastName +'%'");
                    parms.Add(new SqlParameter("@LastName", SqlDbType.VarChar, 50) { Value = settings.LastNameForSearch });
                }
                if (!string.IsNullOrEmpty(settings.DPU_ID))
                {
                    sbSql.Append(" AND DPU_ID=@DPU_ID");
                    parms.Add(new SqlParameter("@DPU_ID", SqlDbType.VarChar, 50) { Value = settings.DPU_ID });
                }
                if (settings.CourseID > 0)
                {
                    sbSql.Append(" AND CourseID=@CourseID");
                    parms.Add(new SqlParameter("@CourseID", SqlDbType.Int) { Value = settings.CourseID });
                }
                if (settings.IsToBeCalled)
                {
                    sbSql.AppendFormat(" AND Orientation <>'Dropped' AND IsProject=0 and s2c.RequiredHours>0 and s2c.ServedTotalHours<s2c.RequiredHours AND (exists(select NULL AS EMPTY FROM ServiceHours where StudentID=Student.ID and CBO_ID=s2c.CBOID and ContactType <> 'System' having MAX(ServiceDate) <'{0}') or not exists(select NULL AS EMPTY FROM ServiceHours where StudentID=Student.ID and CBO_ID=s2c.CBOID))", DateTime.Now.AddDays(-7).ToString("MM/dd/yyyy"));
                }
            }

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, sbSql, parms.ToArray()));
        }
        public DataTable List(int pageIndex, int pageSize, StudentCollectionSettings settings)
        {
            StringBuilder strCondition = new StringBuilder();
            List<SqlParameter> parms = new List<SqlParameter>();
            FastPaging fp = new FastPaging();
            fp.PageIndex = pageIndex;
            fp.PageSize = pageSize;
            fp.TableName = "Student";
            fp.TableReName = "s";
            //fp.OrderByTableName = "s";
            fp.JoinSQL = "INNER JOIN Student2CBO as s2c ON s.ID=s2c.StudentID LEFT JOIN CBO AS c ON c.ID=s2c.CBOID LEFT JOIN Course AS cs ON cs.ID=s.CourseID";
            fp.QueryFields =
                "s.[ID],[CourseID],s2c.CBOID,s.[Staff],s.[SLC],s.[CreateDate],s2c.[Quater_Year],[AvailableDateTime],[FirstName],[LastName],[DPU_ID],[Email],[PrimaryPhone],[AlternatePhone],[ReachMethod],[Gender],[PermanentAddress],[City],[State],[ZipCode],[Name_Of_Emergency_Contact],[TelephoneNumber],[School],[Major],[Expected_Graduation_Date],[ClassStanding],[CommunityServiceStudies],[I_have_taken_Service_Learning_Course],[I_would_like_to_add_my_email_to_Steans_Center_listserv],Orientation,s.[Type],LastUpdateTime,RequiredHours as RequiredServeHours,s2c.ServedTotalHours as ServedHours,IsProject,c.Name AS CBOName, cs.Subject AS CourseSubject, cs.CatalogNumber as CourseCatalogNumber, cs.InstructorName AS CourseInstructorName,cs.TermDescription AS CourseTerm,cs.ClassSection as CourseSection";

            fp.Ascending = FastPaging.IsAscending("DESC");
            fp.WithOptions = "WITH(NOLOCK)";

            fp.PrimaryKey = "ID";
            if (settings != null)
            {
                fp.Ascending = settings.IsAscending;
                if (settings.IsOrderByFirstName)
                {
                    fp.PrimaryKey = "FirstName";
                }
                else if (settings.IsOrderByCBOName)
                {
                    fp.PrimaryKey = "Name";
                    fp.OverOrderByTableName = "c";
                }
                else if (settings.IsOrderByCourseSubject)
                {
                    fp.PrimaryKey = "Subject";
                    fp.OverOrderByTableName = "cs";
                }
                else if (settings.IsOrderByOrientation)
                {
                    fp.PrimaryKey = "Orientation";
                }
                else if (settings.IsOrderByServedHours)
                {
                    fp.PrimaryKey = "ServedTotalHours";
                    fp.OverOrderByTableName = "s2c";
                }
                else if (settings.IsOrderBySLC)
                {
                    fp.PrimaryKey = "SLC";
                }
                strCondition.Append("1=1");
                if (!settings.IsOthersToBeCalled && !string.IsNullOrEmpty(settings.SLC))
                {
                    strCondition.Append(" AND s.SLC=@SLC");
                    parms.Add(new SqlParameter("@SLC", SqlDbType.VarChar, 100) {Value = settings.SLC});
                }
                if (settings.IsOthersToBeCalled && !string.IsNullOrEmpty(settings.SLC))
                {
                    strCondition.Append(" AND s.SLC<>@SLC");
                    parms.Add(new SqlParameter("@SLC", SqlDbType.VarChar, 100) { Value = settings.SLC });
                }
                if (!string.IsNullOrEmpty(settings.Staff))
                {
                    strCondition.Append(" AND s.Staff=@Staff");
                    parms.Add(new SqlParameter("@Staff", SqlDbType.VarChar, 100) {Value = settings.Staff});
                }
                if (settings.StudentType!= StudentType.All)
                {
                    strCondition.Append(" AND s.[Type]=@Type");
                    parms.Add(new SqlParameter("@Type", SqlDbType.Int) { Value = (int)settings.StudentType });
                }
                if (!string.IsNullOrEmpty(settings.QuaterYear))
                {
                    strCondition.Append(" AND s2c.Quater_Year=@Quater_Year");
                    parms.Add(new SqlParameter("@Quater_Year", SqlDbType.VarChar, 50) {Value = settings.QuaterYear});
                }
                if (settings.QuaterYearArray != null)
                {
                    strCondition.AppendFormat(" AND s2c.Quater_Year in ({0})", settings.QuaterYearArray.Select(s => string.Format("'{0}'", s.Replace("'", "''"))).ToString(","));
                }
                if (!string.IsNullOrEmpty(settings.FirstNameForSearch))
                {
                    strCondition.Append(" AND FirstName LIKE @FirstName +'%'");
                    parms.Add(new SqlParameter("@FirstName", SqlDbType.VarChar, 50)
                                  {Value = settings.FirstNameForSearch});
                }
                if (!string.IsNullOrEmpty(settings.LastNameForSearch))
                {
                    strCondition.Append(" AND LastName LIKE @LastName +'%'");
                    parms.Add(new SqlParameter("@LastName", SqlDbType.VarChar, 50) {Value = settings.LastNameForSearch});
                }
                if (!string.IsNullOrEmpty(settings.DPU_ID))
                {
                    strCondition.Append(" AND DPU_ID=@DPU_ID");
                    parms.Add(new SqlParameter("@DPU_ID", SqlDbType.VarChar, 50) {Value = settings.DPU_ID});
                }
                if (settings.CourseID > 0)
                {
                    strCondition.Append(" AND CourseID=@CourseID");
                    parms.Add(new SqlParameter("@CourseID", SqlDbType.Int) { Value = settings.CourseID });
                }
                if (settings.IsToBeCalled)
                {
                    strCondition.AppendFormat(" AND Orientation <>'Dropped' AND IsProject=0 and s2c.RequiredHours>0 and s2c.ServedTotalHours < s2c.RequiredHours AND (exists(select NULL AS EMPTY FROM ServiceHours where StudentID=s.ID and CBO_ID=s2c.CBOID and ContactType <> 'System' having MAX(ServiceDate) <'{0}') or not exists(select NULL AS EMPTY FROM ServiceHours where StudentID=s.ID and CBO_ID=s2c.CBOID))", DateTime.Now.AddDays(-7).ToString("MM/dd/yyyy"));
                }
                fp.Condition = strCondition.ToString();
            }

            return SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, fp.Build2005(), parms.ToArray());
        }

        public DataRow StudentInfo(int ID)
        {

            SqlParameter[] parms = new[]{
                        new SqlParameter("@ID",SqlDbType.Int)
                    };

            parms[0].Value = ID;

            return SQLPlus.ExecuteDataRow(ConnectionKey, CommandType.Text, "SELECT s.[ID],[CourseID],s.[Staff],s.[SLC],[CreateDate],[AvailableDateTime],[FirstName],[LastName],[DPU_ID],[Email],[PrimaryPhone],[AlternatePhone],[ReachMethod],[Gender],[PermanentAddress],[City],[State],[ZipCode],[Name_Of_Emergency_Contact],[TelephoneNumber],[School],[Major],[Expected_Graduation_Date],[ClassStanding],[CommunityServiceStudies],[I_have_taken_Service_Learning_Course],[I_would_like_to_add_my_email_to_Steans_Center_listserv],Orientation,s.[Type],LastUpdateTime,IsProject, cs.Subject AS CourseSubject, cs.CatalogNumber as CourseCatalogNumber, cs.InstructorName AS CourseInstructorName FROM Student AS s LEFT JOIN Course AS cs ON cs.ID=s.CourseID  WHERE s.ID=@ID", parms);
        }

        public DataRow StudentInfo(string dpu_id,int courseId)
        {
            SqlParameter[] parms = new[]{
                        new SqlParameter("@DPU_ID",SqlDbType.VarChar,50){Value=dpu_id},
                        new SqlParameter("@CourseID",SqlDbType.Int){Value=courseId}
                    };


            return SQLPlus.ExecuteDataRow(ConnectionKey, CommandType.Text, "SELECT s.[ID],[CourseID],s.[Staff],s.[SLC],[CreateDate],[AvailableDateTime],[FirstName],[LastName],[DPU_ID],[Email],[PrimaryPhone],[AlternatePhone],[ReachMethod],[Gender],[PermanentAddress],[City],[State],[ZipCode],[Name_Of_Emergency_Contact],[TelephoneNumber],[School],[Major],[Expected_Graduation_Date],[ClassStanding],[CommunityServiceStudies],[I_have_taken_Service_Learning_Course],[I_would_like_to_add_my_email_to_Steans_Center_listserv],Orientation,s.[Type],LastUpdateTime,IsProject, cs.Subject AS CourseSubject, cs.CatalogNumber as CourseCatalogNumber, cs.InstructorName AS CourseInstructorName FROM Student AS s LEFT JOIN Course AS cs ON cs.ID=s.CourseID  WHERE s.DPU_ID=@DPU_ID AND CourseID=@CourseID", parms);
        }

        public int Add(Student student)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(student,true);

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; INSERT INTO [Student]([CourseID],[Staff],SLC,[CreateDate],[AvailableDateTime],[FirstName],[LastName],[DPU_ID],[Email],[PrimaryPhone],[AlternatePhone],[ReachMethod],[Gender],[PermanentAddress],[City],[State],[ZipCode],[Name_Of_Emergency_Contact],[TelephoneNumber],[School],[Major],[Expected_Graduation_Date],[ClassStanding],[CommunityServiceStudies],[I_have_taken_Service_Learning_Course],[I_would_like_to_add_my_email_to_Steans_Center_listserv],Orientation,[Type],LastUpdateTime,IsProject ) SELECT @CourseID,@Staff,@SLC,@CreateDate,@AvailableDateTime,@FirstName,@LastName,@DPU_ID,@Email,@PrimaryPhone,@AlternatePhone,@ReachMethod,@Gender,@PermanentAddress,@City,@State,@ZipCode,@Name_Of_Emergency_Contact,@TelephoneNumber,@School,@Major,@Expected_Graduation_Date,@ClassStanding,@CommunityServiceStudies,@I_have_taken_Service_Learning_Course,@I_would_like_to_add_my_email_to_Steans_Center_listserv,@Orientation,@Type,@LastUpdateTime,@IsProject; SELECT ISNULL(@@IDENTITY,0);", parms)); 
        }

        public int Update(Student student)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(student,true);

            return (int)SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; UPDATE [Student]  SET [CourseID]=@CourseID,[Staff]=@Staff,SLC=@SLC,[CreateDate]=@CreateDate,[AvailableDateTime]=@AvailableDateTime,[FirstName]=@FirstName,[LastName]=@LastName,[DPU_ID]=@DPU_ID,[Email]=@Email,[PrimaryPhone]=@PrimaryPhone,[AlternatePhone]=@AlternatePhone,[ReachMethod]=@ReachMethod,[Gender]=@Gender,[PermanentAddress]=@PermanentAddress,[City]=@City,[State]=@State,[ZipCode]=@ZipCode,[Name_Of_Emergency_Contact]=@Name_Of_Emergency_Contact,[TelephoneNumber]=@TelephoneNumber,[School]=@School,[Major]=@Major,[Expected_Graduation_Date]=@Expected_Graduation_Date,[ClassStanding]=@ClassStanding,[CommunityServiceStudies]=@CommunityServiceStudies,[I_have_taken_Service_Learning_Course]=@I_have_taken_Service_Learning_Course,[I_would_like_to_add_my_email_to_Steans_Center_listserv]=@I_would_like_to_add_my_email_to_Steans_Center_listserv,Orientation=@Orientation,[Type]=@Type,LastUpdateTime=@LastUpdateTime,IsProject=@IsProject WHERE [ID]=@ID; SELECT @ID AS i;", parms);
        }

        public int UpdateLastUpdateTime(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "UPDATE Student SET LastUpdateTime=GETDATE() WHERE ID = @ID;", parms);
       
        }

        public int UpdateServedHours(ServiceHours serviceHours)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@StudentID",SqlDbType.Int){Value=serviceHours.StudentID},
                            new SqlParameter("@CBOID",SqlDbType.Int){Value=serviceHours.CBO_ID},
                            new SqlParameter("@CourseID",SqlDbType.Int){Value=serviceHours.CourseID},
                            new SqlParameter("@Quater_Year",SqlDbType.VarChar,50){Value=serviceHours.Quater_Year}
                     };
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, @"
WITH HoursTable(StudentID,CBOID,CourseID,Quater_Year, TotalHours)
AS
(
	SELECT StudentID,CBO_ID AS CBOID,CourseID,Quater_Year, SUM(HoursServed)
	FROM ServiceHours
    WHERE StudentID=@StudentID and CBO_ID=@CBOID and CourseID=@CourseID and Quater_Year=@Quater_Year
	GROUP BY StudentID,CBO_ID,CourseID,Quater_Year
)
UPDATE Student2CBO SET ServedTotalHours=h.TotalHours
FROM Student2CBO as s2c 
inner JOIN HoursTable AS h 
ON h.StudentID=s2c.StudentID AND h.CBOID=s2c.CBOID and h.Quater_Year=s2c.Quater_Year
inner join Student as s
on s.ID=s2c.StudentID and s.CourseID=h.CourseID
WHERE s2c.StudentID=@StudentID 
AND s2c.CBOID=@CBOID
and h.CourseID=@CourseID
and h.Quater_Year=@Quater_Year

update Student2CBO set ServedTotalHours=0 

FROM Student2CBO as s2c
WHERE NOT EXISTS
(
	select null as empty from ServiceHours as sh inner join student as s on s.ID=sh.StudentID where s2c.CBOID=sh.CBO_ID and s2c.StudentID=sh.StudentID and s2c.Quater_Year=sh.Quater_Year and sh.CourseID=s.CourseID
)
and StudentID=@StudentID", parms);

        }
        

        public int Delete(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "DELETE FROM Student WHERE ID = @ID;", parms);
        }
        public int ConvertToCSSP(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "UPDATE Student SET [Type]=1 WHERE ID = @ID;", parms);
        }
        
        public bool Exists(int ID)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@ID",SqlDbType.Int)
                         };
            parms[0].Value = ID;
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM Student WITH(NOLOCK) WHERE ID = @ID;", parms)) > 0;
        }

        public bool ExistDPUID(string dpuId)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@DPU_ID",SqlDbType.VarChar,50)
                         };
            parms[0].Value = dpuId;
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM Student WITH(NOLOCK) WHERE DPU_ID = @DPU_ID;", parms)) > 0;
        }
        public bool Exist(int courseId, string dpuId)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@DPU_ID",SqlDbType.VarChar,50){Value=dpuId},
                                new SqlParameter("@CourseID",SqlDbType.Int){Value=courseId}
                         };

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM Student WITH(NOLOCK) WHERE DPU_ID = @DPU_ID and CourseID=@CourseID;", parms)) > 0;
        }
        public bool Exist(int studentId, int courseId, string dpuId)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@ID",SqlDbType.Int){Value=studentId},
                                new SqlParameter("@DPU_ID",SqlDbType.VarChar,50){Value=dpuId},
                                new SqlParameter("@CourseID",SqlDbType.Int){Value=courseId}
                         };

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM Student WITH(NOLOCK) WHERE ID=@ID AND DPU_ID = @DPU_ID and CourseID=@CourseID;", parms)) > 0;
        }
    }
    #endregion
}
