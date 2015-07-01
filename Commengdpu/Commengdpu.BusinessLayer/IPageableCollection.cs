using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Commengdpu.BusinessLayer
{
    public interface IPageableCollection<out T>:IEnumerable<T>
    {
        int TotalCount { get; set; }
        int PageIndex { get; set; }
        int PageSize { get; set; }
    }
}
