using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.ProgramServices
{
    public interface IProgramFactory
    {
        IEnumerable<Program> CreateList();
    }
}
