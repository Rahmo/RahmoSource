using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;

namespace Commengdpu.DBLayer
{
    public interface IDbProject2IndividualPartner
    {
        int Insert(IEnumerable<Project2IndividualPartner> project2IndividualPartners);
        int Update(IEnumerable<Project2IndividualPartner> project2IndividualPartners);
        int Delete(IEnumerable<Project2IndividualPartner> project2IndividualPartners);
        int DeleteByProjectId(int projectId);
        IEnumerable<Project2IndividualPartner> List(int projectId);
    }
}
