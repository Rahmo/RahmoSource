using System;
using ICStars2_0.BusinessLayer.SteansServices.CommunityPartner;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Steans.CommunityPartner
{
    [Authorize(Roles = "admin_steans,admin_communitypartner")]
    public partial class List : System.Web.UI.Page
    {
        [Dependency]
        public IServiceLearnersApplicationFactory ServiceLearnersApplicationFactory { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            IServiceLearnersApplicationCollection cic = ServiceLearnersApplicationFactory.CreateServiceLearnersApplicationCollection(pageBar1.CurrentIndex,
                                                                                                pageBar1.Size,
                                                                                                new ServiceLearnersApplicationCollectionSettings
                                                                                                {
                                                                                                    QuarterYear =
                                                                                                        Request.
                                                                                                        QueryString[
                                                                                                            "quarter"]
                                                                                                });
            pageBar1.Total = cic.Count;
            rptList.DataSource = cic;
            rptList.DataBind();
        }
    }
}