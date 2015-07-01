using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.Items;
using ICStars2_0.Model.Settings;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.CBOServices
{
    #region =CBOFactory=
    internal class CBOFactory : ICBOFactory, IWeakReferenceRegister
    {
        [Dependency]
        public IDB_CBO DB_CBO { get; set; }
        /// <summary>
        /// Build CBO SelectListItem list for Dropdownlist
        /// </summary>
        /// <param name="seletedCBOID">selectedCBOID indicates which item to be selected</param>
        /// <returns></returns>
        public IEnumerable<SelectListItem> BuildCBOSeleteListItems(int seletedCBOID)
        {
            return BuildCBOSeleteListItems(seletedCBOID, null);
        }
        /// <summary>
        /// Build CBO SelectListItem list for Dropdownlist
        /// </summary>
        /// <param name="seletedCBOID">selectedCBOID indicates which item to be selected</param>
        /// <param name="settings">CBOCollectionSettings</param>
        /// <returns></returns>
        public IEnumerable<SelectListItem> BuildCBOSeleteListItems(int seletedCBOID,CBOCollectionSettings settings)
        {
            return CreateCBOCollection(1, 1000,settings).Select(
                    r =>
                    new SelectListItem { Text = r.Name, Value = r.ID.ToString(), Selected = r.ID ==seletedCBOID });
        }

        public IEnumerable<SelectListItem> BuildCBOSeleteListItems()
        {
            return BuildCBOSeleteListItems(0, null);
        }

        public ICBOCollection CreateEmptyCBOCollection()
        {
            return CreateCBOCollection(0, 0);
        }

        public ICBOCollection CreateCBOCollection(int pageIndex, int pageSize)
        {
            return CreateCBOCollection(pageIndex, pageSize, null);
        }

        public ICBOCollection CreateCBOCollection(int pageIndex, int pageSize, CBOCollectionSettings settings)
        {
            var i = ICStarsUnityContainer.Current.Resolve<CBOCollection>();
            i.PageIndex = pageIndex;
            i.PageSize = pageSize;
            i.Settings = settings;
            return i;
        }

        public CBO Create(int id)
        {
            CBO m = new CBO();
            if (id > 0)
            {
                ReflectionHelper.Fill(DB_CBO.CBOInfo(id), m);
            }
            return m;
        }
        public CBO Update(CBO m)
        {
            if (m.ID > 0)
            {
                DB_CBO.Update(m);
            }
            else
            {
                m.ID = DB_CBO.Add(m);
            }
            return m;
        }
        public int Delete(int ID)
        {
            return DB_CBO.Delete(ID);
        }
        public bool Exists(int ID)
        {
            return DB_CBO.Exists(ID);
        }

        public int UpdateSlc(int id, string slc)
        {
            return DB_CBO.UpdateSlc(id, slc);
        }

        public bool Exists(string cboName)
        {
            return DB_CBO.Exists(cboName);
        }
    }
    #endregion
}
