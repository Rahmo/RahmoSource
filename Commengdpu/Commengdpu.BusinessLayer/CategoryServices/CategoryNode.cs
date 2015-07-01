using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using ICStars2_0.Common;
using ICStars2_0.Common.Reflection;

namespace Commengdpu.BusinessLayer.CategoryServices
{
    public class CategoryNode : Category
    {
        public bool IsChecked { get; set; }
        public int ImpactAmount { get; set; }
        public List<CategoryNode> Children { get; set; }
        public CategoryNode Parent { get; set; }

        public CategoryNode(Category category, CategoryNode parent = null)
        {
            ReflectionHelper.Fill(category, this);
            Parent = parent;
        }
        public CategoryNode Find(int id)
        {
            return Find(id, this);
        }

        private static CategoryNode Find(int id, CategoryNode node)
        {
            if (node.ID == id) return node;
            return node.Children != null ? node.Children.Select(child => Find(id, child)).FirstOrDefault(subnode => subnode != null) : null;
        }

        public string BuildHtml(string rightArrow = "",bool isShowOperationButtion=false, bool isShowCheckbox = false,bool isShowImpactAmount=false,bool isBindingNames=false,Func<string,string> bindingLinksFunc =null)
        {
            var sb = new StringBuilder();
            sb.AppendLine("<li>");
            if (isShowCheckbox)
            {
                sb.AppendFormat("<input type=\"checkbox\" name=\"categories\" value=\"{0}\" {1} />",
                    isBindingNames ? Name : ID.ToString(),
                    IsChecked ? "checked=\"checked\"" : "");
            }
            sb.AppendFormat("<a id=\"{0}\"", this.ID);
            if (bindingLinksFunc != null)
            {
                sb.AppendFormat(" href=\"{0}\"", bindingLinksFunc(Name));
            }
            else
            {
                sb.Append(" onclick=\"return false;\"");
            }

            sb.AppendFormat(" title=\"{0}\">{0}</a>",
                Name);
            if (isShowOperationButtion)
            {
                sb.AppendFormat("<em><a href=\"edit/{0}\">edit</a><a href=\"delete/{0}\">delete</a></em>", ID);
            }
            if (isShowImpactAmount)
            {
                sb.AppendFormat("&nbsp;&nbsp;<i>Impact Amount:</i> <input type=\"number\" value=\"{1}\"/><input type=\"hidden\" name=\"categoryImpactAmounts\" value=\"{0}_{1}\" />", ID, ImpactAmount);
            }
            if (Children != null)
            {
                sb.Append(rightArrow);
                sb.Append("<ul>");
                foreach (var n in Children)
                {
                    sb.Append(n.BuildHtml(rightArrow, isShowOperationButtion, isShowCheckbox, isShowImpactAmount,isBindingNames,bindingLinksFunc));
                }
                sb.Append("</ul>");
            }
            sb.AppendLine("</li>");
            return sb.ToString();
        }

        public IEnumerable<CategoryNode> BuildNodesForDropDown(int level = 0)
        {
            for (int j = 0; j < level; j++)
            {
                this.Name = "|--" + this.Name;
            }
            level++;
            var nodes = new List<CategoryNode> { this };
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
