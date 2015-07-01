using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICStars2_0.Common;

namespace ICStars2_0.Model
{
    public static class Extensions
    {
        public static string Truncate(this string s, int length)
        {
            if (string.IsNullOrEmpty(s) || s.Length <= length) return s;
            return s.Substring(0, length > s.Length ? s.Length : length) + "...";
        }
    }
}
