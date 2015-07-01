using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.DbContexts;
using Commengdpu.Models.Settings;
using ICStars2_0.Common.Lambda;
using ICStars2_0.Framework;

namespace Commengdpu.DBLayer
{
    class DbCategory : IDbCategory, ISingletonRegister
    {
        public int Insert(Category category)
        {
            using (var db = new DefaultDbContext())
            {
                db.Categories.Add(category);
                return db.SaveChanges();
            }
        }

        public int Update(Category category)
        {
            using (var db = new DefaultDbContext())
            {
                db.Entry(category).State = EntityState.Modified;
                return db.SaveChanges();
            }
        }

        public int Delete(Category category)
        {
            using (var db = new DefaultDbContext())
            {
                db.Entry(category).State = EntityState.Deleted;
                return db.SaveChanges();
            }
        }

        public Category Create(int ID)
        {
            using (var db = new DefaultDbContext())
            {
                return db.Categories.Find(ID);
            }
        }

        public IEnumerable<Category> List()
        {
            using (var db = new DefaultDbContext())
            {
                return db.Categories.OrderBy(a => a.OrderByID).AsNoTracking().ToList();
            }
        }

        public IEnumerable<Category> List(int pageIndex, int pageSize, CategoryCollectionSettings settings = null)
        {
            using (var db = new DefaultDbContext())
            {
                var predicate = BuildPredicate(db, settings);
                return db.Categories.Where(predicate).OrderByDescending(a => a.ID)
                    .Skip((pageIndex - 1) * pageSize)
                    .Take(pageSize).AsNoTracking().ToList();
            }
        }

        public int Count(CategoryCollectionSettings settings = null)
        {
            using (var db = new DefaultDbContext())
            {
                var predicate = BuildPredicate(db, settings);
                return db.Categories.Where(predicate).AsNoTracking().Count();
            }
        }

        public bool Exists(string name)
        {
            using (var db = new DefaultDbContext())
            {
                return db.Categories.Any(c => c.Name.Equals(name));
            }
        }

        /// <summary>
        /// Build a Lambda expression as a condition to filter categoris
        /// </summary>
        /// <param name="db">DefaultDbContext</param>
        /// <param name="settings">CategoryCollectionSettings</param>
        /// <returns>Lambda expression for "Where"</returns>
        private Expression<Func<Category, bool>> BuildPredicate(DefaultDbContext db, CategoryCollectionSettings settings)
        {
            var predicate = PredicateBuilder.True<Category>();

            if (settings != null)
            {
                if (settings.ParentID >0)
                {
                    predicate = predicate.And(c => c.ParentID == settings.ParentID);
                }

            }
            return predicate;
        } 
    }
}
