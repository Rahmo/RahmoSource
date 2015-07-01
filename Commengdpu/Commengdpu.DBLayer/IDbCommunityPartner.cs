using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.Settings;

namespace Commengdpu.DBLayer
{
    public interface IDbCommunityPartner
    {
        int Insert(CommunityPartner model);
        int Update(CommunityPartner model);
        int Delete(CommunityPartner model);
        CommunityPartner Create(int ID);
        CommunityPartner Create(string uniqueUrl);
        IEnumerable<CommunityPartnerForList> List(int top=10, CommunityPartnerCollectionSettings settings = null);
        IEnumerable<CommunityPartner> List(int pageIndex, int pageSize, CommunityPartnerCollectionSettings settings = null);
        int Count(CommunityPartnerCollectionSettings settings=null);
        bool ExistsUniqueUrl(string nameUrl);
    }
}
