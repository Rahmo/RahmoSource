using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.Common;

namespace ICStars2_0
{
    public partial class Right : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(User.IsInRole("SLC"))
            {
                Response.Redirect("/SHTracker/Student/List.aspx?IsMine=1");
            }
            //Regex regLInk = new Regex(@"<a href=""/node/[0-9]+"">(.+?)</a>", RegexOptions.Singleline | RegexOptions.IgnoreCase);
            //var html = FileHelper.ReadText("C:/cbo_4122012.htm");
            //var mc = regLInk.Matches(html);
            //foreach (Match match in mc)
            //{
            //    var s = Regex.Replace(match.Groups[1].Value, "\'", "\'\'");
            //    Response.Write("INSERT INTO [CBO](Name) SELECT '" + s + "';<br/>");
            //}
        }
    }
}