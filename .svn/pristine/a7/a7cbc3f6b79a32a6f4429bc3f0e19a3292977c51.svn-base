using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Items;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.BusinessLayer.CBOServices
{

    public interface ICBOFactory
    {
        IEnumerable<SelectListItem> BuildCBOSeleteListItems(int seletedCBOID);
        IEnumerable<SelectListItem> BuildCBOSeleteListItems(int seletedCBOID,CBOCollectionSettings settings);
        IEnumerable<SelectListItem> BuildCBOSeleteListItems();
        ICBOCollection CreateEmptyCBOCollection();
        ICBOCollection CreateCBOCollection(int pageIndex, int pageSize);
        ICBOCollection CreateCBOCollection(int pageIndex, int pageSize,CBOCollectionSettings settings);
        CBO Create(int id);
        CBO Update(CBO m);
        int Delete(int ID);
        bool Exists(int ID);
        int UpdateSlc(int id, string slc);
        bool Exists(string cboName);
    }
}
