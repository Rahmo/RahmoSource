using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.Settings;

namespace Commengdpu.BusinessLayer.IndividualPartnerServices
{
    public interface IIndividualPartnerFactory
    {
        int SaveToDb(IndividualPartner model);
        /// <summary>
        /// Watch out! if communityPartner2IndividualPartners is null, database will delete all communityPartner2IndividualPartners for this IndividualPartner.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="communityPartner2IndividualPartners"></param>
        /// <returns></returns>
        int SaveToDb(IndividualPartner model,
            IEnumerable<CommunityPartner2IndividualPartner> communityPartner2IndividualPartners);
        int Delete(int individualPartnerId);
        IPageableCollection<IndividualPartner> CreateList(int pageIndex, int pageSize);
        IEnumerable<IndividualPartnerForList> TopList(int top = 10, IndividualPartnerCollectionSettings settings = null);
        bool ExistsUniqueUrl(string uniqueUrl);
        IndividualPartner Create(int ID);
        IndividualPartner Create(string uniqueUrl);
    }
}
