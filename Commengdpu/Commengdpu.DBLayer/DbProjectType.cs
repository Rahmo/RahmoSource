using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.DbContexts;
using Commengdpu.Models.Reports;
using Commengdpu.Models.Settings;
using ICStars2_0.Common.Lambda;
using ICStars2_0.Framework;

namespace Commengdpu.DBLayer
{
    class DbProjectType:IDbProjectType,ISingletonRegister
    {
        public IEnumerable<ProjectType> List()
        {
            using (var db = new DefaultDbContext())
            {
                return db.ProjectTypes.AsNoTracking().ToList().OrderBy(p=>p.OrderByID);
            }
        }

        public IEnumerable<OverrallTotalReportByProjectType> BuildOverrallReportsByProjectType(ReportSettings settings=null)
        {
            using (var db = new DefaultDbContext())
            {
                var predict = BuildPredicate(db, settings);

                var types = db.Project2Types.Where(predict);

                return db.ProjectTypes.AsNoTracking()
                    .Select(
                        t =>
                            new
                            {
                                t,
                                NumberofFacultyHoursServed =
                                    types.Where(pt => pt.ProjectTypeID == t.ID)
                                        .Sum(pt => pt.NumberofFacultyHoursServed),
                                NumberofHoursServed =
                                    types.Where(pt => pt.ProjectTypeID == t.ID)
                                        .Sum(pt => pt.NumberofHoursServed),
                                NumberofParticipatingFaculty =
                                    types.Where(pt => pt.ProjectTypeID == t.ID)
                                        .Sum(pt => pt.NumberofParticipatingFaculty),
                                NumberofParticipatingStaff =
                                    types.Where(pt => pt.ProjectTypeID == t.ID)
                                        .Sum(pt => pt.NumberofParticipatingStaff),
                                NumberofParticipatingTargets =
                                    types.Where(pt => pt.ProjectTypeID == t.ID)
                                        .Sum(pt => pt.NumberofParticipatingTargets),
                                NumberofStaffHoursServed =
                                    types.Where(pt => pt.ProjectTypeID == t.ID)
                                        .Sum(pt => pt.NumberofStaffHoursServed)
                            })
                    .ToList().Select(t => new OverrallTotalReportByProjectType
                    {
                        TypeName=t.t.Name,
                        OrderByID=t.t.OrderByID,
                        TrackingTarget=t.t.TrackingTarget,
                        IsTrackingAll=t.t.IsTrackingAll,
                        NumberofFacultyHoursServed = t.NumberofFacultyHoursServed,
                        NumberofHoursServed = t.NumberofHoursServed,
                        NumberofParticipatingFaculty = t.NumberofParticipatingFaculty,
                        NumberofParticipatingStaff = t.NumberofParticipatingStaff,
                        NumberofParticipatingTargets = t.NumberofParticipatingTargets,
                        NumberofStaffHoursServed = t.NumberofStaffHoursServed
                    }).OrderBy(p => p.OrderByID);
            }
        }

        /// <summary>
        /// Build a Lambda expression as a condition to filter reports
        /// </summary>
        /// <param name="db">DefaultDbContext</param>
        /// <param name="settings">ReportSettings</param>
        /// <returns>Lambda expression for "Where"</returns>
        private Expression<Func<Project2Type, bool>> BuildPredicate(DefaultDbContext db, ReportSettings settings)
        {
            var predicate = PredicateBuilder.True<Project2Type>();

            if (settings != null)
            {
                if (settings.StartDate != null && settings.EndDate!=null)
                {
                    predicate =
                        predicate.And(
                            pt =>
                                db.Projects.Any(
                                    p =>
                                        p.ID == pt.ProjectID && p.EndDate >= settings.StartDate &&
                                        p.StartDate <= settings.EndDate));
                }
            }
            return predicate;
        } 
    }
}
