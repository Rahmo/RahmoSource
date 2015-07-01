using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.Login;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Account
{
    public partial class Logout : System.Web.UI.Page
    {
        private ILogin _login;

        [Dependency]
        public ILogin LoginEvent
        {
            get { return _login; }
            set { _login = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            var evt = new LoginEventArgs(){Domain=Config.Domain};
            LoginEvent.Logout(evt);

            //if (string.IsNullOrEmpty(Request.QueryString["ReturnUrl"]) == false)
            //{
            //    Response.Redirect(string.Format("{1}/Account/Login.aspx?ReturnUrl={0}", Request.QueryString["ReturnUrl"], Config.SHTrackerRoot));
            //}
            Response.Redirect(string.Format("{0}/Account/Login.aspx", Config.SHTrackerRoot));
        }
    }
}