using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.NavigationServices
{
    public class NavigationNode:WebsiteNav
    {
        public List<NavigationNode> Children { get; set; }
        public NavigationNode Parent { get; set; }

        public NavigationNode(WebsiteNav nav, NavigationNode parent = null)
        {
            ReflectionHelper.Fill(nav, this);
            Parent = parent;
        }

        public NavigationNode Find(string absoluteUrl)
        {
            return Find(absoluteUrl, this);
        }
        private static NavigationNode Find(string absoluteUrl, NavigationNode node)
        {
            if (node.Link.Equals(absoluteUrl,StringComparison.CurrentCultureIgnoreCase)) return node;
            return node.Children != null ? node.Children.Select(child => Find(absoluteUrl, child)).FirstOrDefault(subnode => subnode != null) : null;
        }
        public NavigationNode Find(int id)
        {
            return Find(id, this);
        }

        private static NavigationNode Find(int id, NavigationNode node)
        {
            if (node.ID == id) return node;
            return node.Children != null ? node.Children.Select(child => Find(id, child)).FirstOrDefault(subnode => subnode != null) : null;
        }
        public string BuildHtml(string rightArrow = "<em>></em>")
        {
         
            if (!IsVisible) return string.Empty;
            var sb = new StringBuilder();
            sb.AppendLine("<li>");
            sb.Append("<a");

            
            if (!string.IsNullOrEmpty(Link))
            {
                sb.AppendFormat(" href=\"{0}\"", Link);
            }
            else
            {
                sb.Append(" onclick=\"return false;\"");
            }
            sb.AppendFormat(" target=\"{1}\" title=\"{2}\">{0}</a>",
                Name, IsTargetBlank ? "_blank" : "_self", LinkTitle);
            if (Children != null && Children.Count(n=>n.IsVisible) > 0)
            {
                sb.Append(rightArrow);
                sb.Append("<ul class'dropdown-menu'>");
                foreach (var n in Children)
                {
                    sb.Append(n.BuildHtml(rightArrow));
                }
                sb.Append("</ul>");
            }
            sb.AppendLine("</li>");
            return sb.ToString();
        }


        //public string BuildHtmlforVerticalMenu(string rightArrow = "<em>></em>")
        //{
        //    var o = OrderByID.ToString();
        //    if (!IsVisible) return string.Empty;
        //    var sb = new StringBuilder();
        //    sb.AppendLine("<li>");
        //    sb.Append("<a");


        //    if (!string.IsNullOrEmpty(LinkTitle))
        //    {

        //        string str = LinkTitle.Substring(0, LinkTitle.Length/2);
        //        string tagId = str.Replace(" ", string.Empty);
        //        sb.AppendFormat(" href=#{0}", tagId );
        //    }
        
        //    if (!string.IsNullOrEmpty((Link)))
        //    {
        //        if (Link == "1")
        //        {
        //            sb.AppendFormat(" class='active' " );
        //        }
               
        //    }
        

        //    sb.AppendFormat("  title=\"{2}\">{0}</a>",
        //        Name, LinkTitle);
      
        //    sb.AppendLine("</li>");
        //    return sb.ToString();
        //}


        public IEnumerable<NavigationNode> BuildNodesForDropDown(int level=0)
        {
            for (int j = 0; j < level; j++)
            {
                this.Name = "|--" + this.Name;
            }
            level++;
            var nodes = new List<NavigationNode> {this};
            if (Children == null) return nodes;
            foreach (var n in Children)
            {
                var childNodes = n.BuildNodesForDropDown(level);
                if (childNodes != null)
                {
                    nodes.AddRange(childNodes);
                }
            }
            return nodes;
        } 
    }
}
