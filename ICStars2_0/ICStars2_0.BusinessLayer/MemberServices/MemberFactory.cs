using System;
using System.Web.Security;
using ICStars2_0.Common;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.Enum;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.MemberServices
{
    internal class MemberFactory : IMemberFactory, IWeakReferenceRegister
    {
        [Dependency]
        public IDB_Member DB_Member { get; set; }

        public IMemberCollection CreateMemberCollection(int pageIndex, int pageSize, MemberCollectionSettings settings)
        {
            var i = ICStarsUnityContainer.Current.Resolve<MemberCollection>();
            i.PageIndex = pageIndex;
            i.PageSize = pageSize;
            i.Settings = settings;
            if (settings.IsInitalize)
            {
                i.Initalize();
            }
            return i;
        }

        public IMemberCollection CreateMemberCollection(int pageIndex, int pageSize)
        {
            return CreateMemberCollection(pageIndex, pageSize,
                new MemberCollectionSettings {MemberType = MemberType.NULL});
        }
        public IMemberCollection CreateSLCCollection(int pageIndex, int pageSize)
        {
            var i = ICStarsUnityContainer.Current.Resolve<SLCCollection>();
            i.PageIndex = pageIndex;
            i.PageSize = pageSize;
            return i;
        }
        public IMemberCollection CreateFacultyCollection(int pageIndex, int pageSize)
        {
            var i = ICStarsUnityContainer.Current.Resolve<FacultyCollection>();
            i.PageIndex = pageIndex;
            i.PageSize = pageSize;
            return i;
        }
        public void CreateSuperAdminUser()
        {
            //added this for SLC Dummy account PWD is 123456
            if(!Roles.RoleExists("admin"))
            {
                Roles.CreateRole("admin");
            }
            if (Exists("SLCstudent")) return;
            var m = new Member()
            {
                CampusConnectID = "SlcStudent",
                EmplID = "123123",  
                Email = "SLCstudent@depaul.edu",

                Status = true
            };
            Update(m);
            if (!Roles.IsUserInRole("SLCstudent", "Student"))
            {
                Roles.AddUserToRole("SLCstudent", "Student");
            }
            //if (Exists("hli25")) return;
            //var m = new Member()
            //            {
            //                CampusConnectID = "hli25",
            //                Email = "hli25@depaul.edu",
            //                Status = true
            //            };
            //Update(m);
            //if (!Roles.IsUserInRole("hli25", "admin"))
            //{
            //    Roles.AddUserToRole("hli25", "admin");
            //}
        }
        public bool IsLocked(string campusConnectId)
        {
            return DB_Member.IsLocked(campusConnectId);
        }

        public Member Create(string campusConnectId)
        {
            Member m = new Member();
            
            if (string.IsNullOrEmpty(campusConnectId) == false)
            {
                ReflectionHelper.Fill(DB_Member.MemberInfo(campusConnectId), m);
            }
            return m;
        }
        public MemberForEdit CreateMemberForEdit(int id)
        {
            var m = new MemberForEdit();
            if (id > 0)
            {
                ReflectionHelper.Fill(DB_Member.MemberInfo(id), m);
            }
            return m;
        }
        public Member Create(int id)
        {
            var m = new Member();
            if (id > 0)
            {
                ReflectionHelper.Fill(DB_Member.MemberInfo(id), m);
            }
            return m;
        }
        public BaseMember Update(BaseMember m)
        {
            if (m.ID > 0)
            {
                DB_Member.Update(m);
            }
            else
            {
                m.ID = DB_Member.Add(m);
            }
            return m;
        }
        public int Delete(int ID)
        {
            return DB_Member.Delete(ID);
        }
        public int Active(int ID)
        {
            return DB_Member.Active(ID);
        }
        public int Lock(int ID)
        {
            return DB_Member.Lock(ID);
        }
        public bool Exists(int ID)
        {
            return DB_Member.Exists(ID);
        }
        public bool Exists(string campusConnectId)
        {
            return DB_Member.Exists(campusConnectId);
        }
    }
}
