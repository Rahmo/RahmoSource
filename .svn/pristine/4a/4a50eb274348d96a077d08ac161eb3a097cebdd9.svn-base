using System.Web.Mvc;
using System.Web.Routing;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.ArticleServices;
using ICStars2_0.BusinessLayer.NavigationServices;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Controllers
{
    public class HomeController : Controller
    {
        [Dependency]
        public INavigationFactory NavigationFactory { get; set; }

        [Dependency]
        public IArticleFactory ArticleFactory { get; set; }

        public ActionResult Default()
        {
           ViewBag.News = ArticleFactory.BuildTopArticles(5, new ArticleCollectionSettings(){CategoryName="News",IsVisible=true});

           ViewBag.Stories = ArticleFactory.BuildTopArticles(3, new ArticleCollectionSettings() { CategoryName = "Story", IsVisible = true });
            return View();
        }
        public ActionResult Index()
        {
            return View();
        } 
        [OutputCache(Duration=3600,VaryByParam="none")]
        public ActionResult NavsForLayout()
        {
            return View(NavigationFactory.BuildWebsiteNavList());
        }
    }
}