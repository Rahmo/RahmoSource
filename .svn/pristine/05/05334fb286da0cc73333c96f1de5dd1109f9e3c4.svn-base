
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.SteansServices.CommunityInternshipServices
{
    #region =CommunityInternshipFactory=
    internal class CommunityInternshipFactory : ICommunityInternshipFactory, IWeakReferenceRegister
    {
        [Dependency]
        public IDB_CommunityInternship DB_CommunityInternship { get; set; }
        public ICommunityInternshipCollection CreateCommunityInternshipCollection(int pageIndex, int pageSize)
        {
            var i = ICStarsUnityContainer.Current.Resolve<CommunityInternshipCollection>();
            i.PageIndex = pageIndex;
            i.PageSize = pageSize;
            return i;
        }
        public CommunityInternship Create(int id)
        {
            CommunityInternship m = new CommunityInternship();
            if (id > 0)
            {
                ReflectionHelper.Fill(DB_CommunityInternship.CommunityInternshipInfo(id), m);
            }
            return m;
        }
        public CommunityInternship Update(CommunityInternship m)
        {
            if (m.ID > 0)
            {
                DB_CommunityInternship.Update(m);
            }
            else
            {
                m.ID = DB_CommunityInternship.Add(m);
            }
            return m;
        }
        public int Delete(int ID)
        {
            return DB_CommunityInternship.Delete(ID);
        }
        public bool Exists(int ID)
        {
            return DB_CommunityInternship.Exists(ID);
        }
    }
    #endregion
}
