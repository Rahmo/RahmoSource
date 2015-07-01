using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.SteansServices.EventRequest;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Staff
{
    public partial class EventRequest : System.Web.UI.Page
    {
        [Dependency]
        public IEventRequestFormFactory EventRequestFormFactory { get; set; }
        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            EventRequestForm form = new EventRequestForm();
            form.ContactName = txtContactName.Text.Trim();
            form.SupervisorEmail = txtSupervisorsEmail.Text.Trim();
            form.Program = ddlProgram.SelectedValue;
            if (!string.IsNullOrEmpty(txtEventDate.Text))
            {
                form.EventDate = Convert.ToDateTime(txtEventDate.Text);
            }
            form.EventTime = txtEventTime.Text.Trim();
            form.EventTitle = txtEventTitle.Text.Trim();
            form.EventLocation = txtEventLocation.Text.Trim();
            form.NumberOfAttendees = Convert.ToInt32(txtNumberofAttendees.Text);
            form.ChartwellsItems = string.Format("{0}[@|@]{1}[@|@]{2}",
                                                 Request.Form["CateringServicesItems"],
                                                 Request.Form["CateringServicesQty"],
                                                 Request.Form["CateringServicesUnitPrice"]);
            form.ChartwellsNotes = txtCateringServicesNotes.Text.Trim();
            form.StaplesItems = string.Format("{0}[@|@]{1}[@|@]{2}[@|@]{3}",
                                                 Request.Form["StaplesItems"],
                                                 Request.Form["StaplesItemDescriptions"],
                                                 Request.Form["StaplesQty"],
                                                 Request.Form["StaplesUnitPrice"]);
            form.StaplesNotes = txtStaplesNotes.Text.Trim();
            //Photograph part is removed due to user's request
            //form.PhotographerRequired = Request.Form["RequireAPhotographer"];
            //if (!string.IsNullOrEmpty(txtPhotographerDate.Text))
            //{
            //    form.PhotographerRequiredDate = Convert.ToDateTime(txtPhotographerDate.Text);
            //}
            //form.PhotographerRequiredLocation = txtPhotographerLocation.Text.Trim();
            //form.PhotographerRequiredTime = txtPhotographerTime.Text.Trim();
            if (!string.IsNullOrEmpty(txtCopiesNeededBy.Text))
            {
                form.DistributionServicesCopiesNeededBy = Convert.ToDateTime(txtCopiesNeededBy.Text);
            }
            int colorCopies = 0;
            if (int.TryParse(txtColorCopies.Text.Trim(), out colorCopies))
            {
                form.DistributionServicesColorCopies = colorCopies;
            }
            int bwCopies = 0;
            if(int.TryParse(txtBWCopies.Text.Trim(),out bwCopies))
            {
                form.DistributionServicesBWCopies = bwCopies;
            }
            form.DistributionServicesPaperSidedType = Request.Form["cbxSided"];
            form.DistributionServicesPaperQuality = ddlPaperQuality.SelectedValue;
            int formid = EventRequestFormFactory.Update(form).ID;
            if (formid > 0)
            {
                EventRequestSettings settings =
                    SteansSettingsFactory.CreateBaseSetings<EventRequestSettings>();
                if (settings.IsSendingEmail)
                {
                    var urlRoot = Request.Url.GetLeftPart(UriPartial.Authority);
                    EmailService.SendEmail("reminder@depaul.edu", settings.ReceiverEmail,
                                                              form.EventTitle + "--Event Request Form",
                                                              settings.EmailBody.Replace("#Title#", form.EventTitle).Replace("#Link#", string.Format("<a href=\"{0}/ShTracker/Steans/EventRequest/FormDetails.aspx?id={1}&k={2}\">Go to View</a>", urlRoot, formid, Common.MathHelper.Md5(string.Format("{0}{1}", Common.Const.ENCRYPT_KEY, formid)))),
                                                              settings.IsHtmlEmail);

                    EmailService.SendEmail("reminder@depaul.edu", form.SupervisorEmail,
                                                              form.EventTitle + "--Event Request Form",
                                                              settings.EmailBody.Replace("#Title#", form.EventTitle).Replace("#Link#", string.Format("<a href=\"{0}/ShTracker/Steans/EventRequest/FormDetails.aspx?id={1}&k={2}\">Go to View</a><br/>Please review and approve.", urlRoot, formid, Common.MathHelper.Md5(string.Format("{0}{1}", Common.Const.ENCRYPT_KEY, formid)))),
                                                              settings.IsHtmlEmail);
                }
                Response.Redirect("EventRequestSuccess.html");
            }
        }
        
    }
}