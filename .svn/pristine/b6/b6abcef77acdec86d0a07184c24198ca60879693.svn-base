using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;

namespace Commengdpu.BusinessLayer.ProjectServices
{
    public interface IProject2IndividualPartnerFactory
    {
        /// <summary>
        /// Only add new records
        /// </summary>
        /// <returns></returns>
        int AddToDb(IEnumerable<Project2IndividualPartner> project2IndividualPartners);
        /// <summary>
        /// It would Automatically apply data inserting/modifying/deleting.
        /// </summary>
        /// <returns></returns>
        int SaveToDb(Project project, IEnumerable<Project2IndividualPartner> project2IndividualPartners);
    }
}
