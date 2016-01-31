using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICStars2_0.Model;
namespace ICStars2_0.BusinessLayer.GeoServices
{
    public interface IGeoFactory
    {

        int Add( GEO133 model);

        int Delete(GEO133 model);
        int Update(GEO133 model);
    }
}
