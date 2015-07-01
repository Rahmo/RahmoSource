using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.DbContexts;
using ICStars2_0.Framework;

namespace Commengdpu.DBLayer
{
    class DbCommunityPartner2IndividualPartner:IDbCommunityPartner2IndividualPartner,ISingletonRegister
    {
        public int Insert(IEnumerable<CommunityPartner2IndividualPartner> communityPartner2IndividualPartners)
        {
            using (var db = new DefaultDbContext())
            {
                foreach (var p2c in communityPartner2IndividualPartners)
                {
                    db.CommunityPartner2IndividualPartners.Add(p2c);
                }
                return db.SaveChanges();
            }
        }

        public int Delete(IEnumerable<CommunityPartner2IndividualPartner> communityPartner2IndividualPartners)
        {
            using (var db = new DefaultDbContext())
            {
                foreach (var p2c in communityPartner2IndividualPartners)
                {
                    db.Entry(p2c).State = EntityState.Deleted;
                }
                return db.SaveChanges();
            }
        }

        public int DeleteByIndividualPartnerId(int individualPartnerID)
        {
            using (var db = new DefaultDbContext())
            {
                return db.Database.ExecuteSqlCommand("Delete From CommunityPartner2IndividualPartner Where IndividualPartnerID=@IndividualPartnerID", new[] { new SqlParameter("@IndividualPartnerID", SqlDbType.Int) { Value = individualPartnerID } });

            }
        }

        public IEnumerable<CommunityPartner2IndividualPartner> List(int individualPartnerID)
        {
            using (var db = new DefaultDbContext())
            {
                return db.CommunityPartner2IndividualPartners.Where(p2c => p2c.IndividualPartnerID == individualPartnerID).ToList();
            }
        }
    }
}
