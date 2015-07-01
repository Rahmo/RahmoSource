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
    [Authorize(Roles = "admin,admin_cbo,SLC,Staff")]
    public partial class List : System.Web.UI.Page
    {
        private ICBOFactory _cboFactory;
        [Dependency]
        public ICBOFactory CBOFactory
        {
            get { return _cboFactory; }
            set { _cboFactory = value; }
        }
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            IsAuthorized = User.IsInRole("admin") || User.IsInRole("admin_cbo") || User.IsInRole("Staff");
        }
        protected void Page_Load(object sender, EventArgs e)
        {

            rptList.DataSource = CBOFactory.CreateCBOCollection(1, 1000);
            rptList.DataBind();
        }

        public bool IsAuthorized { get; set; }
        protected void lbtDeleteMember_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            CBOFactory.Delete(id);
            Response.Redirect("List.aspx");
        
        }
        //lbtDeleteMember_Click
    }
}