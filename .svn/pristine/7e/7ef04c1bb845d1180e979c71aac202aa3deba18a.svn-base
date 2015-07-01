using System;
using System.Collections.Generic;
using System.Text;

namespace ICStars2_0.Framework.HttpSecurity
{
    internal class StartsWithPathMatcher:IPathMatcher
    {
        public string Path { get; set; }
        public string Pattern { get; set; }
        public StartsWithPathMatcher(string path, string pattern)
        {
            Path = path;
            Pattern = pattern;
        }
        public bool IsMatch()
        {
            return Path.StartsWith(Pattern, StringComparison.InvariantCultureIgnoreCase);
        }
    }
}
