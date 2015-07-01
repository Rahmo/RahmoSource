using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Steans.Account
{
    [Authorize(Roles = "admin_steans,admin_steans_account")]
    public partial class UnverifiedMemberList : System.Web.UI.Page
    {
        private IMemberFactory _memberFactory;

        [Dependency]
        public IMemberFactory MemberFactory
        {
            get { return _memberFactory; }
            set { _memberFactory = value; }
        }

        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            rptList.DataSource = MemberFactory.CreateMemberCollection(1, 1000,
                                                                      new MemberCollectionSettings { MemberRoles = new[] { "Steans", "SteansWeb" }, IsUnverified = true });
            rptList.DataBind();

        }
        protected void lbtDeleteMember_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            MemberFactory.Delete(id);
            Response.Redirect("UnverifiedMemberList.aspx");
        }
        protected void LockMember_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            MemberFactory.Lock(id);
            Response.Redirect("UnverifiedMemberList.aspx");
        }
        protected void ActiveMember_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            MemberFactory.Active(id);
            AccountSettings settings =
                    SteansSettingsFactory.CreateBaseSetings<AccountSettings>();
            if (settings.IsSendingEmail)
            {
                var member = MemberFactory.Create(id);
                EmailService.SendEmail("reminder@depaul.edu", member.Email,
                    "Your Steans Request Has Been Approved",
                    string.Format("<h2>Dear {0},</h2><br/><br/>Your request for the access of Steans resources has been approved. Now you are able to use your CampusConnect account ({1}) to access Steans resources.<br /><br />Steans Center<br /><br />(This is a system automatic notification, please DO NOT reply this email.)",member.FirstName,member.CampusConnectID),
                    settings.IsHtmlEmail);
            }
            Response.Redirect("UnverifiedMemberList.aspx");
        }
    }
}