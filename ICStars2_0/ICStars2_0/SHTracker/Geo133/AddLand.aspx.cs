using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.Model.DbContexts;
using Microsoft.Practices.Unity;  //For injections

using ICStars2_0.BusinessLayer.GeoServices;
namespace ICStars2_0.SHTracker.Geo133
{
     
    public partial class AddLand : System.Web.UI.Page
    {
    //    private readonly IGeoFactory geoFactory;
    //    public AddLand(IGeoFactory _geoFactory)
    //{
       
    //    this.geoFactory = _geoFactory;
    //}
        [Dependency]
        public IGeoFactory geoFactory { get; set; }
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private Boolean CheckValue(string value)
        {

            if (value == "Yes")
            { 
            return true;
            }
            else {
                return false;

            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
              
        
            Model.GEO133 model = new Model.GEO133();
            //model.buildingAddress = Request.Form["BuildingAddress"];
           // model.OnlineInfo = new Model.GeoOnlineInformation();
         //   model.buildingAddress = txtBuildingAddress.Text.Trim();
         //   model.blockNumber = txtBlockNumber.Text.Trim();
         //   model.far = txtFAR.Text;
         //   model.zoning = txtZoning.Text.Trim();
         //   model.zipCode = txtZipCode.Text.Trim();
         //   model.pinNumber = txtPINNumber.Text.Trim();
         //   model.OnlineInfo = new Model.GeoOnlineInformation();
         //   model.OnlineInfo.age = txtAge.Text.Trim();
         //   model.OnlineInfo.bedroomsNumber = txtBedrooms.Text.Trim();
         //   model.OnlineInfo.BoardOfEducation = txtBoardofEducation.Text.Trim();
         //   model.OnlineInfo.censusTract = txtCensusTract.Text.Trim();
         ////   model.OnlineInfo.inTifDistrict = txt
         //   model.OnlineInfo.LandSquareFootage = txtLandSq.Text.Trim();
         //   model.OnlineInfo.LibraryFund= txtLibraryFund.Text.Trim();
         //   model.OnlineInfo.listedPrice = txtListedPrice.Text.Trim();
         //   model.OnlineInfo.ParkDistrict = txtParkDistrict.Text.Trim();
         //   //model.OnlineInfo.PhotoDate = txtPhotoDate.Text.Trim();
         //   model.OnlineInfo.propertyClass = txtPropertyClass.Text.Trim();
         //   // model.OnlineInfo.propertyDescription= txtpr
         //      model.OnlineInfo.propertySoldInYear = CheckValue(Request.Form["propertySold"]);
         //   model.OnlineInfo.PropertyTaxExemptions = txtPropertyTaxEx.Text.Trim();
         //   //model.OnlineInfo.saleDate = txtSaledDate.Text.Trim();
         //   model.OnlineInfo.salePrice = txtSalePrice.Text.Trim();
         //   model.OnlineInfo.isForSale = CheckValue(Request.Form["currentlyForSale"]);
         //   model.OnlineInfo.isOrange = CheckValue(Request.Form["ratedOrange"]);
         //   model.OnlineInfo.isPhotoDownloaded = CheckValue(Request.Form["OfficePhotoDownloaded"]);
         //   model.OnlineInfo.isFollowingYPhotoTaken = CheckValue(Request.Form["NextyPhotoTaken"]);
         //   // model.OnlineInfo.SchoolImprovments = txtsc
         //   model.OnlineInfo.Stories = txtStories.Text.Trim();
         //  // model.OnlineInfo.StudentPhotoDate = txtUserPhotoDate.Text.Trim();
         //   model.OnlineInfo.TaxPayerInfo = txtTaxpayerAddressN.Text.Trim();
         //   model.OnlineInfo.taxpayerMailing = txtTaxpayerAddressN.Text.Trim();
         //    //  model.OnlineInfo.taxPayerName = txtta
         //   model.OnlineInfo.TifArea = txtPilsenArea.Text.Trim();
         //    // model.OnlineInfo.TreasurerSeniorCitizen = 
         //    // model.OnlineInfo.TreasurerSiteHomeowner
         //    // model.OnlineInfo.TreasurerSiteSeniorFreeze
         //   model.OnlineInfo.AssessedValuesLand_ = txtOldLand.Text.Trim();
         //   model.OnlineInfo.AssessedValuesLand__ = txtOldestLand.Text.Trim();
         //   model.OnlineInfo.AssessedValuesLand = txtCurrentLand.Text.Trim();
         //   model.OnlineInfo.AssessedValuesLandPlus = txtNextLand.Text.Trim();

         //   model.OnlineInfo.AssessedValuesBuilding_ = txtOldBuilding.Text.Trim();
         //   model.OnlineInfo.AssessedValuesBuilding__ = txtOldestBuilding.Text.Trim();
         //   model.OnlineInfo.AssessedValuesBuilding = txtCurrentBuilding.Text.Trim();
         //   model.OnlineInfo.AssessedValuesBuildingPlus = txtNextBuilding.Text.Trim();

         //   model.OnlineInfo.AssessedValuesTotal_ = txtTotalOld.Text.Trim();
         //   model.OnlineInfo.AssessedValuesTotal__ = txtTotalOldest.Text.Trim();
         //   model.OnlineInfo.AssessedValuesTotal = txtTotalCurrent.Text.Trim();
         //   model.OnlineInfo.AssessedValuesTotalPlus = txtTotalNext.Text.Trim();

         //   model.OnlineInfo.AssessedValuesEstMkt = txtEstCurrent.Text.Trim();
         //   model.OnlineInfo.AssessedValuesEstMktPlus = txtEstNext.Text.Trim();

         //   model.OnlineInfo.TreasurerSiteHomeowner = CheckValue(Request.Form["Homeowner"]);
         //   model.OnlineInfo.TreasurerSeniorCitizen = CheckValue(Request.Form["SeniorCitizen"]);
         //   model.OnlineInfo.TreasurerSiteSeniorFreeze = CheckValue(Request.Form["SeniorFreeze"]);
         //   model.OnlineInfo.propertyDescription = Request.Form["PropertyDescription"];
         //   model.OnlineInfo.inTifDistrict = CheckValue(Request.Form["InTIFdistrict"]); 
         //    model.OnlineInfo.unitNumber = txtUnitNumber.Text.Trim();
         //   // model.OnlineInfo.yearBuild = txtYearBuilt.Text.Trim();
         //    //model.OnlineInfo.YearPropertyTax= txtPropertyTaxEx.Text.Trim();
         //    model.OnlineInfo.YearTaxesOwed = txtTaxDue.Text.Trim();
         //    model.OnlineInfo.NextYearAsCurrent = CheckValue(Request.Form["TaxPayerCurrent"]); 
           
            model.siteData = new Model.GeoSiteData();

            geoFactory.Add(model);
            
        }
    }
}