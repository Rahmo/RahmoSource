using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Web;
using ICStars2_0.Common.ConfigSections;

namespace ICStars2_0.Framework.HttpSecurity
{
    class PathsMatcher
    {
        
        public HttpContext Context { get; set; }
        public IEnumerable<HttpsPath> Paths { get; set; }
        public PathsMatcher(HttpContext context, IEnumerable<HttpsPath> paths)
        {
            Context = context;
            Paths = paths;
        }
        public bool IsMatch()
        {
            return Paths.Any(p => PathMatcherFactory.CreatePathMatcher(Context.Request.Url.AbsolutePath, p).IsMatch());
        }
    }
}
