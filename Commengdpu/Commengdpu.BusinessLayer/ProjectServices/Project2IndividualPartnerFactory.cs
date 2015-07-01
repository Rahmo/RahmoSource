using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.DBLayer;
using Commengdpu.Models;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.ProjectServices
{
    class Project2IndividualPartnerFactory : IProject2IndividualPartnerFactory, ISingletonRegister
    {
        [Dependency]
        public IDbProject2IndividualPartner DbProject2IndividualParner { get; set; }

        public int AddToDb(IEnumerable<Project2IndividualPartner> project2IndividualPartners)
        {
            return DbProject2IndividualParner.Insert(project2IndividualPartners.GroupBy(p2cp => new { p2cp.ProjectID, p2cp.IndividualPartnerID }, (key, group) => group.FirstOrDefault()));
        }

        public int SaveToDb(Project project, IEnumerable<Project2IndividualPartner> project2IndividualPartners)
        {
            if (project2IndividualPartners == null)
            {
                return DbProject2IndividualParner.DeleteByProjectId(project.ID);
            }
            var originalList = DbProject2IndividualParner.List(project.ID);
            var newList = project2IndividualPartners.GroupBy(p2cp => new { p2cp.ProjectID, p2cp.IndividualPartnerID }, (key, group) => group.FirstOrDefault());
            var forDeleting = originalList.Where(o => newList.All(n => n.IndividualPartnerID != o.IndividualPartnerID));
            var forAdding = newList.Where(n => originalList.All(o => o.IndividualPartnerID != n.IndividualPartnerID));
            var forUpdating =
                newList.Where(n => originalList.Any(o => o.ProjectID == n.ProjectID && o.IndividualPartnerID == n.IndividualPartnerID && n.ProjectRole != o.ProjectRole));
            var result = 0;
            if (forDeleting.Any())
            {
                result += DbProject2IndividualParner.Delete(forDeleting);
            }
            if (forAdding.Any())
            {
                result += DbProject2IndividualParner.Insert(forAdding);
            }
            if (forUpdating.Any())
            {
                result += DbProject2IndividualParner.Update(forUpdating);
            }
            return result;
        }
    }
}
