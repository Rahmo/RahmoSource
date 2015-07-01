using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Routing;
using ICStars2_0.Common;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;

namespace ICStars2_0.BusinessLayer.Mvc.Constraints
{
    public class CategoryConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values,
            RouteDirection routeDirection)
        {
            var cacheSettings = new CacheHelper.Settings("ICStars2_0.BusinessLayer.Mvc.Constraints.CategoryConstraint");
            var cache = CacheHelper.GetCache<IEnumerable<Category>>(cacheSettings);
            if (cache == null)
            {
                using (var db = new ArticleDbContext())
                {
                    var categorylist = db.Categories.ToList();
                    cache = CacheHelper.BuildCache<IEnumerable<Category>>(categorylist, cacheSettings);
                }
            }
            return
                    cache.Any(
                        c => c.Name.Equals(values[parameterName].ToString(), StringComparison.InvariantCultureIgnoreCase));
            
        }
    }
}
