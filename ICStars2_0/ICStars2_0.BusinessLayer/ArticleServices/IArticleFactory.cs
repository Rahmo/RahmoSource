using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.BusinessLayer.ArticleServices
{
    public interface IArticleFactory
    {
        IArticleCollection BuildArticles(int pagesize, int pageindex, ArticleCollectionSettings settings = null);
        IArticleCollection BuildEvents(int pagesize, int pageindex, ArticleCollectionSettings settings = null);
       // List<Storyboard> BuildStoryboard();
        IArticleCollection BuildTopArticles(int top, ArticleCollectionSettings settings = null);
        Article BuildArticle(string urlTitle);
        
        Category GetCategory(string urlTitle);
    }
}
