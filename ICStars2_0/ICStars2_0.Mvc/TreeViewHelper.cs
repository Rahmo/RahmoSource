using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Mvc;

namespace ICStars2_0.Mvc
{
    public enum TreeViewTarget
    {
        Self,
        Right
    }
    public static class TreeViewHelper
    {
        /// <summary>
        /// 生成后台菜单树HTML
        /// </summary>
        /// <param name="helper">待扩展的HtmlHelper</param>
        /// <param name="roles">用户角色数组</param>
        /// <returns>特定于用户角色的菜单树HTML</returns>
        public static MvcHtmlString TreeView(this HtmlHelper helper, string[] roles,
            TreeViewTarget target = TreeViewTarget.Right)
        {
            return BuildNode(SiteMap.RootNode, helper, roles, target);
        }

        /// <summary>
        /// 根据SITEMAP节点的TITLE生成后台菜单树HTML
        /// </summary>
        /// <param name="helper">待扩展的HtmlHelper</param>
        /// <param name="roles">用户角色数组</param>
        /// <param name="siteMapTitle">SiteMap节点Title</param>
        /// <returns></returns>
        public static MvcHtmlString TreeView(this HtmlHelper helper, string[] roles, string siteMapTitle)
        {
            return BuildNode(SiteMap.RootNode.ChildNodes.Cast<SiteMapNode>().Where(
                n => n.Title.Equals(siteMapTitle)).First(), helper, roles);
        }
        private static MvcHtmlString BuildNode(SiteMapNode childnode, HtmlHelper helper, string[] roles, TreeViewTarget target = TreeViewTarget.Right)
        {
            var nodes = childnode.ChildNodes;
            if (nodes.Count == 0) return MvcHtmlString.Empty;
            var sb = new StringBuilder();
            sb.Append("<ul>");

            foreach (SiteMapNode n in nodes)
            {
                if (IsNodeInRoles(n, roles))
                {
                    sb.AppendLine("<li>");
                    sb.Append("<a");
                    if (!string.IsNullOrEmpty(n.Url))
                    {
                        sb.AppendFormat(" href=\"{0}\"", n.Url);
                    }
                    else
                    {
                        sb.Append(" onclick=\"return false;\"");
                    }
                    sb.AppendFormat(" target=\"{1}\" title=\"{0}\">{0}</a>",
                        helper.Encode(n.Title), target == TreeViewTarget.Right ? "right" : "_self");
                    //递归
                    sb.Append(BuildNode(n, helper, roles, target));
                    sb.AppendLine("</li>");
                }
            }
            sb.Append("</ul>");
            return MvcHtmlString.Create(sb.ToString());
        }
        public static bool IsNodeInRoles(SiteMapNode node, string[] roles)
        {
            if (IsInRoles(node.Roles, roles))
            {
                return true;
            }
            if (node.ChildNodes.Count <= 0)
            {
                return false;
            }
            return node.ChildNodes.Cast<SiteMapNode>().Any(n => IsNodeInRoles(n, roles));
            var childNodes = node.ChildNodes.Cast<SiteMapNode>();
            var result = childNodes.SelectMany(n => n.Roles.Cast<IEnumerable>()).Any(
                r => roles.Contains(r));

            return result;
            #region =用lambda表达式替代=

            //foreach (SiteMapNode nodeRole in node.ChildNodes)
            //{
            //    foreach (string role in roles)
            //    {
            //        foreach (string nodeRole1 in nodeRole.Roles)
            //            if (nodeRole1.Equals(role))
            //            {
            //                return true;
            //            }
            //    }
            //}
            //return false;
            #endregion
        }


        private static bool IsInRoles(IList nodeRoles, IEnumerable<string> roles)
        {
            foreach (string role in nodeRoles)
            {
                if (role.Equals("*")) return true;
                if (roles.Contains("*")) return true;
                if (roles.Contains(role)) return true;
            }
            return false;
        }

    }
}
