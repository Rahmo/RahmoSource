using System;
using System.Configuration;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.SteansServices.CommunityPartner;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.communityPartners
{
    public partial class ServiceLearnersApplication : System.Web.UI.Page
    {
        [Dependency]
        public IServiceLearnersApplicationFactory ServiceLearnerApplicationFactory { get; set; }

        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            ICStars2_0.Model.ServiceLearnersApplication app = new ICStars2_0.Model.ServiceLearnersApplication();
            app.OrganizationName = txtOrganizationName.Text;
            app.Region = ddlRegion.SelectedValue;
            app.QuarterYear = ddlQuarterYear.SelectedValue;
            app.Address = txtAddress.Text;
            app.ServeCommunities = txtServeCommunities.Text;
            app.ServiceAddress = string.IsNullOrEmpty(txtServiceAddress.Text) ? app.Address : txtServiceAddress.Text;
            app.Directions_PublicTransportation = txtDirections_PublicTransportation.Text;
            app.Directions_Car = txtDirections_Car.Text;
            app.Directions_Street_or_Lot_Parking = txtDirections_Street_or_Lot_Parking.Text;
            app.Phone = txtPhone.Text;
            app.Fax = txtFax.Text;
            app.Website = txtWebsite.Text;
            app.Leadership_ExecutiveDirectorName = txtLeadership_ExecutiveDirectorName.Text;
            app.Leadership_WorkPhone = txtLeadership_WorkPhone.Text;
            app.Leadership_CellPhone = txtLeadership_CellPhone.Text;
            app.Leadership_Email = txtLeadership_Email.Text;
            app.Leadership_How_long_served = txtLeadership_How_long_served.Text;
            app.Representative_Name = txtRepresentative_Name.Text;
            app.Representative_Title = txtRepresentative_Title.Text;
            app.Representative_Department_Program = txtRepresentative_Department_Program.Text;
            app.Representative_NameofDirectSupervisor = txtRepresentative_NameofDirectSupervisor.Text;
            app.Representative_Address = string.IsNullOrEmpty(txtRepresentative_Address.Text)
                                             ? app.Address
                                             : txtRepresentative_Address.Text;
            app.Representative_workPhone = txtRepresentative_workPhone.Text;
            app.Representative_CellPhone = txtRepresentative_CellPhone.Text;
            app.Representative_Email = txtRepresentative_Email.Text;
            app.Representative_ContactMode = txtRepresentative_ContactMode.Text;
            app.OrganizationalMission = txtOrganizationalMission.Text;
            app.PrimaryPopulationServed = Request.Form["PrimaryPopulationServed"];
            app.PrimaryPopulationServed_EthnicCommunitySpecific =
                txtPrimaryPopulationServed_EthnicCommunitySpecific.Text;
            app.PrimaryPopulationServed_Other = txtPrimaryPopulationServed_Other.Text;
            app.MajorProgramsServicesProvided = Request.Form["MajorProgramsServicesProvided"];
            app.MajorProgramsServicesProvided_Other = txtMajorProgramsServicesProvided_Other.Text;
            app.ServiceInterestOpportunities_ServiceMode = Request.Form["ServiceInterestOpportunities_ServiceMode"];
            app.ServiceInterestOpportunities_InterestedInCommunitybasedResearchProjects =
                rblServiceInterestOpportunities_InterestedInCommunitybasedResearchProjects.SelectedValue;
            app.ServiceInterestOpportunities_Task1 = txtTask1.Text;
            app.ServiceInterestOpportunities_Task1_Description = txtServiceInterestOpportunities_Task1_Description.Text;
            app.ServiceInterestOpportunities_Task1_NumberofStudents =
                txtServiceInterestOpportunities_Task1_NumberofStudents.Text;
            app.ServiceInterestOpportunities_Task1_AvailabilityNeeded =
                txtServiceInterestOpportunities_Task1_AvailabilityNeeded.Text;
            app.ServiceInterestOpportunities_Task2 = txtTask2.Text;
            app.ServiceInterestOpportunities_Task2_Description = txtServiceInterestOpportunities_Task2_Description.Text;
            app.ServiceInterestOpportunities_Task2_NumberofStudents =
                txtServiceInterestOpportunities_Task2_NumberofStudents.Text;
            app.ServiceInterestOpportunities_Task2_AvailabilityNeeded =
                txtServiceInterestOpportunities_Task2_AvailabilityNeeded.Text;
            app.ServiceInterestOpportunities_Task3 = txtTask3.Text;
            app.ServiceInterestOpportunities_Task3_Description = txtServiceInterestOpportunities_Task3_Description.Text;
            app.ServiceInterestOpportunities_Task3_NumberofStudents =
                txtServiceInterestOpportunities_Task3_NumberofStudents.Text;
            app.ServiceInterestOpportunities_Task3_AvailabilityNeeded =
                txtServiceInterestOpportunities_Task3_AvailabilityNeeded.Text;
            app.ServiceInterestOpportunities_Task4 = txtTask4.Text;
            app.ServiceInterestOpportunities_Task4_Description = txtServiceInterestOpportunities_Task4_Description.Text;
            app.ServiceInterestOpportunities_Task4_NumberofStudents =
                txtServiceInterestOpportunities_Task4_NumberofStudents.Text;
            app.ServiceInterestOpportunities_Task4_AvailabilityNeeded =
                txtServiceInterestOpportunities_Task4_AvailabilityNeeded.Text;

            app.ServiceInterestOpportunities_BackgroundChecks_RequireVolunteers =
                cblServiceInterestOpportunities_BackgroundChecks_RequireVolunteers.SelectedValue;

            app.ServiceInterestOpportunities_BackgroundChecks_BackgroundCheck =
                cbxServiceInterestOpportunities_BackgroundChecks_BackgroundCheck.Checked;
            if (!string.IsNullOrEmpty(txtServiceInterestOpportunities_BackgroundChecks_BackgroundCheckApprovalTime.Text))
            {
                app.ServiceInterestOpportunities_BackgroundChecks_BackgroundCheckApprovalTime =
                    Convert.ToDateTime(txtServiceInterestOpportunities_BackgroundChecks_BackgroundCheckApprovalTime.Text);
            }

            app.ServiceInterestOpportunities_BackgroundChecks_Fingerprinting =
                cbxServiceInterestOpportunities_BackgroundChecks_Fingerprinting.Checked;
            if (!string.IsNullOrEmpty(txtServiceInterestOpportunities_BackgroundChecks_FingerprintingApprovalTime.Text))
            {
                app.ServiceInterestOpportunities_BackgroundChecks_FingerprintingApprovalTime =
                    Convert.ToDateTime(txtServiceInterestOpportunities_BackgroundChecks_FingerprintingApprovalTime.Text);
            }


            app.ServiceInterestOpportunities_BackgroundChecks_TBTesting =
                cbxServiceInterestOpportunities_BackgroundChecks_TBTesting.Checked;
            if (!string.IsNullOrEmpty(txtServiceInterestOpportunities_BackgroundChecks_TBTestingApprovalTime.Text))
            {
                app.ServiceInterestOpportunities_BackgroundChecks_TBTestingApprovalTime =
                    Convert.ToDateTime(txtServiceInterestOpportunities_BackgroundChecks_TBTestingApprovalTime.Text);
            }

            app.SiteRepresentativeCommitment_PresentationQuarter =
                Request.Form["SiteRepresentativeCommitment_PresentationQuarter"];

            app.SiteRepresentativeCommitment_ScheduleOrientation =
                rblSiteRepresentativeCommitment_ScheduleOrientation.SelectedValue;

            app.SiteRepresentativeCommitment_TimeCommitment = txtSiteRepresentativeCommitment_TimeCommitment.Text;

            app.SiteRepresentativeCommitment_Feedback = rblSiteRepresentativeCommitment_Feedback.SelectedValue;

            app.SiteRepresentativeCommitment_DePaulPartnersListserv =
                rblSiteRepresentativeCommitment_DePaulPartnersListserv.SelectedValue;

            app.Name = txtName.Text;
            app.Title = txtTitle.Text;
            if (!string.IsNullOrEmpty(txtDate.Text))
            {
                app.Date = Convert.ToDateTime(txtDate.Text);
            }
            app.CurrentSteansCenterContact = txtCurrentSteansCenterContact.Text;
           

            int result = 0;
            try
            {
                result = ServiceLearnerApplicationFactory.Update(app).ID;
            }
            catch (Exception exp)
            {
                ltlError.Text = "System Error! Please contact administrator or retry.";
            }
            if (result > 0)
            {
                //cwilli48@depaul.edu,cphilli3@depaul.edu,selahi1@depaul.edu,mmaynard@depaul.edu,jvipond@depaul.edu,
                CommunityPartnerSettings settings = SteansSettingsFactory.CreateBaseSetings<CommunityPartnerSettings>();
                if (settings.IsSendingEmail)
                {
                    EmailService.SendEmail("", settings.ReceiverEmail,
                                           settings.EmailTitle,
                                           settings.EmailBody.Replace("#OrganizationName#", app.OrganizationName),
                                           settings.IsHtmlEmail);
                }
                Response.Redirect("ServiceLearnersApplicationSuccess.htm");
            }
        }
        
    }
}