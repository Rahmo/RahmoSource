using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.BusinessLayer.ProjectServices;
using Commengdpu.BusinessLayer.Provider;
using Commengdpu.DBLayer;
using Commengdpu.Models;
using Commengdpu.Models.Settings;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.CommunityPartnerServices
{
    class CommunityPartnerFactory : ICommunityPartnerFactory, ISingletonRegister
    {

        [Dependency]
        public IDbCommunityPartner DbCommunityPartner { get; set; }
        [Dependency]
        public IUserData UserData { get; set; }
        public int SaveToDb(CommunityPartner model)
        {
            model.LastModifiedDate = DateTime.Now;
            if (model.ID == 0)
            {
                model.CreatorUserID = UserData.ID;
                return DbCommunityPartner.Insert(model);
            }
            model.LastEditorUserID = UserData.ID;
            return DbCommunityPartner.Update(model);
        }

        public int Delete(int communityPartnerId)
        {
            return DbCommunityPartner.Delete(new CommunityPartner { ID = communityPartnerId });
        }

        public IPageableCollection<CommunityPartner> CreateList(int pageIndex, int pageSize,CommunityPartnerCollectionSettings settings=null)
        {
            var list = new CommunityPartnerCollection(DbCommunityPartner.List(pageIndex, pageSize,settings))
            {
                PageIndex = pageIndex,
                PageSize = pageSize,
                TotalCount = DbCommunityPartner.Count(settings)
            };

            return list;
        }

        public IEnumerable<CommunityPartnerForList> TopList(int top = 10, CommunityPartnerCollectionSettings settings = null)
        {
            return DbCommunityPartner.List(top, settings);
        }

        public bool ExistsUniqueUrl(string uniqueUrl)
        {
            return DbCommunityPartner.ExistsUniqueUrl(uniqueUrl);
        }

        public CommunityPartner Create(int ID)
        {
            return DbCommunityPartner.Create(ID);
        }

        public CommunityPartner Create(string uniqueUrl)
        {
            return DbCommunityPartner.Create(uniqueUrl);
        }
    }
}
