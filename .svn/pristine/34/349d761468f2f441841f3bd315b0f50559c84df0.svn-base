using ICStars2_0.Model;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.BusinessLayer.MemberServices
{
    public interface IMemberFactory
    {
        IMemberCollection CreateMemberCollection(int pageIndex, int pageSize,MemberCollectionSettings settings);
        IMemberCollection CreateMemberCollection(int pageIndex, int pageSize);
        IMemberCollection CreateSLCCollection(int pageIndex, int pageSize);
        IMemberCollection CreateFacultyCollection(int pageIndex, int pageSize);
        void CreateSuperAdminUser();
        Member Create(string campusConnectId);
        MemberForEdit CreateMemberForEdit(int id);
        Member Create(int id);
        BaseMember Update(BaseMember m);
        bool IsLocked(string campusConnectId);
        int Delete(int ID);
        int Active(int ID);
        int Lock(int ID);
        bool Exists(int ID);
        bool Exists(string campusConnectId);
    }
}