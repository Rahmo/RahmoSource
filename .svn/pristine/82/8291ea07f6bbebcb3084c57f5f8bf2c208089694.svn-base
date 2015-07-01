using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.DBLayer;
using Commengdpu.Models;
using Commengdpu.Models.Reports;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.ProjectTypeServices
{
    class ProjectTypeFactory:IProjectTypeFactory,ISingletonRegister
    {
        [Dependency]
        public IDbProjectType DbProjectType { get; set; }
        public IEnumerable<ProjectType> CreateList()
        {
            return DbProjectType.List();
        }
    }
}
