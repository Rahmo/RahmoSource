using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.Framework;
using ICStars2_0.Model.Enum;
using Microsoft.Practices.Unity;
namespace ICStars2_0.Components
{
    public static class RolesCheckBoxHelper
    {
        public static string RolesCheckBoxList(string name)
        {
            return RolesCheckBoxList(name, null);
        }

        public static string RolesCheckBoxList(string name, string[] checkedRolesList)
        {
            var sBuilder = new StringBuilder();
            var roleFactory = ICStarsUnityContainer.Current.Resolve<IRoleFactory>();
            var rolelist = roleFactory.CreateRoleCollection(1, 1000).Where(m => m.RoleEnumType == RoleType.Role).Select(m => m.Name);  //Roles.GetAllRoles();
           
            foreach (string role in rolelist)
            {
                string check = "";

                if (checkedRolesList != null && checkedRolesList.Contains(role)) check = "checked=\"checked\"";
                sBuilder.AppendFormat(@"<input type=""checkbox"" value=""{0}"" {2} name=""{1}""/>{0}", role, name, check);
            }
            return sBuilder.ToString();
        }
        public static string MemberTypeCheckBoxList(string name, string[] checkedRolesList)
        {
            var sBuilder = new StringBuilder();
            var roleFactory = ICStarsUnityContainer.Current.Resolve<IRoleFactory>();
            var rolelist = roleFactory.CreateRoleCollection(1, 1000).Where(m => m.RoleEnumType == RoleType.MemberType).Select(m => m.Name);  //Roles.GetAllRoles();
           
            foreach (string role in rolelist)
            {
                string check = "";

                if (checkedRolesList != null && checkedRolesList.Contains(role)) check = "checked=\"checked\"";
                sBuilder.AppendFormat(@"<input type=""checkbox"" value=""{0}"" {2} name=""{1}""/>{0} ", role, name, check);
            }
            return sBuilder.ToString();
        }
    }
}
