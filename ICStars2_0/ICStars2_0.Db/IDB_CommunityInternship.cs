using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Model;

namespace ICStars2_0.Db
{
    public interface IDB_CommunityInternship
    {
        int Count();
        DataTable List(int pageIndex, int pageSize);
        DataRow CommunityInternshipInfo(int ID);
        int Add(CommunityInternship communityinternship);
        int Update(CommunityInternship communityinternship);
        int Delete(int ID);
        bool Exists(int ID);
    }
}
