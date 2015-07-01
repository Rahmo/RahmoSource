using System;
using System.Web;
using System.Web.Security;
using CampusConnect.MediatorLibrary;
using Commengdpu.BusinessLayer.UserServices;
using Commengdpu.Models;
using ICStars2_0.Common;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace Commengdpu.BusinessLayer.Authentication
{

    class LoginAdapter : ILogin, ISingletonRegister
    {

        [Dependency]
        public IUserFactory UserFactory { get; set; }

        public void Logout(LoginEventArgs e)
        {
            //authentication
            FormsAuthentication.SignOut();

            //roleManager
            HttpContext.Current.Response.Cookies[Roles.CookieName].Value = null;
            HttpContext.Current.Response.Cookies[Roles.CookieName].Expires = DateTime.Now.AddDays(-1);
            //authentication double check
            HttpContext.Current.Response.Cookies[FormsAuthentication.FormsCookieName].Value = null;
            HttpContext.Current.Response.Cookies[FormsAuthentication.FormsCookieName].Expires = DateTime.Now.AddDays(-1);
        }

       
        internal static void AddFormCookie(LoginEventArgs e)
        {

            var userData = string.Format("ID:{0}|RealName:{1}|DPUID:{2}", e.UserID, e.RealName,e.DPUID);
            var lcookie = FormsAuthentication.GetAuthCookie(e.CampusConnectID, true);
            var ticket = FormsAuthentication.Decrypt(lcookie.Value);
            var newTicket = new FormsAuthenticationTicket(ticket.Version, ticket.Name, ticket.IssueDate, ticket.Expiration, ticket.IsPersistent, userData);
            lcookie.Value = FormsAuthentication.Encrypt(newTicket);
            
            HttpContext.Current.Response.Cookies.Add(lcookie);
        }
        public bool Login(LoginEventArgs e)
        {
            Logout(e);
            ICampusConnectMediator mediator = CampusConnectFactory.CreateCampusConnectMediaor();
            var campusconnectinfo = mediator.GetUserInfo(e.CampusConnectID, e.Password);

            if (campusconnectinfo == null) return false;
            var bi = new BrowserInfo();
            var pInfo = !UserFactory.Has(e.CampusConnectID)
                ? new User()
                {
                    UserName = e.CampusConnectID
                }
                : UserFactory.Create(e.CampusConnectID);
            pInfo.LastLoginIP = bi.IP;
            pInfo.LastLoginDate = DateTime.Now;
            UserFactory.SaveToDb(pInfo);
            e.UserID = pInfo.ID;
            if (string.IsNullOrEmpty(pInfo.DPUID)
                || string.IsNullOrEmpty(pInfo.FirstName)
                || string.IsNullOrEmpty(pInfo.LastName))
            {
                pInfo.DPUID = campusconnectinfo.Emplid;
                pInfo.FirstName = campusconnectinfo.FirstName;
                pInfo.LastName = campusconnectinfo.LastName;
                UserFactory.SaveToDb(pInfo);
            }
            e.DPUID = pInfo.DPUID;
            e.RealName = string.Format("{0}, {1}", pInfo.FirstName, pInfo.LastName);

            AddFormCookie(e);

            

            return true;
        }
    }
}
