using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;

namespace ICStars2_0.Components
{

    public static class TreeViewHelper
    {
        public static string TreeView(string[] roles,string provider)
        {
            return BuildNode(SiteMap.Providers[provider].RootNode, roles);
        }

        /// <summary>
        /// 生成后台菜单树HTML
        /// </summary>
        /// <param name="roles">用户角色数组</param>
        /// <returns>特定于用户角色的菜单树HTML</returns>
        public static string TreeView(string[] roles)
        {
            return BuildNode(SiteMap.RootNode, roles);
        }
        ///// <summary>
        ///// 根据SITEMAP节点的TITLE生成后台菜单树HTML
        ///// </summary>
        ///// <param name="helper">待扩展的HtmlHelper</param>
        ///// <param name="roles">用户角色数组</param>
        ///// <param name="siteMapTitle">SiteMap节点Title</param>
        ///// <returns></returns>
        //public static string TreeView(string[] roles, string siteMapTitle)
        //{
        //    return BuildNode(SiteMap.RootNode.ChildNodes.Cast<SiteMapNode>().Where(
        //        n => n.Title.Equals(siteMapTitle)).First(), roles);
        //}
        private static string BuildNode(SiteMapNode childnode, string[] roles)
        {
            var nodes = childnode.ChildNodes;
            if (nodes.Count == 0) return string.Empty;
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
                    sb.AppendFormat(" target=\"right\" title=\"{0}\">{0}</a>",
                                    HttpContext.Current.Server.HtmlEncode(n.Title));
                    //递归
                    sb.Append(BuildNode(n, roles));
                    sb.AppendLine("</li>");
                }
            }
            sb.Append("</ul>");
            return sb.ToString();
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
