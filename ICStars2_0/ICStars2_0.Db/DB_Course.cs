using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;
using System.Linq;
using ICStars.Data;
using ICStars2_0.Common;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.Db
{
    #region = DBLayer Course =
    internal class DB_Course : IDB_Course, IWeakReferenceRegister
    {
        private const string ConnectionKey = "icstars";
        public int Count(CourseCollectionSettings settings)
        {
            StringBuilder strSql = new StringBuilder("SELECT COUNT(*) FROM Course as c WITH(NOLOCK) WHERE 1=1");
            List<SqlParameter> parms = new List<SqlParameter>();
            if(settings!=null)
            {
                StringBuilder sbCondition = new StringBuilder();
                if (!string.IsNullOrEmpty(settings.Quater_Year)
                    || settings.QuaterYearArray!=null
                    || !string.IsNullOrEmpty(settings.DPU_ID)
                    //|| settings.StudentType!=StudentType.All
                    )
                {
                    sbCondition.Append(@" AND EXISTS(SELECT NULL AS EMPTY FROM Student AS s WHERE s.CourseID=c.ID");
                }
                //if (settings.StudentType != StudentType.All)
                //{
                //    sbCondition.Append(" AND s.[Type]=@Type");
                //    parms.Add(new SqlParameter("@Type", SqlDbType.Int) { Value = (int)settings.StudentType });
                //}
                if (!string.IsNullOrEmpty(settings.Quater_Year))
                {
                    parms.Add(new SqlParameter("@Quater_Year", SqlDbType.VarChar, 50) { Value = settings.Quater_Year });
                    sbCondition.Append(" AND EXISTS(SELECT NULL AS EMPTY FROM Student2CBO AS s2c WHERE s2c.StudentID=s.ID and s2c.Quater_Year=@Quater_Year)");
                }
                if (settings.QuaterYearArray != null)
                {
                    sbCondition.AppendFormat(" AND EXISTS(SELECT NULL AS EMPTY FROM Student2CBO AS s2c WHERE s2c.StudentID=s.ID and s2c.Quater_Year in ({0}))", settings.QuaterYearArray.Select(s => string.Format("'{0}'", s.Replace("'", "''"))).ToString(","));
                }
                if (!string.IsNullOrEmpty(settings.DPU_ID))
                {

                    parms.Add(new SqlParameter("@DPU_ID", SqlDbType.VarChar, 50) { Value = settings.DPU_ID });
                    sbCondition.Append(" AND DPU_ID=@DPU_ID");
                }
                if (sbCondition.Length > 0)
                {
                    sbCondition.Append(")");
                }

                if (settings.IsCheckInstructorName)
                {
                    parms.Add(
                                       new SqlParameter("@InstructorName", SqlDbType.VarChar, 100) { Value = settings.InstructorName });
                    sbCondition.Append(" AND InstructorName=@InstructorName");
                }
                if (!string.IsNullOrEmpty(settings.Term))
                {
                    parms.Add(new SqlParameter("@TermDescription", SqlDbType.VarChar, 100) { Value = settings.Term });
                    sbCondition.Append(" AND TermDescription=@TermDescription");
                }
                if (settings.TermArray != null)
                {
                    sbCondition.AppendFormat(" AND TermDescription in ({0})", settings.TermArray.Select(s => string.Format("'{0}'", s.Replace("'", "''"))).ToString(","));
                }
                if (settings.CourseType != CourseType.All)
                {
                    parms.Add(new SqlParameter("@CourseType", SqlDbType.Int) { Value = (int)settings.CourseType });
                    sbCondition.Append(" AND c.[Type]=@CourseType");
                }
                strSql.Append(sbCondition);
            }
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, strSql,parms.ToArray()));
        }
        public DataTable List(int pageIndex, int pageSize,CourseCollectionSettings settings)
        {
            List<SqlParameter> parms = new List<SqlParameter>();
            FastPaging fp = new FastPaging();
            fp.PageIndex = pageIndex;
            fp.PageSize = pageSize;
            fp.TableName = "Course";
            fp.TableReName = "c";
            fp.QueryFields = "[ID],[TermDescription],[Subject],[CatalogNumber],[ClassSection],[Title],[InstructorName],[BestEmail],[Staff],[Type]";
            fp.PrimaryKey = "Subject";
            fp.Ascending = FastPaging.IsAscending("ASC");
            fp.WithOptions = "WITH(NOLOCK)";
            if(settings!=null)
            {
                fp.Condition = "1=1";
                StringBuilder sbCondition = new StringBuilder();
                if (!string.IsNullOrEmpty(settings.Quater_Year)
                    || settings.QuaterYearArray!=null
                    || !string.IsNullOrEmpty(settings.DPU_ID)
                    //|| settings.StudentType!=StudentType.All
                    )
                {
                    sbCondition.Append(" AND EXISTS(SELECT NULL AS EMPTY FROM Student AS s WHERE s.CourseID=c.ID");
                }
                //if (settings.StudentType != StudentType.All)
                //{
                //    sbCondition.Append(" AND s.[Type]=@Type");
                //    parms.Add(new SqlParameter("@Type", SqlDbType.Int) { Value = (int)settings.StudentType });
                //}
                if(!string.IsNullOrEmpty(settings.Quater_Year))
                {
                    parms.Add(new SqlParameter("@Quater_Year", SqlDbType.VarChar, 50) { Value = settings.Quater_Year });
                    sbCondition.Append(" AND EXISTS(SELECT NULL AS EMPTY FROM Student2CBO AS s2c WHERE s2c.StudentID=s.ID and s2c.Quater_Year=@Quater_Year)");
                }
                if (settings.QuaterYearArray != null)
                {
                    sbCondition.AppendFormat(" AND EXISTS(SELECT NULL AS EMPTY FROM Student2CBO AS s2c WHERE s2c.StudentID=s.ID and s2c.Quater_Year in ({0}))", settings.QuaterYearArray.Select(s => string.Format("'{0}'", s.Replace("'", "''"))).ToString(","));
                }
                if(!string.IsNullOrEmpty(settings.DPU_ID))
                {

                    parms.Add(new SqlParameter("@DPU_ID", SqlDbType.VarChar, 50) { Value = settings.DPU_ID });
                    sbCondition.Append(" AND DPU_ID=@DPU_ID");
                }
                if(sbCondition.Length>0)
                {
                    sbCondition.Append(")");
                }
                if (settings.IsCheckInstructorName)
                {

                    parms.Add(
                                       new SqlParameter("@InstructorName", SqlDbType.VarChar, 100) { Value = settings.InstructorName });
                    sbCondition.Append(" AND InstructorName=@InstructorName");
                }
                if (!string.IsNullOrEmpty(settings.Term))
                {
                    parms.Add(new SqlParameter("@TermDescription", SqlDbType.VarChar, 100) { Value = settings.Term });
                    sbCondition.Append(" AND TermDescription=@TermDescription");
                }
                if (settings.TermArray!=null)
                {
                    sbCondition.AppendFormat(" AND TermDescription in ({0})", settings.TermArray.Select(s => string.Format("'{0}'", s.Replace("'", "''"))).ToString(","));
                }
                if (settings.CourseType != CourseType.All)
                {
                    parms.Add(new SqlParameter("@CourseType", SqlDbType.Int) { Value = (int)settings.CourseType });
                    sbCondition.Append(" AND c.[Type]=@CourseType");
                }
                fp.Condition += sbCondition.ToString();
            }
            return SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, fp.Build2005(),parms.ToArray());
        }
        public DataRow CourseInfo(int ID)
        {

            SqlParameter[] parms = new[]{
                        new SqlParameter("@ID",SqlDbType.Int)
                    };

            parms[0].Value = ID;

            return SQLPlus.ExecuteDataRow(ConnectionKey, CommandType.Text, "SELECT * FROM Course WITH(NOLOCK) WHERE ID=@ID", parms);
        }

        public int Add(Course course)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(course);

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; INSERT INTO [Course]([TermDescription],[Subject],[CatalogNumber],[ClassSection],[Title],[InstructorName],[BestEmail],[Staff],[Type] ) SELECT @TermDescription,@Subject,@CatalogNumber,@ClassSection,@Title,@InstructorName,@BestEmail,@Staff,@Type; SELECT ISNULL(@@IDENTITY,0);", parms));

        }

        public int Update(Course course)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(course);

            return (int)SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; UPDATE [Course]  SET [TermDescription]=@TermDescription,[Subject]=@Subject,[CatalogNumber]=@CatalogNumber,[ClassSection]=@ClassSection,[Title]=@Title,[InstructorName]=@InstructorName,[BestEmail]=@BestEmail,[Staff]=@Staff,[Type]=@Type WHERE [ID]=@ID; SELECT @ID AS i;", parms);
        }

        public int UpdateInstructorName(int id, string instructorName)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@InstructorName",SqlDbType.VarChar,100){Value=instructorName},
                                new SqlParameter("@ID",SqlDbType.Int){Value=id}
                         };
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "UPDATE Course SET InstructorName=@InstructorName WHERE ID=@ID;", parms);
        }

        public int Delete(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "DELETE FROM Course WHERE ID = @ID;", parms);
        }
        public bool Exists(int ID)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@ID",SqlDbType.Int)
                         };
            parms[0].Value = ID;
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM Course WITH(NOLOCK) WHERE ID = @ID;", parms)) > 0;
        }

    }
    #endregion
}
