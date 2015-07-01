using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.DBLayer;
using Commengdpu.Models;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.CommunityPartnerServices
{
    class CommunityPartner2IndividualPartnerFactory : ICommunityPartner2IndividualPartnerFactory, ISingletonRegister
    {
        [Dependency]
        public IDbCommunityPartner2IndividualPartner DbCommunityPartner2IndividualPartner { get; set; }

        public int AddToDb(IEnumerable<CommunityPartner2IndividualPartner> communityPartner2IndividualPartners)
        {
            return DbCommunityPartner2IndividualPartner.Insert(communityPartner2IndividualPartners.GroupBy(p2cp => new { p2cp.IndividualPartnerID, p2cp.CommunityPartnerID }, (key, group) => group.FirstOrDefault()));
        }

        public int SaveToDb(IndividualPartner individualPartner, IEnumerable<CommunityPartner2IndividualPartner> communityPartner2IndividualPartners)
        {
            if (communityPartner2IndividualPartners == null)
            {
                return DbCommunityPartner2IndividualPartner.DeleteByIndividualPartnerId(individualPartner.ID);
            }
            var originalList = DbCommunityPartner2IndividualPartner.List(individualPartner.ID);
            var newList = communityPartner2IndividualPartners.GroupBy(p2cp=>new{p2cp.IndividualPartnerID,p2cp.CommunityPartnerID},(key,group)=>group.FirstOrDefault());
            var forDeleting = originalList.Where(o => newList.All(n => n.CommunityPartnerID != o.CommunityPartnerID));
            var forAdding = newList.Where(n => originalList.All(o => o.CommunityPartnerID != n.CommunityPartnerID));
            
            var result = 0;
            if (forDeleting.Any())
            {
                result += DbCommunityPartner2IndividualPartner.Delete(forDeleting);
            }
            if (forAdding.Any())
            {
                result += DbCommunityPartner2IndividualPartner.Insert(forAdding);
            }
            return result;
        }
    }
}
