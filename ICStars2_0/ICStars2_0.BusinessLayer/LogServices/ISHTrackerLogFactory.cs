using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.LogServices
{
    public interface ISHTrackerLogFactory
    {
        ISHTrackerLogCollection CreateSHTracherLogCollection(int pageIndex, int pageSize);
        SHTrackerLog Create(int id);
        SHTrackerLog Update(SHTrackerLog m);
        int Delete(int ID);
        bool Exists(int ID);
    }
}
