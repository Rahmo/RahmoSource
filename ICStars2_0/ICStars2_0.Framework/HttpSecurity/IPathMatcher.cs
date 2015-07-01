using System;
using System.Collections.Generic;
using System.Text;

namespace ICStars2_0.Framework.HttpSecurity
{
    interface IPathMatcher
    {
        bool IsMatch();
    }
}
