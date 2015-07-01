using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.SteansServices.EventRequest;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.SHTracker.Steans.EventRequest
{
    public partial class FormDetails : System.Web.UI.Page
    {

        [Dependency]
        public IEventRequestFormFactory EventRequestFormFactory { get; set; }

        public EventRequestForm CurrentEventRequestForm { get; set; }
        public ChartwellItem[] ChartwellItems { get; set; }
        public StaplesItem[] StaplesItems { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
             int id = 0;
             if (int.TryParse(Request.QueryString["id"], out id) && id > 0)
             {
                 if (string.IsNullOrEmpty(Request.QueryString["k"]) ||
                     !Request.QueryString["k"].Equals(
                         ICStars2_0.Common.MathHelper.Md5(string.Format("{0}{1}", ICStars2_0.Common.Const.ENCRYPT_KEY,
                                                                        id))))
                 {
                     Response.Clear();
                     Response.Write("Unauthorized!");
                     Response.End();
                     return;
                 }
                 CurrentEventRequestForm = EventRequestFormFactory.Create(id);
                 #region =Chartwell=

                 string[] sChartwellItems = Regex.Split(CurrentEventRequestForm.ChartwellsItems, @"\[\@\|\@\]");
                 var items = sChartwellItems[0].Split(',');
                 var qtys = sChartwellItems[1].Split(',');
                 var unitPrices = sChartwellItems[2].Split(',');
                 ChartwellItems = new ChartwellItem[items.Length];
                 for (int i = 0; i < ChartwellItems.Length; i++)
                 {
                     ChartwellItems[i] = new ChartwellItem();
                     ChartwellItems[i].Item = items[i];
                     ChartwellItems[i].Qty = qtys[i];
                     ChartwellItems[i].UnitPrice = unitPrices[i];
                 }
                 #endregion

                 #region =Staples=

                 string[] sStaplesItems = Regex.Split(CurrentEventRequestForm.StaplesItems, @"\[\@\|\@\]");
                 var items2 = sStaplesItems[0].Split(',');
                 var descriptions = sStaplesItems[1].Split(',');
                 var qtys2 = sStaplesItems[2].Split(',');
                 var unitPrices2 = sStaplesItems[3].Split(',');
                 StaplesItems = new StaplesItem[items2.Length];
                 for (int i = 0; i < StaplesItems.Length; i++)
                 {
                     StaplesItems[i] = new StaplesItem();
                     StaplesItems[i].Item = items2[i];
                     StaplesItems[i].Description = descriptions[i];
                     StaplesItems[i].Qty = qtys2[i];
                     StaplesItems[i].UnitPrice = unitPrices2[i];
                 }
                 #endregion
             }
        }
    }
     public class ChartwellItem
     {
         public string Item { get; set; }
         public string Qty { get; set; }
         public string UnitPrice { get; set; }
     }
    public class StaplesItem
    {
        public string Item { get; set; }
        public string Description { get; set; }
        public string Qty { get; set; }
        public string UnitPrice { get; set; }
    }
}