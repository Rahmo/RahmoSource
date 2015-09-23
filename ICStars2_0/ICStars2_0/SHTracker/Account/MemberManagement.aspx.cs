﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.Common.Attributes;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;
using Org.BouncyCastle.Crypto.Engines;
using ICStars2_0.Model.DbContexts;

namespace ICStars2_0.SHTracker.Account
{
    [Authorize(Roles = "admin,admin_account,admin_account_slc")]
    public partial class MemberManagement : System.Web.UI.Page
    {
        private IMemberFactory _memberFactory;

        [Dependency]
        public IMemberFactory MemberFactory
        {
            get { return _memberFactory; }
            set { _memberFactory = value; }
        }
        private IRoleFactory _roleFactory;

        [Dependency]
        public IRoleFactory RoleFactory
        {
            get { return _roleFactory; }
            set { _roleFactory = value; }
        }

        public string[] CurrentRoles
        {
            get; set;
        }

        protected override void OnInit(EventArgs e)
        {
            base.OnInit(e);
            CurrentRoles = Roles.GetRolesForUser();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            IRoleCollection rc = RoleFactory.CreateRoleCollection(1, 1000);
            rptMemberType.DataSource = rc.Where(m => m.RoleEnumType == RoleType.MemberType);
            

            var settings = new MemberCollectionSettings {MemberRoles = new[] {"admin"}};
            if (!string.IsNullOrEmpty(Request.QueryString["mt"]))
            {
                settings = new MemberCollectionSettings
                    {
                        MemberType = (MemberType) Enum.Parse(typeof (MemberType), Request.QueryString["mt"])
                    };
            }
            if (!string.IsNullOrEmpty(Request.QueryString["roles"]))
            {
                settings = new MemberCollectionSettings { MemberRoles = Request.QueryString["roles"].Split(',') };
            }
            if (!string.IsNullOrEmpty(Request.QueryString["other"]))
            {
                settings = new MemberCollectionSettings { MemberRoles = rc.Where(m => m.RoleEnumType == RoleType.Role && !m.Name.Equals("admin")).Select(m => m.Name).ToArray() };
            }
            if (!string.IsNullOrEmpty(Request.QueryString["all"]))
            {
                settings = null;
            }
            if (User.IsInRole("admin_account_slc"))
            {
                rptMemberType.DataSource = rc.Where(r => r.Name.Equals("SLC"));
                settings = new MemberCollectionSettings() {MemberType = MemberType.SLC};

            }
            settings.IsInitalize = true;
            var mc = MemberFactory.CreateMemberCollection(pageBar1.CurrentIndex, pageBar1.Size, settings);
           
            rptList.DataSource = mc;
            pageBar1.Total = mc == null ? 0 : mc.Count;


            rptMemberType.DataBind();
            rptList.DataBind();

        }
        protected void lbtDeleteMember_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            MemberFactory.Delete(id);
            Response.Redirect("MemberManagement.aspx");
        }

       
        protected void LockMember_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            MemberFactory.Lock(id);
            Response.Redirect("MemberManagement.aspx");
        }
        protected void ActiveMember_Click(object sender, EventArgs e)
        {
            int id = 0;
            LinkButton lb = sender as LinkButton;
            int.TryParse(lb.CommandArgument, out id);
            MemberFactory.Active(id);
            Response.Redirect("MemberManagement.aspx");
        }

        protected void BtnSearch(object sender, EventArgs e)
        {
               MemberDbContext db = new MemberDbContext();
        
            MemberCollectionSettings settings = new MemberCollectionSettings();
            string searchText = Request.QueryString["SearchText"];
            string searchType = Request.QueryString["SearchType"];
            int UsersTotal = db.Members.Count();
        
            settings.IsInitalize = true;
            var mc = MemberFactory.CreateMemberCollection(pageBar1.CurrentIndex, UsersTotal, settings); // this check the max users numbers then load the grid for search on it the user needed.
            switch (searchType)
            {
                case "1":
                   // settings.FirstNameForSearch = searchText;
                    
                     

            rptList.DataSource = mc.Where( m => m.FirstName == searchText.ToLower() || m.FirstName == searchText.ToUpper());
            if (mc == null) {
                pageBar1.Total = 0;
            }
            else{
            pageBar1.Total=mc.Count;}
            //pageBar1.Total=mc==null?0:mc.Count;

            rptMemberType.DataBind();
            rptList.DataBind();
                    break;

                case "2":
                    rptList.DataSource = mc.Where( m => m.LastName == searchText.ToLower() || m.LastName == searchText.ToUpper() );
            if (mc == null) {
                pageBar1.Total = 0;
            }
            else{
            pageBar1.Total=mc.Count;}
            //pageBar1.Total=mc==null?0:mc.Count;

            rptMemberType.DataBind();
            rptList.DataBind();
                    break;

                case "3":
                  rptList.DataSource = mc.Where( m => m.CampusConnectID == searchText.ToUpper() || m.CampusConnectID == searchText.ToLower() );
            if (mc == null) {
                pageBar1.Total = 0;
            }
            else{
            pageBar1.Total=mc.Count;}
            //pageBar1.Total=mc==null?0:mc.Count;

            rptMemberType.DataBind();
            rptList.DataBind();
                    break;
            }
            
        

        }

       

      
    }
}