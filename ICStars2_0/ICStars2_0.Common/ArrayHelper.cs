using System;
using System.Collections.Generic;
using System.Text;
using System.Text.RegularExpressions;

namespace ICStars2_0.Common
{
    public static class ArrayHelper
    {
        public static string ToString<T>(T[] o, string separateChar)
        {
            StringBuilder str = new StringBuilder();

            foreach (T s in o)
            {
                str.Append(s);
                str.Append(separateChar);
            }

            return Regex.Replace(str.ToString(), separateChar + "$", string.Empty);
        }
    }
}
