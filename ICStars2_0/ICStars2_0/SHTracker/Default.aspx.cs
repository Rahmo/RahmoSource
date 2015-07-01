using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer;
using ICStars2_0.Common;
using ICStars2_0.Common.Attributes;
using Microsoft.Practices.Unity;

namespace ICStars2_0
{
    [Authorize]
    public partial class _Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Roles.GetRolesForUser(User.Identity.Name).Length == 0)
            {
                Response.Clear();
                Response.Redirect("/Account/Logout");
                Response.End();
            }
         //Response.Write(TestInjection.Print());   
            //Regex regLInk = new Regex(@"<a href=""/node/[0-9]+"">(.+?)</a>", RegexOptions.Singleline|RegexOptions.IgnoreCase);
            //var html = FileHelper.ReadText("C:/Users/Whoee/Desktop/cbo_4122012.htm");
            //var mc = regLInk.Matches(html);
            //foreach (Match match in mc)
            //{
            //    Response.Write("INSERT INTO [CBO](Name) SELECT '" + match.Groups[1] + "';<br/>");
            //}
        }
    }
}