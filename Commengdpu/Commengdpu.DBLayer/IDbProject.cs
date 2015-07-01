using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.Reports;
using Commengdpu.Models.Settings;

namespace Commengdpu.DBLayer
{
    public interface IDbProject
    {
        int Insert(Project project);
        int Update(Project project);
        int Delete(Project project);
        Project Create(int ID);
        Project Create(string uniqueUrl);
        IEnumerable<ProjectForList> List(int top = 10, ProjectCollectionSettings settings = null);
        IEnumerable<Project> List(int pageIndex, int pageSize, string[] categories);
        int Count(string[] categories);
        IEnumerable<Project> List(int pageIndex, int pageSize, ProjectCollectionSettings settings = null);
        int Count(ProjectCollectionSettings settings=null);
        bool ExistsUniqueUrl(string nameUrl);
        OverrallBaseTotalReport BuildOverrallBaseTotalReports(ReportSettings settings = null);
    }
}
