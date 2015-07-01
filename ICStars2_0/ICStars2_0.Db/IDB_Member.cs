using System.Data;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.Db
{
    public interface IDB_Member
    {
        //bool ValidateUser(string userName, string password);
        bool IsLocked(string campusConnectId);
        int Count(MemberCollectionSettings settings);
        DataTable List(int pageIndex, int pageSize, MemberCollectionSettings settings);
        DataRow MemberInfo(int ID);
        DataRow MemberInfo(string campusConnectId);
        int Add(BaseMember member);
        int Update(BaseMember member);
        int Delete(int ID);
        int Active(int ID);
        int Lock(int ID);
        bool Exists(int ID);
        bool Exists(string campusConnectId);
    }
}