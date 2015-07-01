using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.BusinessLayer.SteansServices.CommunityPartner
{
    public interface IServiceLearnersApplicationFactory
    {
        IServiceLearnersApplicationCollection CreateServiceLearnersApplicationCollection(int pageIndex, int pageSize,ServiceLearnersApplicationCollectionSettings settings);
        ServiceLearnersApplication Create(int id);
        ServiceLearnersApplication Update(ServiceLearnersApplication m);
        int Delete(int ID);
        bool Exists(int ID);
    }
}
