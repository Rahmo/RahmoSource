using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.Settings;

namespace Commengdpu.DBLayer
{
    public interface IDbIndividualPartner
    {
        int Insert(IndividualPartner model);
        int Update(IndividualPartner model);
        int Delete(IndividualPartner model);
        IndividualPartner Create(int ID);
        IndividualPartner Create(string uniqueUrl);
        IEnumerable<IndividualPartnerForList> List(int top=10, IndividualPartnerCollectionSettings settings = null);
        IEnumerable<IndividualPartner> List(int pageIndex, int pageSize,IndividualPartnerCollectionSettings settings=null);
        int Count(IndividualPartnerCollectionSettings settings = null);
        bool ExistsUniqueUrl(string nameUrl);
    }
}
