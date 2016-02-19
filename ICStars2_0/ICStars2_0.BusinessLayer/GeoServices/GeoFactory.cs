using ICStars2_0.Framework;
using ICStars2_0.Model.DbContexts;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace ICStars2_0.BusinessLayer.GeoServices
{

    class GeoFactory : IGeoFactory, IWeakReferenceRegister // it is important to put IweakRefernce for unity injections
    {
       
       

        public int Add(Model.GEO133 model)
        {
 
            using (var db = new GeoDbContext())
            {

                db.GEO133.Add(model);
                db.Configuration.ValidateOnSaveEnabled = true; //todo remove this to enable validations
              return  db.SaveChanges();
            }
            //throw new NotImplementedException();
        }

        public int Delete(Model.GEO133 model)
        {
            using (var db = new GeoDbContext())
            {
                db.Entry(model).State = EntityState.Deleted;
                return db.SaveChanges();
            }
           // throw new NotImplementedException();
        }

        public int Update(Model.GEO133 model)
        {
            using (var db = new GeoDbContext())
            {
                db.Entry(model).State = EntityState.Modified;
                return db.SaveChanges();
            }
            //throw new NotImplementedException();
        }
    }
}
