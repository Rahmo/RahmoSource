using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model;
using ICStars2_0.Model.Enum;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Account
{
    [Authorize(Roles = "admin,admin_account")]
    public partial class RoleManagement : System.Web.UI.Page
    {
        private IRoleFactory _roleFactory;

        [Dependency]
        public IRoleFactory RoleFactory
        {
            get { return _roleFactory; }
            set { _roleFactory = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            IRoleCollection rc=  RoleFactory.CreateRoleCollection(1, 1000);
            rptRole.DataSource = rc.Where(m => m.RoleEnumType == RoleType.Role);
            rptRole.DataBind();
            rptMemberType.DataSource = rc.Where(m => m.RoleEnumType == RoleType.MemberType);
            rptMemberType.DataBind();
        }
        protected void DeleteRole_Click(object sender, EventArgs e)
        {
            int id = 0;
            int.TryParse(((LinkButton) sender).CommandArgument, out id);
            RoleFactory.Delete(id);
            Response.Redirect(Request.Url.ToString());
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtName.Text.Trim()))
            {
                ltlError.Text = "Role name can not be empty!";
            }
            else
            {
                if (!Roles.RoleExists(txtName.Text.Trim()))
                {
                    Model.Role role = new Role();
                    role.Name = txtName.Text.Trim();
                    
                    role.RoleType = Request.Form["RoleType"];
                    RoleFactory.Update(role);
                    Response.Redirect(Request.Url.ToString());
                }
                else
                {
                    ltlError.Text = "Role name is already exist!";
                    
                }
            }
        }
    }
}