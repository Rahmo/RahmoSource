using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.Settings;

namespace Commengdpu.DBLayer
{
    public interface IDbRole
    {
        int Insert(Role role);
        int Update(Role role);
        Role Create(int ID);
        IEnumerable<Role> List();
    }
}
