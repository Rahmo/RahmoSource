using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.Settings;

namespace Commengdpu.BusinessLayer.ProjectServices
{
    public interface IProjectFactory
    {
        int SaveToDb(Project project);
        /// <summary>
        /// Watch out! if project2Categories/project2CommunityPartners/project2IndividualPartners/project2Types is null, database will delete all related data for this project.
        /// </summary>
        /// <param name="project"></param>
        /// <param name="project2Categories"></param>
        /// <param name="project2CommunityPartners"></param>
        /// <param name="project2IndividualPartners"></param>
        /// <param name="project2Types"></param>
        /// <returns></returns>
        int SaveToDb(Project project, IEnumerable<Project2Category> project2Categories,
            IEnumerable<Project2CommunityPartner> project2CommunityPartners,
            IEnumerable<Project2IndividualPartner> project2IndividualPartners,
            IEnumerable<Project2Type> project2Types);
        int Delete(int projectId);
        IPageableCollection<Project> CreateList(int pageIndex, int pageSize, ProjectCollectionSettings settings = null);
        IPageableCollection<Project> CreateList(int pageIndex, int pageSize, string[] categories);
        IEnumerable<ProjectForList> TopList(int top = 10, ProjectCollectionSettings settings = null);
        bool ExistsUniqueUrl(string nameUrl);
        Project Create(int ID);
        Project Create(string uniqueUrl);
    }
}
