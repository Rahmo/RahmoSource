using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;

namespace Commengdpu.BusinessLayer.ProjectServices
{
    public interface IProject2TypeFactory
    {
        /// <summary>
        /// Only add new records
        /// </summary>
        /// <param name="project2Categories"></param>
        /// <returns></returns>
        int AddToDb(IEnumerable<Project2Type> project2Types);
        /// <summary>
        /// It would Automatically apply data inserting/modifying/deleting.
        /// </summary>
        /// <returns></returns>
        int SaveToDb(Project project, IEnumerable<Project2Type> project2Types);
    }
}
