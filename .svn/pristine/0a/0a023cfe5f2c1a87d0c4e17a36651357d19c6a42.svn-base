using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.CBOServices;
using ICStars2_0.Common.Attributes;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.CBO
{
    [Authorize(Roles = "admin,admin_cbo,Staff")]
    public partial class Add : System.Web.UI.Page
    {
        private ICBOFactory _cboFactory;
        [Dependency]
        public ICBOFactory CBOFactory
        {
            get { return _cboFactory; }
            set { _cboFactory = value; }
        }
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSubmit_Click(object sender,EventArgs e)
        {
            Model.CBO cbo = new Model.CBO();
            cbo.Name = txtCBOName.Text.Trim();
            cbo.ContactFristName = txtContactFristName.Text.Trim();
            cbo.ContactLastName = txtContactLastName.Text.Trim();
            cbo.ContactEmail = txtContactEmail.Text.Trim();
            cbo.ContactPhone = txtContactPhone.Text;
            cbo.Address = txtAddress.Text;
            cbo.Mission = txtMission.Text;
            CBOFactory.Update(cbo);
            Response.Redirect("List.aspx");
        }
    }
}