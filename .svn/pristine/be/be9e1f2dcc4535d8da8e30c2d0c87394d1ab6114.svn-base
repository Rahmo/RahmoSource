using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web.Mvc;
using ICStars2_0.BusinessLayer.NavigationServices;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Common;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.Enum;
using log4net;
using Microsoft.Practices.Unity;
using HtmlHelper = System.Web.Mvc.HtmlHelper;

namespace ICStars2_0.BusinessLayer
{
    public static class Extensions
    {

        private static readonly ILog Logger = LogManager.GetLogger(typeof(Extensions));
        public static IEnumerable<SelectListItem> BuildCSSPTermSelectListItems(this HtmlHelper helper)
        {
            var isBindValue = false;
            return Enum.GetValues(typeof(CSSP_TermType)).Cast<Enum>().Where(EnumHelper.GetIsShow).Select
                (
                    e =>
                    new
                    {
                        Text = EnumHelper.GetDescription(e),
                        Value = e.GetHashCode()
                    }).Select(
                            e =>
                            new SelectListItem
                            {
                                Text = e.Text,
                                Value =
                                    isBindValue
                                        ? e.Value.ToString()
                                        : e.Text
                            });
        }
        public static IEnumerable<SelectListItem> BuildQuarterYearSelectListItems(this HtmlHelper helper)
        {
            var steansSettingsFactory =
                ICStarsUnityContainer.Current.Resolve<ISteansSettingsFactory>();

            var settings = steansSettingsFactory.CreateStandardSetings<QuarterListSettings>();
            return settings.QuarterList.Select(q => new SelectListItem {Text = q, Value = q});
        }

        public static MvcHtmlString BuildHeaderNavigation(this HtmlHelper helper)
        {
            return MvcHtmlString.Create(ICStarsUnityContainer.Current.Resolve<INavigationFactory>()
                .BuildRootNavigationNodes().Select(r => r.BuildHtml()).Aggregate((x, y) => x + y));
        }
        public static MvcHtmlString BuildNavigation(this HtmlHelper helper)
        {
            var currentNode = ICStarsUnityContainer.Current.Resolve<INavigationFactory>().BuildCurrrentNavigationNode();
            if (currentNode == null) return MvcHtmlString.Empty;
            try
            {
                var navBuilder = new StringBuilder();
                var n = currentNode;
                while (n != null)
                {
                    var sb = new StringBuilder();
                    sb.AppendLine("<li>");
                    sb.Append("<a");
                    if (!string.IsNullOrEmpty(n.Link))
                    {
                        sb.AppendFormat(" href=\"{0}\"", n.Link);
                    }
                    else
                    {
                        sb.Append(" onclick=\"return false;\"");
                    }
                    sb.AppendFormat(" target=\"{1}\" title=\"{2}\">{0}</a>",
                        n.Name, n.IsTargetBlank ? "_blank" : "_self", n.LinkTitle);
                    sb.AppendLine("</li>");
                    navBuilder.Insert(0, sb.ToString());
                    if (n.Parent ==null)
                    {
                        n = null;
                    }
                    else
                    {
                        navBuilder.Insert(0, "<li><em>></em></li>");
                        n = n.Parent;
                    }
                }
                navBuilder.Insert(0, "<ul>");
                navBuilder.Append("</ul>");
                return MvcHtmlString.Create(navBuilder.ToString());
            }
            catch (Exception exp)
            {
#if DEBUG
                throw;
#endif
                Log4NetHelper.WriteLog(exp.GetBaseException(), Logger);
            }
            return MvcHtmlString.Empty;
        }
//        public static MvcHtmlString BuildNavigation(this HtmlHelper helper, IEnumerable<WebsiteNav> navList,WebsiteNav currentNav)
//        {

//            if (navList == null) return MvcHtmlString.Empty;
//            try
//            {
//                var navBuilder = new StringBuilder();
//                var n = currentNav;
//                while (n != null)
//                {
//                    var sb = new StringBuilder();
//                    sb.AppendLine("<li>");
//                    sb.Append("<a");
//                    if (!string.IsNullOrEmpty(n.Link))
//                    {
//                        sb.AppendFormat(" href=\"{0}\"", n.Link);
//                    }
//                    else
//                    {
//                        sb.Append(" onclick=\"return false;\"");
//                    }
//                    sb.AppendFormat(" target=\"{1}\" title=\"{2}\">{0}</a>",
//                        n.Name, n.IsTargetBlank ? "_blank" : "_self", n.LinkTitle);
//                    sb.AppendLine("</li>");
//                    navBuilder.Insert(0, sb.ToString());
//                    if (n.ParentID == 0)
//                    {
//                        n = null;
//                    }
//                    else
//                    {
//                        navBuilder.Insert(0, "<li><em>></em></li>");
//                        n = navList.FirstOrDefault(nn => nn.ID == n.ParentID);
//                    }
//                }
//                navBuilder.Insert(0, "<ul>");
//                navBuilder.Append("</ul>");
//                return MvcHtmlString.Create(navBuilder.ToString());
//            }
//            catch (Exception exp)
//            {
//#if DEBUG
//                throw;
//#endif
//                Log4NetHelper.WriteLog(exp.GetBaseException(),Logger);
//            }
//            return MvcHtmlString.Empty;
//        }
        //public static MvcHtmlString BuildSubNavs(this HtmlHelper helper, WebsiteNav nav, IEnumerable<WebsiteNav> navList, string rightArrow = "<em>></em>")
        //{

        //    var nodes = navList.Where(n => n.ParentID == nav.ID);
        //    if (!nodes.Any()) return MvcHtmlString.Empty;
        //    var sb = new StringBuilder();
        //    sb.Append("<ul>");

        //    foreach (WebsiteNav n in nodes)
        //    {
        //        sb.AppendLine("<li>");
        //        sb.Append("<a");
        //        if (!string.IsNullOrEmpty(n.Link))
        //        {
        //            sb.AppendFormat(" href=\"{0}\"", n.Link);
        //        }
        //        else
        //        {
        //            sb.Append(" onclick=\"return false;\"");
        //        }
        //        sb.AppendFormat(" target=\"{1}\" title=\"{2}\">{0}</a>",
        //            n.Name, n.IsTargetBlank ? "_blank" : "_self",n.LinkTitle);
        //        //递归
        //        var subnavs = BuildSubNavs(helper, n, navList,rightArrow);
        //        if (!MvcHtmlString.IsNullOrEmpty(subnavs))
        //        {
        //            sb.AppendFormat("{1}{0}", subnavs,rightArrow);
        //        }
        //        sb.AppendLine("</li>");
        //    }
        //    sb.Append("</ul>");
        //    return MvcHtmlString.Create(sb.ToString());
        //}
    }
}
