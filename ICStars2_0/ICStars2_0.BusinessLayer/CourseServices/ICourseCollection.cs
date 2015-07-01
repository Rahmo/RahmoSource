using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.BusinessLayer.CourseServices
{

    public interface ICourseCollection : IEnumerable<Course>
    {
        int TotalCount { get; set; }
        int PageIndex { get; set; }
        int PageSize { get; set; }
        CourseCollectionSettings Settings { get; set; }
    }
}
