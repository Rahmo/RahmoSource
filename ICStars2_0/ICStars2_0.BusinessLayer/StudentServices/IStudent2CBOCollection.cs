using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.StudentServices
{
    public interface IStudent2CBOCollection : IEnumerable<Student2CBO>
    {
        int Count { get; set; }
        int PageIndex { get; set; }
        int PageSize { get; set; }
    }
}
