using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.Settings;

namespace Commengdpu.DBLayer
{
    public interface IDbCategory
    {
        int Insert(Category category);
        int Update(Category category);
        int Delete(Category category);
        Category Create(int ID);
        IEnumerable<Category> List();
        IEnumerable<Category> List(int pageIndex, int pageSize, CategoryCollectionSettings settings = null);
        int Count(CategoryCollectionSettings settings = null);
        bool Exists(string name);
    }
}
