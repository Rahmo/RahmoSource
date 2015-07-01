using System;
using System.Collections.Generic;
using System.Text;

namespace ICStars2_0.Common.Reflection
{
    [AttributeUsage(AttributeTargets.Class, Inherited = false, AllowMultiple = false)]
    public class DbTableAttribute : Attribute
    {
        public string Name { get; set; }
    }
}
