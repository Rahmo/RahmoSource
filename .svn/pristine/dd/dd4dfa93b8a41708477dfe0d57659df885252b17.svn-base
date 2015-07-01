using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.BusinessLayer.CommunityPartnerServices;
using Commengdpu.BusinessLayer.Provider;
using Commengdpu.DBLayer;
using Commengdpu.Models;
using Commengdpu.Models.Settings;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.IndividualPartnerServices
{
    class IndividualPartnerFactory : IIndividualPartnerFactory, ISingletonRegister
    {
        [Dependency]
        public IDbIndividualPartner DbIndividualPartner { get; set; }
        [Dependency]
        public ICommunityPartner2IndividualPartnerFactory CommunityPartner2IndividualPartnerFactory { get; set; }
        [Dependency]
        public IUserData UserData { get; set; }

        public int SaveToDb(IndividualPartner model)
        {
            return model.ID == 0 ? DbIndividualPartner.Insert(model) : DbIndividualPartner.Update(model);
        }
        /// <summary>
        /// Watch out! if communityPartner2IndividualPartners is null, database will delete all communityPartner2IndividualPartners for this IndividualPartner.
        /// </summary>
        /// <param name="model"></param>
        /// <param name="communityPartner2IndividualPartners"></param>
        /// <returns></returns>
        public int SaveToDb(IndividualPartner model,
            IEnumerable<CommunityPartner2IndividualPartner> communityPartner2IndividualPartners)
        {
            model.LastModifiedDate = DateTime.Now;
            if (model.ID == 0)
            {
                model.CreatorUserID = UserData.ID;
                var r = DbIndividualPartner.Insert(model);
                if (r > 0 && communityPartner2IndividualPartners != null)
                {
                    CommunityPartner2IndividualPartnerFactory.AddToDb(communityPartner2IndividualPartners);
                }
                return r;
            }
            model.LastEditorUserID = UserData.ID;
            var r1 = DbIndividualPartner.Update(model);
            if (r1 <= 0) return r1;
            CommunityPartner2IndividualPartnerFactory.SaveToDb(model, communityPartner2IndividualPartners);
            return r1;
        }

        public int Delete(int individualPartnerId)
        {

            return DbIndividualPartner.Delete(new IndividualPartner() { ID = individualPartnerId });
        }

        public IPageableCollection<IndividualPartner> CreateList(int pageIndex, int pageSize)
        {
            var list = new IndividualPartnerCollection(DbIndividualPartner.List(pageIndex, pageSize))
            {
                PageIndex = pageIndex,
                PageSize = pageSize,
                TotalCount = DbIndividualPartner.Count()
            };

            return list;
        }
        public IEnumerable<IndividualPartnerForList> TopList(int top = 10, IndividualPartnerCollectionSettings settings = null)
        {
            return DbIndividualPartner.List(top, settings);
        }
        public bool ExistsUniqueUrl(string uniqueUrl)
        {
            return DbIndividualPartner.ExistsUniqueUrl(uniqueUrl);
        }

        public IndividualPartner Create(int ID)
        {
            return DbIndividualPartner.Create(ID);
        }

        public IndividualPartner Create(string uniqueUrl)
        {
            return DbIndividualPartner.Create(uniqueUrl);
        }
    }
}
