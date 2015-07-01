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
using ICStars2_0.Model.Enum;

namespace ICStars2_0.Db
{
    #region = DBLayer EventRequestForm =
    internal class DB_EventRequestForm : IDB_EventRequestForm, IWeakReferenceRegister
    {
        private const string ConnectionKey = "icstars";
        public int Count()
        {
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM EventRequestForm WITH(NOLOCK)"));
        }
        public DataTable List(int pageIndex, int pageSize)
        {
            FastPaging fp = new FastPaging();
            fp.PageIndex = pageIndex;
            fp.PageSize = pageSize;
            fp.TableName = "EventRequestForm";
            fp.QueryFields = "[ID],[ContactName],[SupervisorEmail],[Program],[EventDate],[EventTime],[EventTitle],[EventLocation],[NumberOfAttendees],[ChartwellsItems],[ChartwellsNotes],[StaplesItems],[StaplesNotes],[PhotographerRequired],[PhotographerRequiredDate],[PhotographerRequiredTime],[PhotographerRequiredLocation],[DistributionServicesCopiesNeededBy],[DistributionServicesColorCopies],[DistributionServicesBWCopies],[DistributionServicesPaperSidedType],[DistributionServicesPaperQuality],[RequestDate],[Status]";
            fp.PrimaryKey = "ID";
            fp.Ascending = FastPaging.IsAscending("DESC");
            fp.WithOptions = "WITH(NOLOCK)";
            return SQLPlus.ExecuteDataTable(ConnectionKey, CommandType.Text, fp.Build2005());
        }
        public DataRow EventRequestFormInfo(int ID)
        {

            SqlParameter[] parms = new[]{
                        new SqlParameter("@ID",SqlDbType.Int)
                    };

            parms[0].Value = ID;

            return SQLPlus.ExecuteDataRow(ConnectionKey, CommandType.Text, "SELECT * FROM EventRequestForm WITH(NOLOCK) WHERE ID=@ID", parms);
        }

        public int Add(EventRequestForm eventrequestform)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(eventrequestform);

            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; INSERT INTO [EventRequestForm]([ContactName],[SupervisorEmail],[Program],[EventDate],[EventTime],[EventTitle],[EventLocation],[NumberOfAttendees],[ChartwellsItems],[ChartwellsNotes],[StaplesItems],[StaplesNotes],[PhotographerRequired],[PhotographerRequiredDate],[PhotographerRequiredTime],[PhotographerRequiredLocation],[DistributionServicesCopiesNeededBy],[DistributionServicesColorCopies],[DistributionServicesBWCopies],[DistributionServicesPaperSidedType],[DistributionServicesPaperQuality],[RequestDate],[Status] ) SELECT @ContactName,@SupervisorEmail,@Program,@EventDate,@EventTime,@EventTitle,@EventLocation,@NumberOfAttendees,@ChartwellsItems,@ChartwellsNotes,@StaplesItems,@StaplesNotes,@PhotographerRequired,@PhotographerRequiredDate,@PhotographerRequiredTime,@PhotographerRequiredLocation,@DistributionServicesCopiesNeededBy,@DistributionServicesColorCopies,@DistributionServicesBWCopies,@DistributionServicesPaperSidedType,@DistributionServicesPaperQuality,@RequestDate,@Status; SELECT ISNULL(@@IDENTITY,0);", parms));

        }

        public int Update(EventRequestForm eventrequestform)
        {
            SqlParameter[] parms = ParameterHelper.GetClassSqlParameters(eventrequestform);

            return (int)SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, " SET NOCOUNT ON; UPDATE [EventRequestForm]  SET [ContactName]=@ContactName,[SupervisorEmail]=@SupervisorEmail,[Program]=@Program,[EventDate]=@EventDate,[EventTime]=@EventTime,[EventTitle]=@EventTitle,[EventLocation]=@EventLocation,[NumberOfAttendees]=@NumberOfAttendees,[ChartwellsItems]=@ChartwellsItems,[ChartwellsNotes]=@ChartwellsNotes,[StaplesItems]=@StaplesItems,[StaplesNotes]=@StaplesNotes,[PhotographerRequired]=@PhotographerRequired,[PhotographerRequiredDate]=@PhotographerRequiredDate,[PhotographerRequiredTime]=@PhotographerRequiredTime,[PhotographerRequiredLocation]=@PhotographerRequiredLocation,[DistributionServicesCopiesNeededBy]=@DistributionServicesCopiesNeededBy,[DistributionServicesColorCopies]=@DistributionServicesColorCopies,[DistributionServicesBWCopies]=@DistributionServicesBWCopies,[DistributionServicesPaperSidedType]=@DistributionServicesPaperSidedType,[DistributionServicesPaperQuality]=@DistributionServicesPaperQuality,[RequestDate]=@RequestDate,[Status]=@Status WHERE [ID]=@ID; SELECT @ID AS i;", parms);
        }

        public int Delete(int ID)
        {
            SqlParameter[] parms = new[] {
                            new SqlParameter("@ID",SqlDbType.Int)
                     };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "DELETE FROM EventRequestForm WHERE ID = @ID;", parms);
        }
        public bool Exists(int ID)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@ID",SqlDbType.Int)
                         };
            parms[0].Value = ID;
            return Convert.ToInt32(SQLPlus.ExecuteScalar(ConnectionKey, CommandType.Text, "SELECT COUNT(*) FROM EventRequestForm WITH(NOLOCK) WHERE ID = @ID;", parms)) > 0;
        }

        public bool UpdateStatus(int ID,EventRequestFormStatus status)
        {
            SqlParameter[] parms = new[] {
                                new SqlParameter("@ID",SqlDbType.Int),
                                new SqlParameter("@Status",SqlDbType.Int){Value=status}
                         };
            parms[0].Value = ID;
            return SQLPlus.ExecuteNonQuery(ConnectionKey, CommandType.Text, "Update EventRequestForm SET [Status]=@Status WHERE ID = @ID;", parms) > 0;
        }
    }
    #endregion
}
