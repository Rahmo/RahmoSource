using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Common.Attributes;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Steans.EventRequest
{
    [Authorize(Roles = "admin_steans,admin_eventrequest")]
    public partial class Settings : System.Web.UI.Page
    {

        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }

        public IEmailSettings BaseSettings { get; set; }
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            BaseSettings = SteansSettingsFactory.CreateBaseSetings<EventRequestSettings>();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtReceiverEmail.Text = BaseSettings.ReceiverEmail;
                txtTitle.Text = BaseSettings.EmailTitle;
                txtBody.Text = BaseSettings.EmailBody;
                ddlIsHtml.SelectedValue = BaseSettings.IsHtmlEmail.ToString();
                ddlIsSendingEmail.SelectedValue = BaseSettings.IsSendingEmail.ToString();
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            BaseSettings.ReceiverEmail = txtReceiverEmail.Text.Trim();
            BaseSettings.EmailTitle = txtTitle.Text.Trim();
            BaseSettings.EmailBody = txtBody.Text;
            BaseSettings.IsHtmlEmail = Convert.ToBoolean(ddlIsHtml.SelectedValue);
            BaseSettings.IsSendingEmail = Convert.ToBoolean(ddlIsSendingEmail.SelectedValue);
            SteansSettingsFactory.SaveSettings(BaseSettings);

        }
    }
}