using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Web;
using System.Web.Caching;
using ICStars2_0.Common;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;

namespace ICStars2_0.BusinessLayer.NavigationServices
{
    class NavigationFactory : INavigationFactory, IWeakReferenceRegister
    {
        public IEnumerable<WebsiteNav> BuildWebsiteNavList()
        {
            var cacheSettings = new CacheHelper.Settings("ICStars2_0.BusinessLayer.NavigationServices.NavigationFactory.BuildNavigations");
            var cache = CacheHelper.GetCache<IEnumerable<WebsiteNav>>(cacheSettings);
            if (cache != null)
            {
                return cache;
            }
            using (var db = new WebDbContext())
            {
                var list = db.WebsiteNavProfiles.Select(
                            nav => new { nav ,HasWebpage = db.WebPages.Any(p => p.Url.Equals(nav.Link)) }).ToList()
                            .Select(n =>
                            {
                                n.nav.HasWebpage = n.HasWebpage;
                               
                                return n.nav;
                            }).ToList().OrderBy(n => n.OrderByID);
                CacheHelper.BuildCache<IEnumerable<WebsiteNav>>(list, cacheSettings);
                return list;
            }
        }

        public IEnumerable<NavigationNode> BuildRootNavigationNodes()
        {
            var cacheSettings =
                new CacheHelper.Settings(
                    "ICStars2_0.BusinessLayer.NavigationServices.NavigationFactory.BuildRootNavigationNodes");
            var cache = CacheHelper.GetCache<IEnumerable<NavigationNode>>(cacheSettings);
            if (cache != null)
            {
                return cache;
            }

            var list = BuildWebsiteNavList();
            var result =
                list.Where(n => n.ParentID == 0).Select(n => BuildNavigationNodes(new NavigationNode(n), list));

            CacheHelper.BuildCache(result, cacheSettings);
            return result;


        }

        public NavigationNode BuildCurrrentNavigationNode()
        {
            return BuildCurrrentNavigationNode(HttpContext.Current.Request.Url.AbsolutePath);
        }

        public NavigationNode BuildCurrrentNavigationNode(string absoluteUrl)
        {
            return BuildRootNavigationNodes().Select(n => n.Find(absoluteUrl)).FirstOrDefault(n=>n!=null);
            //var list = BuildWebsiteNavList();
            //var rootnode =
            //    new NavigationNode(list.SingleOrDefault(n => !string.IsNullOrEmpty(n.Link) && n.Link.Equals(absoluteUrl)))
            //    {
            //        Children = new List<NavigationNode>()
            //    };
            //rootnode.Children.AddRange(
            //    list.Where(n => n.ParentID == 0).Select(n => BuildNavigationNodes(new NavigationNode(n,rootnode), list)));

            //return rootnode;

        }
        public NavigationNode BuildRootNavigationNode()
        {
            return BuildRootNavigationNode(HttpContext.Current.Request.Url.AbsolutePath);
        }
        public NavigationNode BuildRootNavigationNode(string absoluteUrl)
        {
            var currentNode = BuildCurrrentNavigationNode(absoluteUrl);
            if (currentNode == null) return null;
            var rootnode = currentNode;
            while (rootnode.Parent != null)
            {
                rootnode = rootnode.Parent;
            }
            return rootnode;
            //var list = BuildWebsiteNavList();
            //var currentNav = list.SingleOrDefault(n => !string.IsNullOrEmpty(n.Link) && n.Link.Equals(absoluteUrl));
            //if (currentNav == null) return null;
            //var rootNav = currentNav;
            //while (rootNav != null && rootNav.ParentID > 0)
            //{
            //    rootNav = list.SingleOrDefault(n => n.ID == rootNav.ParentID);
            //}
            //var rootnode =
            //    new NavigationNode(rootNav)
            //    {
            //        Children = new List<NavigationNode>()
            //    };
            //rootnode.Children.AddRange(
            //    list.Where(n => n.ParentID == rootNav.ID)
            //        .Select(n => BuildNavigationNodes(new NavigationNode(n, rootnode), list)));

            //return rootnode;

        }

        private NavigationNode BuildNavigationNodes(NavigationNode nav, IEnumerable<WebsiteNav> list)
        {
            if (nav == null) return nav;
            var children = list.Where(n => n.ParentID == nav.ID);
            if (!children.Any()) return nav;
            if (nav.Children == null)
            {
                nav.Children=new List<NavigationNode>();
            }
            nav.Children.AddRange(children.Select(n => new NavigationNode(n, nav)));
            for (int i = 0; i < nav.Children.Count; i++)
            {
                nav.Children[i] = BuildNavigationNodes(nav.Children[i], list);
            }
            return nav;
        }
    }
}
