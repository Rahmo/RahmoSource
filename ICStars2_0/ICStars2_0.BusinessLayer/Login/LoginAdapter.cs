﻿using System;
using System.Configuration;
using System.Linq;
using System.Net;
using System.Security.Principal;
using System.Web;
using System.Web.Configuration;
using System.Web.Security;
using CampusConnect.MediatorLibrary;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.Common;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.Login
{

    class LoginAdapter : ILogin, ISingletonRegister
    {

        [Dependency]
        public IMemberFactory MemberFactory { get; set; }
        public bool IsLogin()
        {
            return false;
        }
        /// <summary>
        /// Please use ICStars2_0.BusinessLayer.Provider.IUserData instead
        /// </summary>
        /// <returns></returns>
        [Obsolete]
        public IUserInfo GetLoginedUserInfo()
        {
            return null;
        }

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

            var userData = string.Format("ID:{0}|RealName:{1}|QuarterYear:{2}|DPUID:{3}", e.ID, e.RealName, e.QuarterYear,e.DPUID);
            var lcookie = FormsAuthentication.GetAuthCookie(e.CampusConnectID, true);
            var ticket = FormsAuthentication.Decrypt(lcookie.Value);
            var newTicket = new FormsAuthenticationTicket(ticket.Version, ticket.Name, ticket.IssueDate, ticket.Expiration, ticket.IsPersistent, userData);
            lcookie.Value = FormsAuthentication.Encrypt(newTicket);
            HttpContext.Current.Response.Cookies.Add(lcookie);
        }
        /// <summary>
        /// For students(includes MCI) to login only (StudentApp)
        /// </summary>
        /// <param name="e"></param>
        /// <returns></returns>
        public bool LoginStudent(LoginEventArgs e)
        {
            Logout(e);
            var skiplValidation = false;
            //username "StudentApp" is for testing
            if (e.CampusConnectID.Equals("SlcStudent"))
            {
                e.DPUID = "1234123";
                var member = MemberFactory.Create("SlcStudent");
                if (!member.Status) return false;
                skiplValidation = true;
            }
            //Campusconnect interface
            ICampusConnectMediator mediator = CampusConnectFactory.CreateCampusConnectMediaor();
            var campusconnectinfo = mediator.GetUserInfo(e.CampusConnectID, e.Password);
            //if user is StudentApp, then skip valication.
            if (!skiplValidation)
            {
                if (campusconnectinfo == null) return false;

            }
            Member pInfo;
            //if this campusconnectid is not in the system, then create one.
            if (!MemberFactory.Exists(e.CampusConnectID))
            {
                BrowserInfo bi = new BrowserInfo();
                string ip = bi.IP;
                pInfo = new Member();
                pInfo.CampusConnectID = e.CampusConnectID;

                pInfo.Status = true;
                pInfo.IP = ip;
                pInfo.LastLoginDate = DateTime.Now;
                pInfo.EmplID = campusconnectinfo.Emplid;
                pInfo.FirstName = campusconnectinfo.FirstName;
                pInfo.LastName = campusconnectinfo.LastName;
                //insert student info and roles into database
                if (MemberFactory.Update(pInfo).ID > 0)
                {
                    Roles.AddUserToRole(e.CampusConnectID, e.Roles);
                }
            }
                //if this campusconnectid exists 
            else
            {
                //check roles
                if (!Roles.IsUserInRole(e.CampusConnectID, e.Roles)) return false;
                //retrieve student info from database
                pInfo = MemberFactory.Create(e.CampusConnectID);

                //double check user's DePaul ID, First Name, Last Name
                bool needToUpdate = false;
                //sometimes peoplesoft server is busy or down, then we will lose the connection between peoplesoft and steans. This causes failed DePaul ID retrieve.
                if (string.IsNullOrEmpty(pInfo.EmplID) || pInfo.EmplID.Equals("False"))
                {
                    pInfo.EmplID = campusconnectinfo.Emplid;
                    if (!string.IsNullOrEmpty(pInfo.EmplID))
                    {
                        needToUpdate=true;
                    }
                }
                if (string.IsNullOrEmpty(pInfo.FirstName))
                {
                    pInfo.FirstName = campusconnectinfo.FirstName;
                    if (!string.IsNullOrEmpty(pInfo.FirstName))
                    {
                        needToUpdate=true;
                    }
                }
                if (string.IsNullOrEmpty(pInfo.LastName))
                {
                    pInfo.LastName = campusconnectinfo.LastName;
                    if (!string.IsNullOrEmpty(pInfo.LastName))
                    {
                        needToUpdate=true;
                    }
                }
                if (needToUpdate)
                {
                    MemberFactory.Update(pInfo);
                }
            }

            e.ID = pInfo.ID;
            e.DPUID = pInfo.EmplID;
            e.RealName = string.Format("{0}, {1}", pInfo.FirstName, pInfo.LastName);
            AddFormCookie(e);

            
            return true;
        }
        /// <summary>
        /// For SHTracker
        /// </summary>
        /// <param name="e"></param>
        /// <returns></returns>
        public bool Login(LoginEventArgs e)
        {
            Logout(e);
            var skiplValidation = false;
            //CSSP is a username for testing
            if (e.CampusConnectID.Equals("CSSP"))
            {
                var member = MemberFactory.Create("CSSP");
                if (!member.Status) return false;
                skiplValidation = true;
            }
            ICampusConnectMediator mediator = CampusConnectFactory.CreateCampusConnectMediaor();
            var campusconnectinfo = mediator.GetUserInfo(e.CampusConnectID, e.Password);
            if (!skiplValidation)
            {
                if (campusconnectinfo==null) return false;
                if (!MemberFactory.Exists(e.CampusConnectID)) return false;
            }
            #region =Student/MCI is not allowed to login=

            var userRoles = Roles.GetRolesForUser(e.CampusConnectID);
            if (userRoles.Length == 1 && (userRoles[0].Equals("Student") || userRoles[0].Equals("MCI"))) return false;
            if (userRoles.Length == 2 && userRoles.Contains("Student") && userRoles.Contains("MCI")) return false;
            
            #endregion
            
            BrowserInfo bi = new BrowserInfo();
            string ip = bi.IP;
            Member pInfo = MemberFactory.Create(e.CampusConnectID);
            pInfo.IP = ip;
            pInfo.LastLoginDate = DateTime.Now;
            MemberFactory.Update(pInfo);
            e.ID = pInfo.ID;
            if (string.IsNullOrEmpty(pInfo.EmplID))
            {
                pInfo.EmplID = campusconnectinfo.Emplid;
                MemberFactory.Update(pInfo);
            }
            e.DPUID = pInfo.EmplID;
            e.RealName = string.Format("{0}, {1}", pInfo.FirstName, pInfo.LastName);

            AddFormCookie(e);

            

            return true;
        }

        public bool LoginWithoutRoles(LoginEventArgs e)
        {
            Logout(e);
            //Campusconnect interface
            ICampusConnectMediator mediator = CampusConnectFactory.CreateCampusConnectMediaor();
            var campusconnectinfo = mediator.GetUserInfo(e.CampusConnectID, e.Password);

            if (campusconnectinfo == null) return false;

            e.ID = 0;
            e.DPUID = campusconnectinfo.Emplid;
            e.RealName = string.Format("{0}, {1}", campusconnectinfo.FirstName, campusconnectinfo.LastName);
            AddFormCookie(e);


            return true;
        }
    }
}
