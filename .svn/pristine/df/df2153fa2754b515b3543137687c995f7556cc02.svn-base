using System;
using System.Collections.Generic;
using System.Text;
using ICStars2_0.Common.ConfigSections;

namespace ICStars2_0.Framework.HttpSecurity
{
    internal class PathMatcherFactory
    {
        public static IPathMatcher CreatePathMatcher(string path, HttpsPath httpsPath)
        {
            switch (httpsPath.MatchType)
            {
                    case PathMatchType.StartsWith:
                    return new StartsWithPathMatcher(path, httpsPath.Path);
                    
                    case PathMatchType.Exact:
                    return new ExactPathMatcher(path, httpsPath.Path);
                    
            }
            return null;
        }
    }
}
