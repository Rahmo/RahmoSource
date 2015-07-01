using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;

namespace ICStars2_0.BusinessLayer.StudentServices
{
    class Student2ProgramFactory : IStudent2ProgramFactory, IWeakReferenceRegister
    {
        public int Add(Student2Program s2p)
        {
            using (var db = new SHTrackerDbContext())
            {
                db.Student2Programs.Add(s2p);
                return db.SaveChanges();
            }
        }

        public IEnumerable<Student2Program> CreateList(int studentId)
        {
            using (var db = new SHTrackerDbContext())
            {
                return db.Student2Programs.Where(s2p=>s2p.StudentID==studentId).ToList();
            }
        }

        public int Delete(Student2Program s2p)
        {
            using (var db = new SHTrackerDbContext())
            {
                db.Entry(s2p).State = EntityState.Deleted;
                return db.SaveChanges();
            }
        }

        public int Update(Student2Program s2p)
        {
            using (var db = new SHTrackerDbContext())
            {
                db.Entry(s2p).State = EntityState.Modified;
                return db.SaveChanges();
            }
        }
    }
}
