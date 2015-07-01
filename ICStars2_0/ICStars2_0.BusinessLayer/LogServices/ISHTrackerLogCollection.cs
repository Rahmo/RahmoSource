using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.LogServices
{
    public interface ISHTrackerLogCollection : IEnumerable<SHTrackerLog>
    {
        int Count { get; set; }
        int PageIndex { get; set; }
        int PageSize { get; set; }
    }
}
