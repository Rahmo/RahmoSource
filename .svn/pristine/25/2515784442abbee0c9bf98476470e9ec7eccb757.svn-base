using System;
using System.Web.Security;
using CampusConnect.MediatorLibrary;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Account
{
    public partial class Register : System.Web.UI.Page
    {
        [Dependency]
        public IMemberFactory MemberFactory { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Account/Register");
            return;

#if !DEBUG
            if(MemberFactory.Exists(txtCampusConnectID.Text.Trim())){
                ltlError.Text = txtCampusConnectID.Text.Trim()+"is already in use!";
            return;
            }
            ICampusConnectMediator mediator = CampusConnectFactory.CreateCampusConnectMediaor();
           string emplId = mediator.GetEmplId(txtCampusConnectID.Text.Trim(), txtPWD.Text.Trim());

            if (emplId.Equals("False"))
            {
                ltlError.Text = "CampusConnect ID or passowrd is not correct!";
                return;
            }
            
            
#endif
            Member user=new Member();
            user.CampusConnectID = txtCampusConnectID.Text.Trim();
            user.EmplID = txtEmplId.Text.Trim();
            user.FirstName = txtFirstname.Text.Trim();
            user.LastName = txtLastName.Text.Trim();
            user.Email = txtEmail.Text.Trim();
            user.Department = txtDepartment.Text.Trim();
            user.Location = txtLocation.Text.Trim();
            user.JobTitle = txtJobTitle.Text.Trim();
            user.OfficePhone = txtOfficePhone.Text.Trim().Replace("-","");
            user.Fax = txtFax.Text.Trim().Replace("-", ""); ;
            user.SupervisorFirstName = txtSupervisorFirstName.Text.Trim();
            user.SupervisorLastName = txtSupervisorLastName.Text.Trim();
            user.SupervisorEmail = txtSupervisorEmail.Text.Trim();
            int userid = MemberFactory.Update(user).ID;
            if(userid==0)
            {
                ltlError.Text = "Failed to create new user! Please contact the administrator. ";
                return;
            }
            Roles.AddUserToRole(user.CampusConnectID, "SteansWeb");
            Response.Redirect("/Account/RegisterSuccessful.html");
        }
    }
}