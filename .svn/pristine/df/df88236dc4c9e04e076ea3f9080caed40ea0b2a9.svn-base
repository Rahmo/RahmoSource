using System;
using ICStars2_0.BusinessLayer.SteansServices.CommunityPartner;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Steans.CommunityPartner
{
    [Authorize(Roles = "admin_steans,admin_communitypartner")]
    public partial class ApplicationDetails : System.Web.UI.Page
    {
        public ServiceLearnersApplication CurrentApp { get; set; }
        [Dependency]
        public IServiceLearnersApplicationFactory ServiceLearnersApplicationFactory { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = 0;
            if (int.TryParse(Request.QueryString["id"], out id) && id > 0)
            {
                ServiceLearnersApplication app = CurrentApp = ServiceLearnersApplicationFactory.Create(id);
                txtOrganizationName.Text = app.OrganizationName;
                this.Title = app.OrganizationName;
                //txtAddress.Text = app.Address;
                //txtServeCommunities.Text = app.ServeCommunities;
                // txtServiceAddress.Text = app.ServiceAddress;
                txtDirections_PublicTransportation.Text = app.Directions_PublicTransportation;
                txtDirections_Car.Text = app.Directions_Car;
                txtDirections_Street_or_Lot_Parking.Text = app.Directions_Street_or_Lot_Parking;
                txtPhone.Text = app.Phone;
                txtFax.Text = app.Fax;
                txtWebsite.Text = app.Website;
                txtLeadership_ExecutiveDirectorName.Text = app.Leadership_ExecutiveDirectorName;
                txtLeadership_WorkPhone.Text = app.Leadership_WorkPhone;
                txtLeadership_CellPhone.Text = app.Leadership_CellPhone;
                txtLeadership_Email.Text = app.Leadership_Email;
                txtLeadership_How_long_served.Text = app.Leadership_How_long_served;
                txtRepresentative_Name.Text = app.Representative_Name;
                txtRepresentative_Title.Text = app.Representative_Title;
                txtRepresentative_Department_Program.Text = app.Representative_Department_Program;
                txtRepresentative_NameofDirectSupervisor.Text = app.Representative_NameofDirectSupervisor;
                txtRepresentative_Address.Text = app.Representative_Address;
                txtRepresentative_workPhone.Text = app.Representative_workPhone;
                txtRepresentative_CellPhone.Text = app.Representative_CellPhone;
                txtRepresentative_Email.Text = app.Representative_Email;
                txtRepresentative_ContactMode.Text = app.Representative_ContactMode;
                //txtOrganizationalMission.Text = app.OrganizationalMission;

                //txtServiceInterestOpportunities_Task1_Description.Text =
                // app.ServiceInterestOpportunities_Task1_Description;


                txtServiceInterestOpportunities_Task1_NumberofStudents.Text =
                    app.ServiceInterestOpportunities_Task1_NumberofStudents;

                txtServiceInterestOpportunities_Task1_AvailabilityNeeded.Text =
                    app.ServiceInterestOpportunities_Task1_AvailabilityNeeded;

                // txtServiceInterestOpportunities_Task2_Description.Text =
                //app.ServiceInterestOpportunities_Task2_Description;
                txtServiceInterestOpportunities_Task2_NumberofStudents.Text =
                    app.ServiceInterestOpportunities_Task2_NumberofStudents;
                txtServiceInterestOpportunities_Task2_AvailabilityNeeded.Text =
                    app.ServiceInterestOpportunities_Task2_AvailabilityNeeded;

                //txtServiceInterestOpportunities_Task3_Description.Text =
                //app.ServiceInterestOpportunities_Task3_Description ;
                txtServiceInterestOpportunities_Task3_NumberofStudents.Text =
                app.ServiceInterestOpportunities_Task3_NumberofStudents;
                txtServiceInterestOpportunities_Task3_AvailabilityNeeded.Text =
                    app.ServiceInterestOpportunities_Task3_AvailabilityNeeded;

                // txtServiceInterestOpportunities_Task4_Description.Text =
                //  app.ServiceInterestOpportunities_Task4_Description;
                txtServiceInterestOpportunities_Task4_NumberofStudents.Text =
                    app.ServiceInterestOpportunities_Task4_NumberofStudents;
                txtServiceInterestOpportunities_Task4_AvailabilityNeeded.Text =
                    app.ServiceInterestOpportunities_Task4_AvailabilityNeeded;

                cbxServiceInterestOpportunities_BackgroundChecks_BackgroundCheck.Checked =
                    app.ServiceInterestOpportunities_BackgroundChecks_BackgroundCheck;

                if (app.ServiceInterestOpportunities_BackgroundChecks_BackgroundCheckApprovalTime > DateTime.MinValue)
                {
                    txtServiceInterestOpportunities_BackgroundChecks_BackgroundCheckApprovalTime.Text =
                        app.ServiceInterestOpportunities_BackgroundChecks_BackgroundCheckApprovalTime.ToString(
                            "MM/dd/yyyy");
                }

                cbxServiceInterestOpportunities_BackgroundChecks_Fingerprinting.Checked =
                    app.ServiceInterestOpportunities_BackgroundChecks_Fingerprinting;

                if (app.ServiceInterestOpportunities_BackgroundChecks_FingerprintingApprovalTime > DateTime.MinValue)
                {
                    txtServiceInterestOpportunities_BackgroundChecks_FingerprintingApprovalTime.Text =
                        app.ServiceInterestOpportunities_BackgroundChecks_FingerprintingApprovalTime.ToString(
                            "MM/dd/yyyy");
                }

                cbxServiceInterestOpportunities_BackgroundChecks_TBTesting.Checked =

                    app.ServiceInterestOpportunities_BackgroundChecks_TBTesting;
                if (app.ServiceInterestOpportunities_BackgroundChecks_TBTestingApprovalTime > DateTime.MinValue
                )
                {
                    txtServiceInterestOpportunities_BackgroundChecks_TBTestingApprovalTime.Text =
                        app.ServiceInterestOpportunities_BackgroundChecks_TBTestingApprovalTime.ToString("MM/dd/yyyy");
                }

                txtSiteRepresentativeCommitment_TimeCommitment.Text =
                    app.SiteRepresentativeCommitment_TimeCommitment;


                txtName.Text = app.Name;
                txtTitle.Text = app.Title;
                if (app.Date > DateTime.MinValue)
                {
                    txtDate.Text = app.Date.ToString("MM/dd/yyyy");
                }
                txtCurrentSteansCenterContact.Text = app.CurrentSteansCenterContact;
            }


        }
    }
}