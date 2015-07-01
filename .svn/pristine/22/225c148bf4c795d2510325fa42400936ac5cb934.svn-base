using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.Common;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Steans.Account
{
    [Authorize(Roles = "admin_steans,admin_steans_account")]
    public partial class EditMember : System.Web.UI.Page
    {

        [Dependency]
        public IMemberFactory MemberFactory { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                int id = 0;
                int.TryParse(Request.QueryString["id"], out id);
                Member m = MemberFactory.Create(id);
                txtUserName.Text = m.CampusConnectID;
                hdfUserName.Value = m.CampusConnectID;
                txtFirstName.Text = m.FirstName;
                txtLastName.Text = m.LastName;
                txtEmail.Text = m.Email;
                cbxStatus.Checked = m.Status;
                /*Steans*/
                txtEmplID.Text = m.EmplID;
                txtDepartment.Text = m.Department;
                txtLocation.Text = m.Location;
                txtJobTitle.Text = m.JobTitle;
                txtOfficePhone.Text = m.OfficePhone;
                txtFax.Text = m.Fax;
                txtSupervisorFirstName.Text = m.SupervisorFirstName;
                txtSupervisorLastName.Text = m.SupervisorLastName;
                txtSupervisorEmail.Text = m.SupervisorEmail;

                /*Steans end*/
            }
        }

        public string[] GetNewRole(string roles)
        {
            string[] roleslist = null;
            if (!string.IsNullOrEmpty(roles))
            {
                if (roles.IndexOf(',') > -1)
                {
                    roleslist = roles.Split(',');
                }
                else
                {
                    roleslist = new string[] { roles };
                }
            }
            else
            {
                roleslist = new string[0];
            }
            return roleslist;
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            int id = 0;
            int.TryParse(Request.QueryString["id"], out id);
            Member m = MemberFactory.Create(id);
            m.CampusConnectID = txtUserName.Text.Trim();
            m.FirstName = txtFirstName.Text.Trim();
            m.LastName = txtLastName.Text.Trim();
            m.Email = txtEmail.Text.Trim();
            m.Status = cbxStatus.Checked;
            /*Steans*/
            m.EmplID = txtEmplID.Text.Trim();
            m.Department = txtDepartment.Text.Trim();
            m.Location = txtLocation.Text.Trim();
            m.JobTitle = txtJobTitle.Text.Trim();
            m.OfficePhone = txtOfficePhone.Text.Trim();
            m.Fax = txtFax.Text.Trim();
            m.SupervisorFirstName = txtSupervisorFirstName.Text.Trim();
            m.SupervisorLastName = txtSupervisorLastName.Text.Trim();
            m.SupervisorEmail = txtSupervisorEmail.Text.Trim();
            /*Steans End*/
            m.IP = BrowserInfo.GetIp();
            if (m.ID == 0)
            {
                m.LastLoginDate = DateTime.Now;
                m.RegisterDate = DateTime.Now;
            }


            MemberFactory.Update(m);
            try
            {
                //original user roles
                string[] userRoles = Roles.GetRolesForUser(m.CampusConnectID);
                //new user roles 
                string[] newRolesList = GetNewRole(Request.Form["roles"]);

                #region Roles Operation

                if (userRoles.IsEquals(newRolesList) == false)
                {
                    //if new user roles is empty
                    if (newRolesList != null && newRolesList.Length > 0)
                    {
                        var newRoles = newRolesList.Except(userRoles);
                        var rolesForDelete = userRoles.Except(newRolesList);

                        #region Add

                        if (newRoles.Count() > 0)
                        {
                            Roles.AddUserToRoles(m.CampusConnectID, newRoles.ToArray());
                        }

                        #endregion

                        #region Deleted

                        if (rolesForDelete.Count() > 0)
                        {
                            Roles.RemoveUserFromRoles(m.CampusConnectID, rolesForDelete.ToArray());
                        }

                        #endregion

                    }
                    else
                    {
                        Roles.RemoveUserFromRoles(m.CampusConnectID, newRolesList);
                    }
                }

                #endregion
            }
            catch (Exception exp)
            {
                MemberFactory.Delete(m.ID);
                throw (exp);
            }

            Response.Redirect("MemberList.aspx");
        }
    }
}