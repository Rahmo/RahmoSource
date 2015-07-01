using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.StudentServices
{
    #region =StudentReportCollection=
    internal class StudentReportCollection : IStudentReportCollection
    {

        public int Count { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        public StudentReportCollectionSettings Settings { get; set; }
        DataTable _table;
        [Dependency]
        public IDB_Student DB_Student { get; set; }
        public void Initalize()
        {
            if (_table != null) return;
            _table = DB_Student.ReportList(Settings);
            Count = _table.Rows.Count;
        }
        #region IEnumerable<Student> 成员

        public IEnumerator<StudentReport> GetEnumerator()
        {
            Initalize();
            foreach (DataRow row in _table.Rows)
            {
                StudentReport m = new StudentReport();
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
                StudentReport m = new StudentReport();
                ReflectionHelper.Fill(row, m);
                yield return m;
            }
        }

        #endregion
    }
    #endregion
}
