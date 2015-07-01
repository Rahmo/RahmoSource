using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.SteansServices.CommunityInternshipServices;
using ICStars2_0.Common.Attributes;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Steans.Internship
{
    [Authorize(Roles = "admin_steans,admin_communityinternship")]
    public partial class List : System.Web.UI.Page
    {
        [Dependency]
        public ICommunityInternshipFactory CommunityInternshipFactory { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            ICommunityInternshipCollection cic = CommunityInternshipFactory.CreateCommunityInternshipCollection(pageBar1.CurrentIndex, pageBar1.Size);
            pageBar1.Total = cic.Count;
            rptList.DataSource = cic;
            rptList.DataBind();
        }
    }
}