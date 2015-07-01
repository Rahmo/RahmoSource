﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Commengdpu.Models;
using Commengdpu.Models.Reports;
using Commengdpu.Models.Settings;

namespace Commengdpu.BusinessLayer.ProjectTypeServices
{
    public interface IProjectTypeFactory
    {
        IEnumerable<ProjectType> CreateList();
    }
}
