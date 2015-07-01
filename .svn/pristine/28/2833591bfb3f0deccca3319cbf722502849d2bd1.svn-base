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
    #region = DBLayer CommunityInternship =
    internal class DB_CommunityInternship : IDB_CommunityInternship, IWeakReferenceRegister
    {
        private const string ConnectionKey = "icstars";
        public int Count()
        {
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM CommunityInternship WITH(NOLOCK)"));
        }
        public DataTable List(int pageIndex, int pageSize)
        {
            FastPaging fp = new FastPaging();
            fp.PageIndex = pageIndex;
            fp.PageSize = pageSize;
            fp.TableName = "CommunityInternship";
            fp.QueryFields = "[ID],[Name],[Address],[Depaul_ID_Number],[Birth_Date],[Gender],[Home_Phone_Number],[Cell_Phone_Number],[Email],[Racial_Background],[DePaul_Expected_Graduation_Date],[College],[Major_Area_Of_Academic_Focus],[Minor_Area_Of_Academic_Focus],[Community_Based_Service_Learning_Courses_Previously_Taken_At_DePaul],[Service_Community_Work_Involved_Since_Enrollment_At_DePaul],[How_Internship_Relates_To_A_Course_Research_Project_Academic_Pursuit],[How_will_this_experience_relate_to_your_personal_academic_career_goals],[Specific_learning_goals1],[Specific_learning_goals2],[Specific_learning_goals3],[References_Academic],[References_Other],[Preferred_Site1],[Preferred_Site2],[Intern_Sign],[Intern_Sign_Date],[Site_Supervisor],[Site_Supervisor_Date],[Instructor],[Instructor_Date],[QuarterYear],[QuarterYearOrder]";
            fp.PrimaryKey = "ID";
            fp.Ascending = FastPaging.IsAscending("DESC");
            fp.WithOptions = "WITH(NOLOCK)";
            return SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, fp.Build2005());
        }
        public DataRow CommunityInternshipInfo(int ID)
        {

            SqlParameter[] parms = new[]{
                        new SqlParameter("@ID",SqlDbType.Int)
                    };

            parms[0].Value = ID;

            return SQLPlus.ExecuteDataRow(ConnectionKey, CommandType.Text, "SELECT * FROM CommunityInternship WITH(NOLOCK) WHERE ID=@ID", parms);
        }

        public int Add(CommunityInternship communityinternship)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(communityinternship);

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; INSERT INTO [CommunityInternship]([Name],[Address],[Depaul_ID_Number],[Birth_Date],[Gender],[Home_Phone_Number],[Cell_Phone_Number],[Email],[Racial_Background],[DePaul_Expected_Graduation_Date],[College],[Major_Area_Of_Academic_Focus],[Minor_Area_Of_Academic_Focus],[Community_Based_Service_Learning_Courses_Previously_Taken_At_DePaul],[Service_Community_Work_Involved_Since_Enrollment_At_DePaul],[How_Internship_Relates_To_A_Course_Research_Project_Academic_Pursuit],[How_will_this_experience_relate_to_your_personal_academic_career_goals],[Specific_learning_goals1],[Specific_learning_goals2],[Specific_learning_goals3],[References_Academic],[References_Other],[Preferred_Site1],[Preferred_Site2],[Intern_Sign],[Intern_Sign_Date],[Site_Supervisor],[Site_Supervisor_Date],[Instructor],[Instructor_Date],[QuarterYear],[QuarterYearOrder] ) SELECT @Name,@Address,@Depaul_ID_Number,@Birth_Date,@Gender,@Home_Phone_Number,@Cell_Phone_Number,@Email,@Racial_Background,@DePaul_Expected_Graduation_Date,@College,@Major_Area_Of_Academic_Focus,@Minor_Area_Of_Academic_Focus,@Community_Based_Service_Learning_Courses_Previously_Taken_At_DePaul,@Service_Community_Work_Involved_Since_Enrollment_At_DePaul,@How_Internship_Relates_To_A_Course_Research_Project_Academic_Pursuit,@How_will_this_experience_relate_to_your_personal_academic_career_goals,@Specific_learning_goals1,@Specific_learning_goals2,@Specific_learning_goals3,@References_Academic,@References_Other,@Preferred_Site1,@Preferred_Site2,@Intern_Sign,@Intern_Sign_Date,@Site_Supervisor,@Site_Supervisor_Date,@Instructor,@Instructor_Date,@QuarterYear,@QuarterYearOrder; SELECT ISNULL(@@IDENTITY,0);", parms));

        }

        public int Update(CommunityInternship communityinternship)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(communityinternship);

            return (int)SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; UPDATE [CommunityInternship]  SET [Name]=@Name,[Address]=@Address,[Depaul_ID_Number]=@Depaul_ID_Number,[Birth_Date]=@Birth_Date,[Gender]=@Gender,[Home_Phone_Number]=@Home_Phone_Number,[Cell_Phone_Number]=@Cell_Phone_Number,[Email]=@Email,[Racial_Background]=@Racial_Background,[DePaul_Expected_Graduation_Date]=@DePaul_Expected_Graduation_Date,[College]=@College,[Major_Area_Of_Academic_Focus]=@Major_Area_Of_Academic_Focus,[Minor_Area_Of_Academic_Focus]=@Minor_Area_Of_Academic_Focus,[Community_Based_Service_Learning_Courses_Previously_Taken_At_DePaul]=@Community_Based_Service_Learning_Courses_Previously_Taken_At_DePaul,[Service_Community_Work_Involved_Since_Enrollment_At_DePaul]=@Service_Community_Work_Involved_Since_Enrollment_At_DePaul,[How_Internship_Relates_To_A_Course_Research_Project_Academic_Pursuit]=@How_Internship_Relates_To_A_Course_Research_Project_Academic_Pursuit,[How_will_this_experience_relate_to_your_personal_academic_career_goals]=@How_will_this_experience_relate_to_your_personal_academic_career_goals,[Specific_learning_goals1]=@Specific_learning_goals1,[Specific_learning_goals2]=@Specific_learning_goals2,[Specific_learning_goals3]=@Specific_learning_goals3,[References_Academic]=@References_Academic,[References_Other]=@References_Other,[Preferred_Site1]=@Preferred_Site1,[Preferred_Site2]=@Preferred_Site2,[Intern_Sign]=@Intern_Sign,[Intern_Sign_Date]=@Intern_Sign_Date,[Site_Supervisor]=@Site_Supervisor,[Site_Supervisor_Date]=@Site_Supervisor_Date,[Instructor]=@Instructor,[Instructor_Date]=@Instructor_Date,[QuarterYear]=@QuarterYear,[QuarterYearOrder]=@QuarterYearOrder WHERE [ID]=@ID; SELECT @ID AS i;", parms);
        }

        public int Delete(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "DELETE FROM CommunityInternship WHERE ID = @ID;", parms);
        }
        public bool Exists(int ID)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@ID",SqlDbType.Int)
                         };
            parms[0].Value = ID;
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM CommunityInternship WITH(NOLOCK) WHERE ID = @ID;", parms)) > 0;
        }

    }
    #endregion
}
