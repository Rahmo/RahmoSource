using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;

namespace ICStars2_0.BusinessLayer.ProgramServices
{
    class ProgramFactory : IProgramFactory, IWeakReferenceRegister
    {
        public IEnumerable<Program> CreateList()
        {
            using (var db = new SHTrackerDbContext())
            {
                return db.Programs.ToList();
            }
        }
    }
}
