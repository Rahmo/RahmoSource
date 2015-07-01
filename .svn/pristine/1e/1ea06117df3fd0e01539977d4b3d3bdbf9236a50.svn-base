using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.SteansServices.EventRequest;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model.Enum;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Steans.EventRequest
{
    [Authorize(Roles = "admin_steans,admin_eventrequest")]
    public partial class List : System.Web.UI.Page
    {

        [Dependency]
        public IEventRequestFormFactory EventRequestFormFactory { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            IEventRequestFormCollection cic =
                EventRequestFormFactory.CreateEventRequestFormCollection(pageBar1.CurrentIndex,
                                                                         pageBar1.Size);
            pageBar1.Total = cic.Count;
            rptList.DataSource = cic;
            rptList.DataBind();
        }

        protected void lbtDiscard_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            EventRequestFormFactory.UpdateStatus(id,EventRequestFormStatus.Discarded);
            Response.Redirect("List.aspx");
        }
        protected void lbtApprove_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            EventRequestFormFactory.UpdateStatus(id, EventRequestFormStatus.Approved);
            Response.Redirect("List.aspx");
        }
        protected void lbtUncheck_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            EventRequestFormFactory.UpdateStatus(id, EventRequestFormStatus.Unchecked);
            Response.Redirect("List.aspx");
        }


    }
}
