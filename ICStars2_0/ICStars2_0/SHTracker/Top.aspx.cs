using System;
using System.Collections.Generic;

using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.Provider;
using Microsoft.Practices.Unity;

namespace ICStars2_0
{
    public partial class Top : System.Web.UI.Page
    {
        [Dependency]
        public IUserData UserData { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}