using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;

namespace Commengdpu.BusinessLayer.CategoryServices
{
    class CategoryCollection : IPageableCollection<Category>
    {
        private readonly IEnumerable<Category> _categories;
        public CategoryCollection(IEnumerable<Category> list)
        {
            _categories = list;
        }
        public IEnumerator<Category> GetEnumerator()
        {
            return _categories.GetEnumerator();
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
