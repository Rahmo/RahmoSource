using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.StudentServices
{
    #region =Student2CBOFactory=
    internal class Student2CBOFactory : IStudent2CBOFactory, IWeakReferenceRegister
    {
        [Dependency]
        public IDB_Student2CBO DB_Student2CBO { get; set; }
        public IStudent2CBOCollection CreateStudent2CBOCollection(int studentId)
        {
            var i = ICStarsUnityContainer.Current.Resolve<Student2CBOCollection>();
            i.StudentID = studentId;
            return i;
        }
        public int Add(Student2CBO m)
        {
            return DB_Student2CBO.Add(m);
        }
        public int Update(Student2CBO m)
        {
            return DB_Student2CBO.Update(m);
        }
        public int Delete(int studentId, int cboId, string quarterYear)
        {
            return DB_Student2CBO.Delete(studentId, cboId,quarterYear);
        }

        public int DeleteByStudentId(int studentId)
        {
            return DB_Student2CBO.DeleteByStudentId(studentId);
        }


        public Student2CBO Create(int studentId, int cboId, string quarterYear)
        {
            Student2CBO m = new Student2CBO();
            if (studentId > 0 && cboId>0)
            {
                ReflectionHelper.Fill(DB_Student2CBO.Info(studentId,cboId,quarterYear), m);
            }
            return m;
        }
    }
    #endregion
}
