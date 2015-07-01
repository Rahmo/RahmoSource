using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;

namespace Commengdpu.BusinessLayer.ProjectServices
{
    public interface IProject2CategoryFactory
    {
        /// <summary>
        /// Only add new records
        /// </summary>
        /// <param name="project2Categories"></param>
        /// <returns></returns>
        int AddToDb(IEnumerable<Project2Category> project2Categories);
        /// <summary>
        /// It would Automatically apply data inserting/modifying/deleting.
        /// </summary>
        /// <returns></returns>
        int SaveToDb(Project project, IEnumerable<Project2Category> project2Categories);

        IEnumerable<Project2Category> GetProject2Categories(int[] projectIds);
    }
}
