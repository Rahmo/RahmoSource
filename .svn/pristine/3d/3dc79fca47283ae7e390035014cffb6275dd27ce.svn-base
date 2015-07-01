using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;

namespace Commengdpu.BusinessLayer.ProjectServices
{
    public interface IProject2CommunityPartnerFactory
    {
        /// <summary>
        /// Only add new records
        /// </summary>
        /// <param name="project2CommunityPartners"></param>
        /// <returns></returns>
        int AddToDb(IEnumerable<Project2CommunityPartner> project2CommunityPartners);
        /// <summary>
        /// It would Automatically apply data inserting/modifying/deleting.
        /// </summary>
        /// <returns></returns>
        int SaveToDb(Project project, IEnumerable<Project2CommunityPartner> project2CommunityPartners);
    }
}
