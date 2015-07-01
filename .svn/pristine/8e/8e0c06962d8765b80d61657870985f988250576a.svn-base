using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Model;

namespace ICStars2_0.Db
{
    public interface IDB_Student2CBO
    {
        int Count();
        DataTable List(int studentId);
        int Add(Student2CBO student2cbo);
        int Update(Student2CBO student2cbo);
        int Delete(int studentId, int cboId, string quarterYear);
        int DeleteByStudentId(int studentId);
        DataRow Info(int studentId, int cboId, string quarterYear);
    }
}
