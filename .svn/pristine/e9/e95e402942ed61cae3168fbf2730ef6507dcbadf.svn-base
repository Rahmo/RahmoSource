using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.DBLayer;
using Commengdpu.Models;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.ProjectServices
{
    class Project2TypeFactory : IProject2TypeFactory, ISingletonRegister
    {
        [Dependency]
        public IDbProject2Type DbProject2Type { get; set; }

        public int AddToDb(IEnumerable<Project2Type> project2Types)
        {
            return DbProject2Type.Insert(project2Types);
        }

        public int SaveToDb(Project project, IEnumerable<Project2Type> project2Types)
        {
            if (project2Types == null)
            {
                return DbProject2Type.DeleteByProjectId(project.ID);
            }
            var originalList = DbProject2Type.List(project.ID);
            var newList = project2Types;
            var forDeleting = originalList.Where(o => newList.All(n => n.ProjectTypeID != o.ProjectTypeID));
            var forAdding = newList.Where(n => originalList.All(o => o.ProjectTypeID != n.ProjectTypeID));
            var forUpdating =
                newList.Where(
                    n =>
                        originalList.Any(
                            o =>
                                o.ProjectID == n.ProjectID && o.ProjectTypeID == n.ProjectTypeID &&
                                (n.NumberofParticipatingTargets != o.NumberofParticipatingTargets ||
                                 n.NumberofHoursServed != o.NumberofHoursServed
                                 ||n.NumberofParticipatingFaculty!=o.NumberofParticipatingFaculty
                                 || n.NumberofFacultyHoursServed != o.NumberofFacultyHoursServed
                                 || n.NumberofParticipatingStaff != o.NumberofParticipatingStaff
                                 || n.NumberofStaffHoursServed != o.NumberofStaffHoursServed
                                 )
                            )
                    );
            var result = 0;
            if (forDeleting.Any())
            {
                result += DbProject2Type.Delete(forDeleting);
            }
            if (forAdding.Any())
            {
                result += DbProject2Type.Insert(forAdding);
            }
            if (forUpdating.Any())
            {
                result += DbProject2Type.Update(forUpdating);
            }
            return result;
        }
    }
}
