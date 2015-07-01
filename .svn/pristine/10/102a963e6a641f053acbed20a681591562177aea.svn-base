using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.StudentServices
{

    
    #region =Student2CBOCollection=
    internal class Student2CBOCollection : IStudent2CBOCollection
    {

        public int Count { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public int StudentID { get; set; }
        DataTable _table;
        [Dependency]
        public IDB_Student2CBO DB_Student2CBO { get; set; }
        public void Initalize()
        {
            if (_table != null) return;
            _table = DB_Student2CBO.List(StudentID);
            Count = _table.Rows.Count;
        }
        #region IEnumerable<Student2CBO> 成员

        public IEnumerator<Student2CBO> GetEnumerator()
        {
            Initalize();
            foreach (DataRow row in _table.Rows)
            {
                Student2CBO m = new Student2CBO();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion

        #region IEnumerable 成员

        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            Initalize();
            foreach (DataRow row in _table.Rows)
            {
                Student2CBO m = new Student2CBO();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion
    }
    #endregion
            
}
