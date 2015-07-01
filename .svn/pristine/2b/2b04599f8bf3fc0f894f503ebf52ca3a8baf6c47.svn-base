using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.BusinessLayer.Provider;
using Commengdpu.DBLayer;
using Commengdpu.Models;
using Commengdpu.Models.Settings;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.ProjectServices
{
    class ProjectFactory : IProjectFactory, ISingletonRegister
    {
        [Dependency]
        public IDbProject DbProject { get; set; }
        [Dependency]
        public IProject2CategoryFactory Project2CategoryFactory { get; set; }
        [Dependency]
        public IProject2TypeFactory Project2TypeFactory { get; set; }
        [Dependency]
        public IProject2CommunityPartnerFactory Project2CommunityPartnerFactory { get; set; }
        [Dependency]
        public IProject2IndividualPartnerFactory Project2IndividualPartnerFactory { get; set; }
        [Dependency]
        public IUserData UserData { get; set; }

        public int SaveToDb(Project project)
        {
            return project.ID == 0 ? DbProject.Insert(project) : DbProject.Update(project);
        }
        /// <summary>
        /// Watch out! if project2Categories/project2CommunityPartners/project2IndividualPartners/project2Types is null, database will delete all related data for this project.
        /// </summary>
        /// <param name="project"></param>
        /// <param name="project2Categories"></param>
        /// <param name="project2CommunityPartners"></param>
        /// <param name="project2IndividualPartners"></param>
        /// <param name="project2Types"></param>
        /// <returns></returns>
        public int SaveToDb(Project project, IEnumerable<Project2Category> project2Categories, IEnumerable<Project2CommunityPartner> project2CommunityPartners,
            IEnumerable<Project2IndividualPartner> project2IndividualPartners, IEnumerable<Project2Type> project2Types)
        {
            project.LastModifiedDate = DateTime.Now;
            if (project.ID == 0)
            {
                project.CreatorUserID = UserData.ID;
                var r = DbProject.Insert(project);
                if (r > 0 && project2Categories != null)
                {
                    Project2CategoryFactory.AddToDb(project2Categories);
                }
                if (r > 0 && project2Types != null)
                {
                    Project2TypeFactory.AddToDb(project2Types);
                }
                if (r > 0 && project2CommunityPartners != null)
                {
                    Project2CommunityPartnerFactory.AddToDb(project2CommunityPartners);
                }
                if (r > 0 && project2IndividualPartners != null)
                {
                    Project2IndividualPartnerFactory.AddToDb(project2IndividualPartners);
                }
                return r;
            }
            project.LastEditorUserID = UserData.ID;
            var r1 = DbProject.Update(project);

            if (r1 <= 0) return r1;
            Project2CategoryFactory.SaveToDb(project, project2Categories);
            Project2TypeFactory.SaveToDb(project, project2Types);
           
            Project2CommunityPartnerFactory.SaveToDb(project, project2CommunityPartners);
           
            Project2IndividualPartnerFactory.SaveToDb(project, project2IndividualPartners);
            return r1;
        }

        public int Delete(int projectId)
        {

            return DbProject.Delete(new Project() {ID = projectId});
        }

        public IPageableCollection<Project> CreateList(int pageIndex, int pageSize, ProjectCollectionSettings settings = null)
        {
            var list = new ProjectCollection(DbProject.List(pageIndex, pageSize,settings))
            {
                PageIndex=pageIndex,
                PageSize=pageSize,
                TotalCount=DbProject.Count(settings)
            };
            
            return list;
        }

        public IPageableCollection<Project> CreateList(int pageIndex, int pageSize, string[] categories)
        {
            var list = new ProjectCollection(DbProject.List(pageIndex, pageSize, categories))
            {
                PageIndex = pageIndex,
                PageSize = pageSize,
                TotalCount = DbProject.Count(categories)
            };

            return list;
        }

        public IEnumerable<ProjectForList> TopList(int top = 10, ProjectCollectionSettings settings = null)
        {
            return DbProject.List(top, settings);
        }
        public bool ExistsUniqueUrl(string nameUrl)
        {
            return DbProject.ExistsUniqueUrl(nameUrl);
        }

        public Project Create(int ID)
        {
            return DbProject.Create(ID);
        }

        public Project Create(string uniqueUrl)
        {
            return DbProject.Create(uniqueUrl);
        }
    }
}
