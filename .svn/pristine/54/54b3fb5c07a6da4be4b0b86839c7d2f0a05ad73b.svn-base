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
    class Project2CategoryFactory:IProject2CategoryFactory,ISingletonRegister
    {
        [Dependency]
        public IDbProject2Category DbProject2Category { get; set; }

        public int AddToDb(IEnumerable<Project2Category> project2Categories)
        {
            return DbProject2Category.Insert(project2Categories);
        }

        public int SaveToDb(Project project, IEnumerable<Project2Category> project2Categories)
        {
            if (project2Categories == null)
            {
                return DbProject2Category.DeleteByProjectId(project.ID);
            }
            var originalList = DbProject2Category.List(project.ID);
            var newList = project2Categories;
            var forDeleting = originalList.Where(o => newList.All(n => n.CategoryID != o.CategoryID));
            var forAdding = newList.Where(n => originalList.All(o => o.CategoryID != n.CategoryID));
            var forUpdating =
                newList.Where(n => originalList.Any(o => o.ProjectID == n.ProjectID && o.CategoryID==n.CategoryID && n.ImpactAmount != o.ImpactAmount));
            var result = 0;
            if (forDeleting.Any())
            {
                result += DbProject2Category.Delete(forDeleting);
            }
            if (forAdding.Any())
            {
                result += DbProject2Category.Insert(forAdding);
            }
            if (forUpdating.Any())
            {
                result += DbProject2Category.Update(forUpdating);
            }
            return result;
        }

        public IEnumerable<Project2Category> GetProject2Categories(int[] projectIds)
        {
            return DbProject2Category.GetProject2Categories(projectIds);
        }
    }
}
