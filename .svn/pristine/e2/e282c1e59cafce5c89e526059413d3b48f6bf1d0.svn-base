using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.LogServices;
using ICStars2_0.Common.Attributes;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Log
{
    [Authorize(Roles = "admin,admin_log")]
    public partial class List : System.Web.UI.Page
    {
        [Dependency]
        public ISHTrackerLogFactory SHTrackerLogFactory { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            var sc = SHTrackerLogFactory.CreateSHTracherLogCollection(pageBar1.CurrentIndex, pageBar1.Size);
            rptList.DataSource = sc;
            pageBar1.Total = sc.Count;
            rptList.DataBind();
        }
    }
}