using System;
using System.Collections.Generic;
using System.Text;

namespace ICStars2_0.Framework.HttpSecurity
{
   internal class ExactPathMatcher:IPathMatcher
    {
        public string Path { get; set; }
        public string Pattern { get; set; }
        public ExactPathMatcher(string path, string pattern)
        {
            Path = path;
            Pattern = pattern;
        }
       public bool IsMatch()
       {
           return Path.Equals(Pattern, StringComparison.InvariantCultureIgnoreCase);
       }
    }
}
