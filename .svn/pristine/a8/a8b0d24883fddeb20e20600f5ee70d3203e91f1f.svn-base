using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.DBLayer;
using Commengdpu.Models;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.ProjectServices
{
    class Project2CommunityPartnerFactory : IProject2CommunityPartnerFactory, ISingletonRegister
    {
        [Dependency]
        public IDbProject2CommunityPartner DbProject2CommunityParner { get; set; }

        public int AddToDb(IEnumerable<Project2CommunityPartner> project2CommunityPartners)
        {
            return DbProject2CommunityParner.Insert(project2CommunityPartners.GroupBy(p2cp=>new{p2cp.ProjectID,p2cp.CommunityPartnerID},(key,group)=>group.FirstOrDefault()));
        }

        public int SaveToDb(Project project, IEnumerable<Project2CommunityPartner> project2CommunityPartners)
        {
            if (project2CommunityPartners == null)
            {
                return DbProject2CommunityParner.DeleteByProjectId(project.ID);
            }
            var originalList = DbProject2CommunityParner.List(project.ID);
            var newList = project2CommunityPartners.GroupBy(p2cp=>new{p2cp.ProjectID,p2cp.CommunityPartnerID},(key,group)=>group.FirstOrDefault());
            var forDeleting = originalList.Where(o => newList.All(n => n.CommunityPartnerID != o.CommunityPartnerID));
            var forAdding = newList.Where(n => originalList.All(o => o.CommunityPartnerID != n.CommunityPartnerID));
            var forUpdating =
                newList.Where(n => originalList.Any(o => o.ProjectID == n.ProjectID && o.CommunityPartnerID == n.CommunityPartnerID && n.PartnershipType != o.PartnershipType));
            var result = 0;
            if (forDeleting.Any())
            {
                result += DbProject2CommunityParner.Delete(forDeleting);
            }
            if (forAdding.Any())
            {
                result += DbProject2CommunityParner.Insert(forAdding);
            }
            if (forUpdating.Any())
            {
                result += DbProject2CommunityParner.Update(forUpdating);
            }
            return result;
        }
    }
}
