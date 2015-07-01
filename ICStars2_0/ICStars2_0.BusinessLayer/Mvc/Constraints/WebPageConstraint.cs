﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Routing;
using ICStars2_0.BusinessLayer.ArticleServices;
using ICStars2_0.Common;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;

namespace ICStars2_0.BusinessLayer.Mvc.Constraints
{
    public class WebPageConstraint : IRouteConstraint
    {
        public bool Match(HttpContextBase httpContext, Route route, string parameterName, RouteValueDictionary values,
            RouteDirection routeDirection)
        {
            var cacheSettings = new CacheHelper.Settings("ICStars2_0.BusinessLayer.Mvc.Constraints.WebPageConstraint");
            var cache = CacheHelper.GetCache<IEnumerable<string>>(cacheSettings);
            if (cache == null)
            {
                using (var db = new WebDbContext())
                {
                   var urlList =
                        db.WebPages.Select(w => w.Url)
                            .ToList()
                            .Select(url => url.StartsWith("/") ? url.Remove(0, 1) : url);
                    
                    cache = CacheHelper.BuildCache<IEnumerable<string>>(urlList, cacheSettings);
                }
            }
            return
                    cache.Any(
                        c => c.Trim().Equals(values[parameterName].ToString(), StringComparison.InvariantCultureIgnoreCase));
            
        }
    }
}
