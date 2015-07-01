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

namespace ICStars2_0.Db
{
    #region = DBLayer Student2CBO =
    internal class DB_Student2CBO : IDB_Student2CBO, IWeakReferenceRegister
    {
        private const string ConnectionKey = "icstars";
        public int Count()
        {
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM Student2CBO WITH(NOLOCK)"));
        }
        public DataTable List(int studentId)
        {
            SqlParameter[] parms = new[]{
                        new SqlParameter("@StudentID",SqlDbType.Int){Value=studentId}
                    };
            return SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, "SELECT s2c.*,c.Name AS CBOName FROM Student2CBO as s2c inner join cbo as c on c.ID=s2c.CBOID WHERE StudentID=@StudentID",parms);
        }

        public int Add(Student2CBO student2cbo)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(student2cbo);

            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "INSERT INTO [Student2CBO]([StudentID],[CBOID],[RequiredHours],[Quater_Year],ServedTotalHours ) SELECT @StudentID,@CBOID,@RequiredHours,@Quater_Year,@ServedTotalHours WHERE NOT EXISTS(SELECT NULL AS EMPTY FROM Student2CBO WHERE StudentID = @StudentID AND CBOID=@CBOID and Quater_Year=@Quater_Year)", parms);

        }
        public int Update(Student2CBO student2cbo)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(student2cbo);

            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "UPDATE [Student2CBO] SET [RequiredHours]=@RequiredHours,[Quater_Year]=@Quater_Year,ServedTotalHours=@ServedTotalHours WHERE StudentID = @StudentID AND CBOID=@CBOID AND Quater_Year=@Quater_Year;", parms);

        }


        public int Delete(int studentId, int cboId, string quarterYear)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@StudentID",SqlDbType.Int){Value=studentId},
                            new SqlParameter("@CBOID",SqlDbType.Int){Value=cboId},
                            new SqlParameter("@Quater_Year",SqlDbType.VarChar,50){Value=quarterYear}
                     };
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "DELETE FROM Student2CBO WHERE StudentID = @StudentID AND CBOID=@CBOID AND Quater_Year=@Quater_Year;", parms);
        }
        public int DeleteByStudentId(int studentId)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@StudentID",SqlDbType.Int)
                     };
            parms[0].Value = studentId;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "DELETE FROM Student2CBO WHERE StudentID = @StudentID;", parms);
        }

        public DataRow Info(int studentId, int cboId, string quarterYear)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@StudentID",SqlDbType.Int){Value=studentId},
                                new SqlParameter("@CBOID",SqlDbType.Int){Value=cboId},
                            new SqlParameter("@Quater_Year",SqlDbType.VarChar,50){Value=quarterYear}
                         };

            return SQLPlus.ExecuteDataRow(ConnectionKey, CommandType.Text, "SELECT * FROM Student2CBO WITH(NOLOCK) WHERE StudentID = @StudentID and CBOID=@CBOID and Quater_Year=@Quater_Year;", parms);
        }

    }
    #endregion
            
}
