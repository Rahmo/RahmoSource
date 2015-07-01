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
    public partial class Edit : System.Web.UI.Page
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

            if (!IsPostBack)
            {
                int id = 0;
                int.TryParse(Request.QueryString["id"], out id);
                Model.CBO cbo = CBOFactory.Create(id);
                txtCBOName.Text = cbo.Name;
                hdfCBOName.Value = cbo.Name;
                txtContactFristName.Text = cbo.ContactFristName;
                txtContactLastName.Text = cbo.ContactLastName;
                txtContactEmail.Text = cbo.ContactEmail;
                txtContactPhone.Text = cbo.ContactPhone;
                txtAddress.Text = cbo.Address;
                txtMission.Text = cbo.Mission;
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            int id = 0;
            int.TryParse(Request.QueryString["id"], out id);
            Model.CBO cbo = CBOFactory.Create(id);
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