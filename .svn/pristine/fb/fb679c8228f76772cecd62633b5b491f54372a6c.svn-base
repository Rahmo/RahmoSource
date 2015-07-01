using System.Linq;
using System.Text;
using System.Web.Mvc;
using System.Web.Security;

namespace ICStars2_0.Mvc
{
    public static class RolesCheckBoxHelper
    {
        public static string RolesCheckBoxList(this HtmlHelper helper, string name)
        {
            return RolesCheckBoxList(helper, name, null);
        }

        public static string RolesCheckBoxList(this HtmlHelper helper, string name,string[] checkedRolesList)
        {
            StringBuilder sBuilder = new StringBuilder();
            string[] rolelist = Roles.GetAllRoles();
            //检查是否有可绑定值
            if (helper.ViewData[name] != null)
            {
                checkedRolesList = (string[])helper.ViewData[name];
            }
            foreach (string role in rolelist)
            {
                string check = "";

                if (checkedRolesList != null && checkedRolesList.Contains(role)) check = "checked=\"checked\"";
                sBuilder.AppendFormat(@"<input type=""checkbox"" value=""{0}"" {2} name=""{1}""/>{0}", role, name, check);
            }
            return sBuilder.ToString();
        }
    }
}
