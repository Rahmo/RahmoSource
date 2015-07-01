using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer.ArticleServices;
using ICStars2_0.BusinessLayer.NavigationServices;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Controllers
{
    public class PublicationController : Controller
    {
        [Dependency]
        public IArticleFactory ArticleFactory { get; set; }

        [Dependency]
        public INavigationFactory NavigationFactory { get; set; }
        public ActionResult Index(string id)
        {
            var category = ArticleFactory.GetCategory(id);
            if (!category.Name.Equals(RouteData.Values["root"].ToString(),StringComparison.InvariantCultureIgnoreCase))
            {
                return HttpNotFound();
            }
            var art = ArticleFactory.BuildArticle(id);
            if (art == null) return HttpNotFound();
            #region =If Redirect=

            if (!string.IsNullOrEmpty(art.RedirectUrl))
            {
                return Redirect(art.RedirectUrl);
            }
            if (!string.IsNullOrEmpty(art.Redirect301Url))
            {
                return RedirectPermanent(art.Redirect301Url);
            }
            #endregion

            BuildNavsForViewBag(Url.Action(category.Name));
            return View("Article", art);

        }

        #region =Particular Pages=

        private void BuildNavsForViewBag(string currentUrl)
        {
            #region =Navigation=

            var navs = NavigationFactory.BuildWebsiteNavList();
            //For _layout2 and SubNavsForLayout
            ViewBag.Navs = navs;
            var currentNav = navs.FirstOrDefault(n => !string.IsNullOrEmpty(n.Link) && n.Link.Equals(currentUrl));
            //For _layout2
            ViewBag.CurrentNav = currentNav;
            var rootNav = currentNav;
            while (rootNav != null && rootNav.ParentID > 0)
            {
                rootNav = navs.FirstOrDefault(n => n.ID == rootNav.ParentID);
            }
            //For SubNavsForLayout
            ViewBag.RootNav = rootNav;
            #endregion

        }
        public ActionResult News(int page=1)
        {
            BuildNavsForViewBag(Url.Action("News", new {page = 1}));//We only need the url without page parameter to build navs, so set page=1;otherwise with page parameter, lose navs.
            return View(ArticleFactory.BuildArticles(10, page, new ArticleCollectionSettings() { CategoryName = "News" }));
        }
        public ActionResult Story(int page=1)
        {
            BuildNavsForViewBag(Url.Action("Story", new { page = 1 }));//We only need the url without page parameter to build navs, so set page=1;otherwise with page parameter, lose navs.
            return View(ArticleFactory.BuildArticles(10, page, new ArticleCollectionSettings() { CategoryName = "Story" }));
        }
        #endregion

    }
}
