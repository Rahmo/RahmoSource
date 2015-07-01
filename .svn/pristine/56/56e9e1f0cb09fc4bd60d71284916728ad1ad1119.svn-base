using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.BusinessLayer.StudentServices;
using ICStars2_0.Common;
using ICStars2_0.Common.Attributes;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.StudentApp
{
    [Authorize(Roles = "Student", UnauthorizedRedirectUrl = "/Account/Student/Login")]
    public partial class ReportHours_1 : System.Web.UI.Page
    {
        [Dependency]
        public IStudentFactory StudentFactory { get; set; }
        [Dependency]
        public IUserData UserData { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDPUID.Text = UserData.DPUID;
                ddlQuarterYear.Items.Add(new ListItem("Select Quarter",""));
                ddlQuarterYear.Items.AddRange(
                    ICStars2_0.BusinessLayer.Extensions.BuildQuarterYearSelectListItems(null)
                        .Select(l => new ListItem(l.Text, l.Value)).ToArray());

            }
            //"StuentApp" is an account for testing
            if (User.Identity.Name.Equals("StudentApp"))
            {
                txtDPUID.Enabled = true;
            }
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            //Check if the student's DePaul ID exists in the SHTracker system.
            if(!StudentFactory.ExistDPUID(txtDPUID.Text.Trim()))
            {
                ltlError.Text = string.Format("DPU ID : {0} does not exist! This DPU ID is DePaul ID you entered in the blue sheet. Please contact your SLC to double check your DePaul ID in the system.", txtDPUID.Text);
                return;
            }
            var encryptDpuId = Common.EncryptDecryptHelper.Encrypt(txtDPUID.Text.Trim(),
                                                                   Const.DynamicKey);
            string t = string.Empty;
            //querystring t determines the right action: reporting or viewing hours.
            if(!string.IsNullOrEmpty(Request.QueryString["t"]))
            {
                t = string.Format("&t={0}", Request.QueryString["t"]);
            }
            Response.Redirect(string.Format("ReportHours_2.aspx?d={0}&q={1}{2}", Server.UrlEncode(encryptDpuId),
                                            Server.UrlEncode(ddlQuarterYear.SelectedValue), t));
        }
        
    }
}