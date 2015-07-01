using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;

namespace Commengdpu.DBLayer
{
    public interface IDbProject2Category
    {
        int Insert(IEnumerable<Project2Category> project2Categories);
        int Update(IEnumerable<Project2Category> project2Categories);
        int Delete(IEnumerable<Project2Category> project2Categories);
        int DeleteByProjectId(int projectId);
        IEnumerable<Project2Category> List(int projectId);
        IEnumerable<Project2Category> GetProject2Categories(int[] projectIds);
    }
}
