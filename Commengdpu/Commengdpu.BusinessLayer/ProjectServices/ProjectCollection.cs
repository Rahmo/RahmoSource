using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;

namespace Commengdpu.BusinessLayer.ProjectServices
{
    class ProjectCollection:IPageableCollection<Project>
    {
        private readonly IEnumerable<Project> _projects;
        public ProjectCollection(IEnumerable<Project> list)
        {
            _projects = list;
        }
        public IEnumerator<Project> GetEnumerator()
        {
            return _projects.GetEnumerator();
        }

        IEnumerator IEnumerable.GetEnumerator()
        {
            return GetEnumerator();
        }

        public int TotalCount { get; set; }
        public int PageIndex { get; set; }
        public int PageSize { get; set; }
    }
}
