using System.Web.Mvc;
using System.Web.Mvc.Html;

namespace ICStars2_0.Mvc
{
    public static class ActionLinkHelper
    {
        public static MvcHtmlString ActionImageLink(this HtmlHelper helper, string imageText, string actionName)
        {
            return ActionImageLink(helper, imageText, actionName, null, null, null);
        }
        public static MvcHtmlString ActionImageLink(this HtmlHelper helper, string imageText, string actionName, object routeValues)
        {
            return ActionImageLink(helper, imageText, actionName, null, routeValues, null);
        }
        public static MvcHtmlString ActionImageLink(this HtmlHelper helper, string imageText, string actionName, object routeValues, object htmlAttributes)
        {
            return ActionImageLink(helper, imageText, actionName,null, routeValues, htmlAttributes);
        }

        public static MvcHtmlString ActionImageLink(this HtmlHelper helper, string imageText, string actionName, string controllerName, object routeValues, object htmlAttributes)
        {
            var link = helper.ActionLink("[replaceme]", actionName, controllerName, routeValues, htmlAttributes);
            return MvcHtmlString.Create(link.ToString().Replace("[replaceme]", imageText));
        }

    }
}
