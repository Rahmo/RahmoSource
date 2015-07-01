using System.Collections.Generic;
using System.Web;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.NavigationServices
{
    public interface INavigationFactory
    {
        IEnumerable<WebsiteNav> BuildWebsiteNavList();
        IEnumerable<NavigationNode> BuildRootNavigationNodes();
        NavigationNode BuildCurrrentNavigationNode();
        NavigationNode BuildCurrrentNavigationNode(string absoluteUrl);
        NavigationNode BuildRootNavigationNode();
        NavigationNode BuildRootNavigationNode(string absoluteUrl);
    }
}