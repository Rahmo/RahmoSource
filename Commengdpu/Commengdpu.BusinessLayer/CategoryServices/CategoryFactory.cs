using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.DBLayer;
using Commengdpu.Models;
using Commengdpu.Models.Settings;
using ICStars2_0.Common;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.CategoryServices
{

    class CategoryFactory : ICategoryFactory, ISingletonRegister
    {
        [Dependency]
        public IDbCategory DbCategory { get; set; }
        public int SaveToDb(Category model)
        {
            return model.ID == 0 ? DbCategory.Insert(model) : DbCategory.Update(model);
        }

        public int Delete(int categoryId)
        {
            return DbCategory.Delete(new Category { ID = categoryId });
        }

        public IPageableCollection<Category> CreateList(int pageIndex, int pageSize, CategoryCollectionSettings settings = null)
        {
            var list = new CategoryCollection(DbCategory.List(pageIndex, pageSize,settings))
            {
                PageIndex = pageIndex,
                PageSize = pageSize,
                TotalCount = DbCategory.Count(settings)
            };

            return list;
        }

        public IEnumerable<Category> BuildList()
        {
            return DbCategory.List();
        }

        public IEnumerable<Category> BuildCachedCategoryList()
        {
            var cacheSettings = new CacheHelper.Settings("Commengdpu.BusinessLayer.CategoryServices.CategoryFactory.BuildCachedCategoryList");
            var cache = CacheHelper.GetCache<IEnumerable<Category>>(cacheSettings);
            if (cache != null)
            {
                return cache;
            }
            var list = BuildList();
            CacheHelper.BuildCache<IEnumerable<Category>>(list, cacheSettings);
            return list;

        }
        public Category Create(int ID)
        {
            return DbCategory.Create(ID);
        }

        #region =CategoryNode=
        public CategoryNode BuildCategoryNode(int id)
        {
            var cacheSettings =
                new CacheHelper.Settings(
                    "Commengdpu.BusinessLayer.CategoryServices.CategoryFactory.BuildCategoryNode");
            var cache = CacheHelper.GetCache<CategoryNode>(cacheSettings);
            if (cache != null)
            {
                return cache;
            }
            var list = BuildCachedCategoryList();
            var node = list.SingleOrDefault(n => n.ID == id);
            var result = BuildCategoryNodes(new CategoryNode(node), list);

            CacheHelper.BuildCache(result, cacheSettings);
            return result;


        }

        public IEnumerable<CategoryNode> BuildRootCategoryNodes(IEnumerable<Project2Category> values=null)
        {
            var cacheSettings =
                new CacheHelper.Settings(
                    "Commengdpu.BusinessLayer.CategoryServices.CategoryFactory.BuildRootCategoryNodes");
            var cache = CacheHelper.GetCache<IEnumerable<CategoryNode>>(cacheSettings);
            if (cache != null)
            {
                return cache;
            }

            var list = BuildCachedCategoryList();
            var result =
                list.Where(n => n.ParentID == 0).Select(n => BuildCategoryNodes(new CategoryNode(n), list,values));

            CacheHelper.BuildCache(result, cacheSettings);
            return result;


        }

        public bool Exists(string name)
        {
            return DbCategory.Exists(name);
        }

        private CategoryNode BuildCategoryNodes(CategoryNode nav, IEnumerable<Category> list, IEnumerable<Project2Category> values = null)
        {
            if (nav == null) return nav;
            if (values != null)
            {
                var value = values.FirstOrDefault(v => v.CategoryID == nav.ID);
                if (value != null)
                {
                    nav.IsChecked = true;
                    nav.ImpactAmount = value.ImpactAmount ?? 0;
                }
            }
            var children = list.Where(n => n.ParentID == nav.ID);
            if (!children.Any()) return nav;
            if (nav.Children == null)
            {
                nav.Children = new List<CategoryNode>();
            }
            nav.Children.AddRange(children.Select(n => new CategoryNode(n, nav)));
            for (int i = 0; i < nav.Children.Count; i++)
            {
                nav.Children[i] = BuildCategoryNodes(nav.Children[i], list,values);
            }
            return nav;
        }
        #endregion
    }
}
