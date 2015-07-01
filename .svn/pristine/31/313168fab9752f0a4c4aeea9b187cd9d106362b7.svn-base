using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;

namespace Commengdpu.BusinessLayer.CommunityPartnerServices
{
    public interface ICommunityPartner2IndividualPartnerFactory
    {
        /// <summary>
        /// Only add new records
        /// </summary>
        /// <returns></returns>
        int AddToDb(IEnumerable<CommunityPartner2IndividualPartner> communityPartner2IndividualPartners);
        /// <summary>
        /// It would Automatically apply data inserting/modifying/deleting.
        /// </summary>
        /// <returns></returns>
        int SaveToDb(IndividualPartner individualPartner, IEnumerable<CommunityPartner2IndividualPartner> communityPartner2IndividualPartners);
    }
}
