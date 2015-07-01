using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.Common;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Account
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        private IMemberFactory _memberFactory;

        [Dependency]
        public IMemberFactory MemberFactory
        {
            get { return _memberFactory; }
            set { _memberFactory = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //// ChangePassword will throw an exception rather
            //// than return false in certain failure scenarios.
            //bool changePasswordSucceeded;
            //try
            //{
            //    if(string.IsNullOrEmpty(txtOldPassword.Text))
            //    {
            //        ltlError.Text = "The Current password field is required.";
            //        return;
            //    }
            //    if (string.IsNullOrEmpty(txtNewPassword.Text))
            //    {
            //        ltlError.Text = "The New password field is required.";
            //        return;
            //    }
            //    var password = MathHelper.Md5(txtOldPassword.Text);
            //    var m = MemberFactory.Create(User.Identity.Name);
            //    if (!password.Equals(m.Password, StringComparison.CurrentCultureIgnoreCase))
            //    {
            //        ltlError.Text = "The current password is incorrect.";
            //        return;
            //    }
            //    if(!txtNewPassword.Text.Equals(txtConfirmPassword.Text))
            //    {
            //        ltlError.Text = "The new password and confirmation password do not match.";
            //        return;
            //    }
            //    changePasswordSucceeded = MemberFactory.ChangePassword(User.Identity.Name, txtNewPassword.Text);
            //}
            //catch (Exception)
            //{
            //    changePasswordSucceeded = false;
            //}

            //if (changePasswordSucceeded)
            //{
            //    Response.Redirect(string.Format("{0}/Account/ChangePasswordSuccess.htm", Config.SHTrackerRoot));
            //}
            //ltlError.Text = "Error, please retry.";

        }
    }
}