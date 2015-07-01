using System;
using System.Web;
using System.Web.Security;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.Login;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.Common;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Account
{
    public partial class Login : System.Web.UI.Page
    {
        private ILogin _login;

        [Dependency]
        public ILogin LoginEvent
        {
            get { return _login; }
            set { _login = value; }
        }
        private IRoleFactory _roleFactory;

        [Dependency]
        public IRoleFactory RoleFactory
        {
            get { return _roleFactory; }
            set { _roleFactory = value; }
        }

        private IMemberFactory _memberFactory;

        [Dependency]
        public IMemberFactory MemberFactory
        {
            get { return _memberFactory; }
            set { _memberFactory = value; }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (Request.IsAuthenticated)
            //{
            //    var returnUrl = Request.QueryString["ReturnUrl"];
            //    if (string.IsNullOrEmpty(returnUrl) == false)
            //    {
            //        if (User.IsInRole("Student") &&
            //            returnUrl.IndexOf("/shtracker/studentapp", StringComparison.InvariantCultureIgnoreCase) < 0)
            //        {
            //            Response.Redirect("/SHTracker/StudentApp");
            //        }
            //        if (!User.IsInRole("Student") &&
            //            returnUrl.IndexOf("/shtracker/studentapp", StringComparison.InvariantCultureIgnoreCase) < 0)
            //        {
            //            Response.Redirect(returnUrl);
            //        }
            //        //Response.Redirect(returnUrl);
            //    }
            //    //Response.Redirect(Config.SHTrackerRoot);
            //}
        }
        protected void btnSubmit_Click(object sender,EventArgs e)
        {
            string username = txtUserName.Text.Trim();
            string password = txtPWD.Text.Trim();
                if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
                {
                    ltlError.Text = "username or password can not be empty!";
                    return;
                }
            if (!cbxStudentLogin.Checked)
            {
                if (!MemberFactory.Exists(username))
                {
                    ltlError.Text = "Username is not valid!";
                    return;
                }
                if (MemberFactory.IsLocked(username))
                {
                    ltlError.Text = "Your account is locked, please contact with the administrator";
                    return;
                }
            }
            LoginEventArgs ea = new LoginEventArgs{ CampusConnectID = username, Password = password, Domain = Config.Domain, QuarterYear = Request.Form["ddlQuarterYear"] };
            ea.Roles = cbxStudentLogin.Checked ? "Student" : string.Empty;
            var result = cbxStudentLogin.Checked ? LoginEvent.LoginStudent(ea) : LoginEvent.Login(ea);
                if (result)
                {
                    if (cbxStudentLogin.Checked)
                    {
                        Response.Redirect("/SHTracker/StudentApp");
                    }
                    string returnUrl = Request.QueryString["ReturnUrl"];

                    if (string.IsNullOrEmpty(returnUrl) == false
                        && returnUrl.IndexOf("/shtracker", StringComparison.InvariantCultureIgnoreCase) < 0)
                    {
                        Response.Redirect(returnUrl);
                    }
                    Response.Redirect(Config.SHTrackerRoot);
                }
                ltlError.Text = "Login failed";
            
        }
    }
}