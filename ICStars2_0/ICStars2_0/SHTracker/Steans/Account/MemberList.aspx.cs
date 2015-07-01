using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Steans.Account
{
    [Authorize(Roles = "admin_steans,admin_steans_account")]
    public partial class MemberList : System.Web.UI.Page
    {
        private IMemberFactory _memberFactory;

        [Dependency]
        public IMemberFactory MemberFactory
        {
            get { return _memberFactory; }
            set { _memberFactory = value; }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            rptList.DataSource = MemberFactory.CreateMemberCollection(1, 1000,
                                                                      new MemberCollectionSettings { MemberRoles = new[] { "Steans", "SteansWeb" } });
            rptList.DataBind();

        }
        protected void lbtDeleteMember_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            MemberFactory.Delete(id);
            Response.Redirect("MemberList.aspx");
        }
        protected void LockMember_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            MemberFactory.Lock(id);
            Response.Redirect("MemberList.aspx");
        }
        protected void ActiveMember_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            MemberFactory.Active(id);
            Response.Redirect("MemberList.aspx");
        }
    }
}