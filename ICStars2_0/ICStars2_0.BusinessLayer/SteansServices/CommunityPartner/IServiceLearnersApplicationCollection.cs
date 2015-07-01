using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model;
using ICStars2_0.Model.Settings;

namespace ICStars2_0.BusinessLayer.SteansServices.CommunityPartner
{
    public interface IServiceLearnersApplicationCollection : IEnumerable<ServiceLearnersApplication>
    {
        int Count { get; set; }
        int PageIndex { get; set; }
        int PageSize { get; set; }
        ServiceLearnersApplicationCollectionSettings Settings { get; set; } 
    }
}
