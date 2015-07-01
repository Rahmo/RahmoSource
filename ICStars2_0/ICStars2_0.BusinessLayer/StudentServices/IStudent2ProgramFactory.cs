using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.StudentServices
{
    public interface IStudent2ProgramFactory
    {
        int Add(Student2Program s2p);
        IEnumerable<Student2Program> CreateList(int studentId);
        int Delete(Student2Program s2p);
        int Update(Student2Program s2p);
    }
}
