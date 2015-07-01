using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.Settings;

namespace Commengdpu.BusinessLayer.CategoryServices
{
    public interface ICategoryFactory
    {
        int SaveToDb(Category model);
        int Delete(int categoryId);
        IPageableCollection<Category> CreateList(int pageIndex, int pageSize,CategoryCollectionSettings settings=null);
        Category Create(int ID);
        IEnumerable<Category> BuildList();
        IEnumerable<Category> BuildCachedCategoryList();
        CategoryNode BuildCategoryNode(int id);
        IEnumerable<CategoryNode> BuildRootCategoryNodes(IEnumerable<Project2Category> values = null);
        bool Exists(string name);
    }
}
