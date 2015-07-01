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
using ICStars2_0.Model.Settings;

namespace ICStars2_0.Db.Steans
{
    #region = DBLayer ServiceLearnersApplication =
    internal class DB_ServiceLearnersApplication : IDB_ServiceLearnersApplication, IWeakReferenceRegister
    {
        private const string ConnectionKey = "icstars";
        public int Count(ServiceLearnersApplicationCollectionSettings settings)
        {
            StringBuilder sbSql = new StringBuilder("SELECT COUNT(*) FROM ServiceLearnersApplication WITH(NOLOCK)");
            List<SqlParameter> parms = new List<SqlParameter>();
            if (settings != null)
            {
                if (!string.IsNullOrEmpty(settings.QuarterYear))
                {
                    parms.Add(new SqlParameter("@QuarterYear", SqlDbType.VarChar) { Value = settings.QuarterYear });
                    sbSql.Append(" WHERE QuarterYear=@QuarterYear");
                }
            }
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, sbSql, parms.ToArray()));
        }


        public DataTable List(int pageIndex, int pageSize, ServiceLearnersApplicationCollectionSettings settings)
        {
            FastPaging fp = new FastPaging();
            fp.PageIndex = pageIndex;
            fp.PageSize = pageSize;
            fp.TableName = "ServiceLearnersApplication";
            fp.QueryFields = "[ID],[QuarterYear],[Region],[OrganizationName],[Address],[ServeCommunities],[ServiceAddress],[Directions_PublicTransportation],[Directions_Car],[Directions_Street_or_Lot_Parking],[Phone],[Fax],[Website],[Leadership_ExecutiveDirectorName],[Leadership_WorkPhone],[Leadership_CellPhone],[Leadership_Email],[Leadership_How_long_served],[Representative_Name],[Representative_Title],[Representative_Department_Program],[Representative_NameofDirectSupervisor],[Representative_Address],[Representative_workPhone],[Representative_CellPhone],[Representative_Email],[Representative_ContactMode],[OrganizationalMission],[PrimaryPopulationServed],[PrimaryPopulationServed_EthnicCommunitySpecific],[PrimaryPopulationServed_Other],[MajorProgramsServicesProvided],[MajorProgramsServicesProvided_Other],[ServiceInterestOpportunities_ServiceMode],[ServiceInterestOpportunities_InterestedInCommunitybasedResearchProjects],[ServiceInterestOpportunities_Task1_Description],[ServiceInterestOpportunities_Task1_NumberofStudents],[ServiceInterestOpportunities_Task1_AvailabilityNeeded],[ServiceInterestOpportunities_Task2_Description],[ServiceInterestOpportunities_Task2_NumberofStudents],[ServiceInterestOpportunities_Task2_AvailabilityNeeded],[ServiceInterestOpportunities_Task3_Description],[ServiceInterestOpportunities_Task3_NumberofStudents],[ServiceInterestOpportunities_Task3_AvailabilityNeeded],[ServiceInterestOpportunities_Task4_Description],[ServiceInterestOpportunities_Task4_NumberofStudents],[ServiceInterestOpportunities_Task4_AvailabilityNeeded],[ServiceInterestOpportunities_BackgroundChecks_RequireVolunteers],[ServiceInterestOpportunities_BackgroundChecks_BackgroundCheck],[ServiceInterestOpportunities_BackgroundChecks_BackgroundCheckApprovalTime],[ServiceInterestOpportunities_BackgroundChecks_TBTesting],[ServiceInterestOpportunities_BackgroundChecks_TBTestingApprovalTime],[ServiceInterestOpportunities_BackgroundChecks_Fingerprinting],[ServiceInterestOpportunities_BackgroundChecks_FingerprintingApprovalTime],[SiteRepresentativeCommitment_PresentationQuarter],[SiteRepresentativeCommitment_ScheduleOrientation],[SiteRepresentativeCommitment_TimeCommitment],[SiteRepresentativeCommitment_Feedback],[SiteRepresentativeCommitment_DePaulPartnersListserv],[Name],[Title],[Date],[CurrentSteansCenterContact]";
            fp.PrimaryKey = "ID";
            fp.Ascending = FastPaging.IsAscending("DESC");
            fp.WithOptions = "WITH(NOLOCK)";
            List<SqlParameter> parms = new List<SqlParameter>();
            if (settings != null)
            {
                if (!string.IsNullOrEmpty(settings.QuarterYear))
                {
                    parms.Add(new SqlParameter("@QuarterYear", SqlDbType.VarChar) { Value = settings.QuarterYear });
                    fp.Condition = "QuarterYear=@QuarterYear";
                }
            }
            return SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, fp.Build2005(), parms.ToArray());
        }
        public DataRow ServiceLearnersApplicationInfo(int ID)
        {

            SqlParameter[] parms = new[]{
                        new SqlParameter("@ID",SqlDbType.Int)
                    };

            parms[0].Value = ID;

            return SQLPlus.ExecuteDataRow(ConnectionKey, CommandType.Text, "SELECT * FROM ServiceLearnersApplication WITH(NOLOCK) WHERE ID=@ID", parms);
        }

        public int Add(ServiceLearnersApplication servicelearnersapplication)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(servicelearnersapplication);

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; INSERT INTO [ServiceLearnersApplication]([QuarterYear],[Region],[OrganizationName],[Address],[ServeCommunities],[ServiceAddress],[Directions_PublicTransportation],[Directions_Car],[Directions_Street_or_Lot_Parking],[Phone],[Fax],[Website],[Leadership_ExecutiveDirectorName],[Leadership_WorkPhone],[Leadership_CellPhone],[Leadership_Email],[Leadership_How_long_served],[Representative_Name],[Representative_Title],[Representative_Department_Program],[Representative_NameofDirectSupervisor],[Representative_Address],[Representative_workPhone],[Representative_CellPhone],[Representative_Email],[Representative_ContactMode],[OrganizationalMission],[PrimaryPopulationServed],[PrimaryPopulationServed_EthnicCommunitySpecific],[PrimaryPopulationServed_Other],[MajorProgramsServicesProvided],[MajorProgramsServicesProvided_Other],[ServiceInterestOpportunities_ServiceMode],[ServiceInterestOpportunities_InterestedInCommunitybasedResearchProjects],[ServiceInterestOpportunities_Task1],[ServiceInterestOpportunities_Task1_Description],[ServiceInterestOpportunities_Task1_NumberofStudents],[ServiceInterestOpportunities_Task1_AvailabilityNeeded],[ServiceInterestOpportunities_Task2],[ServiceInterestOpportunities_Task2_Description],[ServiceInterestOpportunities_Task2_NumberofStudents],[ServiceInterestOpportunities_Task2_AvailabilityNeeded],[ServiceInterestOpportunities_Task3],[ServiceInterestOpportunities_Task3_Description],[ServiceInterestOpportunities_Task3_NumberofStudents],[ServiceInterestOpportunities_Task3_AvailabilityNeeded],[ServiceInterestOpportunities_Task4],[ServiceInterestOpportunities_Task4_Description],[ServiceInterestOpportunities_Task4_NumberofStudents],[ServiceInterestOpportunities_Task4_AvailabilityNeeded],[ServiceInterestOpportunities_BackgroundChecks_RequireVolunteers],[ServiceInterestOpportunities_BackgroundChecks_BackgroundCheck],[ServiceInterestOpportunities_BackgroundChecks_BackgroundCheckApprovalTime],[ServiceInterestOpportunities_BackgroundChecks_TBTesting],[ServiceInterestOpportunities_BackgroundChecks_TBTestingApprovalTime],[ServiceInterestOpportunities_BackgroundChecks_Fingerprinting],[ServiceInterestOpportunities_BackgroundChecks_FingerprintingApprovalTime],[SiteRepresentativeCommitment_PresentationQuarter],[SiteRepresentativeCommitment_ScheduleOrientation],[SiteRepresentativeCommitment_TimeCommitment],[SiteRepresentativeCommitment_Feedback],[SiteRepresentativeCommitment_DePaulPartnersListserv],[Name],[Title],[Date],[CurrentSteansCenterContact] ) SELECT @QuarterYear,@Region,@OrganizationName,@Address,@ServeCommunities,@ServiceAddress,@Directions_PublicTransportation,@Directions_Car,@Directions_Street_or_Lot_Parking,@Phone,@Fax,@Website,@Leadership_ExecutiveDirectorName,@Leadership_WorkPhone,@Leadership_CellPhone,@Leadership_Email,@Leadership_How_long_served,@Representative_Name,@Representative_Title,@Representative_Department_Program,@Representative_NameofDirectSupervisor,@Representative_Address,@Representative_workPhone,@Representative_CellPhone,@Representative_Email,@Representative_ContactMode,@OrganizationalMission,@PrimaryPopulationServed,@PrimaryPopulationServed_EthnicCommunitySpecific,@PrimaryPopulationServed_Other,@MajorProgramsServicesProvided,@MajorProgramsServicesProvided_Other,@ServiceInterestOpportunities_ServiceMode,@ServiceInterestOpportunities_InterestedInCommunitybasedResearchProjects,@ServiceInterestOpportunities_Task1,@ServiceInterestOpportunities_Task1_Description,@ServiceInterestOpportunities_Task1_NumberofStudents,@ServiceInterestOpportunities_Task1_AvailabilityNeeded,@ServiceInterestOpportunities_Task2,@ServiceInterestOpportunities_Task2_Description,@ServiceInterestOpportunities_Task2_NumberofStudents,@ServiceInterestOpportunities_Task2_AvailabilityNeeded,@ServiceInterestOpportunities_Task3,@ServiceInterestOpportunities_Task3_Description,@ServiceInterestOpportunities_Task3_NumberofStudents,@ServiceInterestOpportunities_Task3_AvailabilityNeeded,@ServiceInterestOpportunities_Task4,@ServiceInterestOpportunities_Task4_Description,@ServiceInterestOpportunities_Task4_NumberofStudents,@ServiceInterestOpportunities_Task4_AvailabilityNeeded,@ServiceInterestOpportunities_BackgroundChecks_RequireVolunteers,@ServiceInterestOpportunities_BackgroundChecks_BackgroundCheck,@ServiceInterestOpportunities_BackgroundChecks_BackgroundCheckApprovalTime,@ServiceInterestOpportunities_BackgroundChecks_TBTesting,@ServiceInterestOpportunities_BackgroundChecks_TBTestingApprovalTime,@ServiceInterestOpportunities_BackgroundChecks_Fingerprinting,@ServiceInterestOpportunities_BackgroundChecks_FingerprintingApprovalTime,@SiteRepresentativeCommitment_PresentationQuarter,@SiteRepresentativeCommitment_ScheduleOrientation,@SiteRepresentativeCommitment_TimeCommitment,@SiteRepresentativeCommitment_Feedback,@SiteRepresentativeCommitment_DePaulPartnersListserv,@Name,@Title,@Date,@CurrentSteansCenterContact; SELECT ISNULL(@@IDENTITY,0);", parms));

        }

        public int Update(ServiceLearnersApplication servicelearnersapplication)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(servicelearnersapplication);

            return (int)SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; UPDATE [ServiceLearnersApplication]  SET [QuarterYear]=@QuarterYear,[Region]=@Region,[OrganizationName]=@OrganizationName,[Address]=@Address,[ServeCommunities]=@ServeCommunities,[ServiceAddress]=@ServiceAddress,[Directions_PublicTransportation]=@Directions_PublicTransportation,[Directions_Car]=@Directions_Car,[Directions_Street_or_Lot_Parking]=@Directions_Street_or_Lot_Parking,[Phone]=@Phone,[Fax]=@Fax,[Website]=@Website,[Leadership_ExecutiveDirectorName]=@Leadership_ExecutiveDirectorName,[Leadership_WorkPhone]=@Leadership_WorkPhone,[Leadership_CellPhone]=@Leadership_CellPhone,[Leadership_Email]=@Leadership_Email,[Leadership_How_long_served]=@Leadership_How_long_served,[Representative_Name]=@Representative_Name,[Representative_Title]=@Representative_Title,[Representative_Department_Program]=@Representative_Department_Program,[Representative_NameofDirectSupervisor]=@Representative_NameofDirectSupervisor,[Representative_Address]=@Representative_Address,[Representative_workPhone]=@Representative_workPhone,[Representative_CellPhone]=@Representative_CellPhone,[Representative_Email]=@Representative_Email,[Representative_ContactMode]=@Representative_ContactMode,[OrganizationalMission]=@OrganizationalMission,[PrimaryPopulationServed]=@PrimaryPopulationServed,[PrimaryPopulationServed_EthnicCommunitySpecific]=@PrimaryPopulationServed_EthnicCommunitySpecific,[PrimaryPopulationServed_Other]=@PrimaryPopulationServed_Other,[MajorProgramsServicesProvided]=@MajorProgramsServicesProvided,[MajorProgramsServicesProvided_Other]=@MajorProgramsServicesProvided_Other,[ServiceInterestOpportunities_ServiceMode]=@ServiceInterestOpportunities_ServiceMode,[ServiceInterestOpportunities_InterestedInCommunitybasedResearchProjects]=@ServiceInterestOpportunities_InterestedInCommunitybasedResearchProjects,[ServiceInterestOpportunities_Task1]=@ServiceInterestOpportunities_Task1,[ServiceInterestOpportunities_Task1_Description]=@ServiceInterestOpportunities_Task1_Description,[ServiceInterestOpportunities_Task1_NumberofStudents]=@ServiceInterestOpportunities_Task1_NumberofStudents,[ServiceInterestOpportunities_Task1_AvailabilityNeeded]=@ServiceInterestOpportunities_Task1_AvailabilityNeeded,[ServiceInterestOpportunities_Task2]=@ServiceInterestOpportunities_Task2,[ServiceInterestOpportunities_Task2_Description]=@ServiceInterestOpportunities_Task2_Description,[ServiceInterestOpportunities_Task2_NumberofStudents]=@ServiceInterestOpportunities_Task2_NumberofStudents,[ServiceInterestOpportunities_Task2_AvailabilityNeeded]=@ServiceInterestOpportunities_Task2_AvailabilityNeeded,[ServiceInterestOpportunities_Task3]=@ServiceInterestOpportunities_Task3,[ServiceInterestOpportunities_Task3_Description]=@ServiceInterestOpportunities_Task3_Description,[ServiceInterestOpportunities_Task3_NumberofStudents]=@ServiceInterestOpportunities_Task3_NumberofStudents,[ServiceInterestOpportunities_Task3_AvailabilityNeeded]=@ServiceInterestOpportunities_Task3_AvailabilityNeeded,[ServiceInterestOpportunities_Task4]=@ServiceInterestOpportunities_Task4,[ServiceInterestOpportunities_Task4_Description]=@ServiceInterestOpportunities_Task4_Description,[ServiceInterestOpportunities_Task4_NumberofStudents]=@ServiceInterestOpportunities_Task4_NumberofStudents,[ServiceInterestOpportunities_Task4_AvailabilityNeeded]=@ServiceInterestOpportunities_Task4_AvailabilityNeeded,[ServiceInterestOpportunities_BackgroundChecks_RequireVolunteers]=@ServiceInterestOpportunities_BackgroundChecks_RequireVolunteers,[ServiceInterestOpportunities_BackgroundChecks_BackgroundCheck]=@ServiceInterestOpportunities_BackgroundChecks_BackgroundCheck,[ServiceInterestOpportunities_BackgroundChecks_BackgroundCheckApprovalTime]=@ServiceInterestOpportunities_BackgroundChecks_BackgroundCheckApprovalTime,[ServiceInterestOpportunities_BackgroundChecks_TBTesting]=@ServiceInterestOpportunities_BackgroundChecks_TBTesting,[ServiceInterestOpportunities_BackgroundChecks_TBTestingApprovalTime]=@ServiceInterestOpportunities_BackgroundChecks_TBTestingApprovalTime,[ServiceInterestOpportunities_BackgroundChecks_Fingerprinting]=@ServiceInterestOpportunities_BackgroundChecks_Fingerprinting,[ServiceInterestOpportunities_BackgroundChecks_FingerprintingApprovalTime]=@ServiceInterestOpportunities_BackgroundChecks_FingerprintingApprovalTime,[SiteRepresentativeCommitment_PresentationQuarter]=@SiteRepresentativeCommitment_PresentationQuarter,[SiteRepresentativeCommitment_ScheduleOrientation]=@SiteRepresentativeCommitment_ScheduleOrientation,[SiteRepresentativeCommitment_TimeCommitment]=@SiteRepresentativeCommitment_TimeCommitment,[SiteRepresentativeCommitment_Feedback]=@SiteRepresentativeCommitment_Feedback,[SiteRepresentativeCommitment_DePaulPartnersListserv]=@SiteRepresentativeCommitment_DePaulPartnersListserv,[Name]=@Name,[Title]=@Title,[Date]=@Date,[CurrentSteansCenterContact]=@CurrentSteansCenterContact WHERE [ID]=@ID; SELECT @ID AS i;", parms);
        }

        public int Delete(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "DELETE FROM ServiceLearnersApplication WHERE ID = @ID;", parms);
        }
        public bool Exists(int ID)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@ID",SqlDbType.Int)
                         };
            parms[0].Value = ID;
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM ServiceLearnersApplication WITH(NOLOCK) WHERE ID = @ID;", parms)) > 0;
        }

    }
    #endregion
}
