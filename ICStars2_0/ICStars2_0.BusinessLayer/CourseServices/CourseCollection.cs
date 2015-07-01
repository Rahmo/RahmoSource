using System;
using System.Collections.Generic;
using System.Data;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.CourseServices
{
    #region =CourseCollection=
    internal class CourseCollection : ICourseCollection
    {

        public int TotalCount { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
        private readonly IEnumerable<Course> _courses; 
        public CourseCollectionSettings Settings { get; set; }
        public CourseCollection(IEnumerable<Course> courses, int totalCount)
        {
            _courses = courses;
            TotalCount = totalCount;
        }
        public IEnumerator<Course> GetEnumerator()
        {
            return _courses.GetEnumerator();
        }

        #endregion

        #region IEnumerable 成员

        System.Collections.IEnumerator System.Collections.IEnumerable.GetEnumerator()
        {
            return _courses.GetEnumerator();
        }

        #endregion
    }
}
