using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.Settings;

namespace Commengdpu.BusinessLayer.CommunityPartnerServices
{
    public interface ICommunityPartnerFactory
    {
        int SaveToDb(CommunityPartner model);
        int Delete(int communityPartnerId);
        IPageableCollection<CommunityPartner> CreateList(int pageIndex, int pageSize, CommunityPartnerCollectionSettings settings = null);
        IEnumerable<CommunityPartnerForList> TopList(int top = 10, CommunityPartnerCollectionSettings settings = null);
        bool ExistsUniqueUrl(string uniqueUrl);
        CommunityPartner Create(int ID);
        CommunityPartner Create(string uniqueUrl);
    }
}
