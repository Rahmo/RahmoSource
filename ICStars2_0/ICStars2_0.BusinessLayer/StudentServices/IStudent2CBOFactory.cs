using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.StudentServices
{
    public interface IStudent2CBOFactory
    {
        IStudent2CBOCollection CreateStudent2CBOCollection(int studentId);
        int Update(Student2CBO m);
        int Add(Student2CBO m);
        int Delete(int studentId, int cboId,string quarterYear);
        int DeleteByStudentId(int studentId);
        Student2CBO Create(int studentId, int cboId, string quarterYear);
    }
}
