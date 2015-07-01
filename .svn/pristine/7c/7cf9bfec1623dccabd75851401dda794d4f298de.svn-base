using System;
using System.ComponentModel;
using ICStars2_0.Common.Attributes;

namespace ICStars2_0.Common
{
    public static class EnumHelper
    {
        /// <summary>
        /// Get the description of the Enum
        /// </summary>
        /// <param name="e">Enum Value</param>
        /// <returns>Description</returns>
        public static string GetDescription(Enum e)
        {
            var fi = e.GetType().GetField(e.ToString());
            var attributes = (DescriptionAttribute[])fi.GetCustomAttributes(typeof(DescriptionAttribute), false);
            return (attributes != null && attributes.Length > 0) ? attributes[0].Description : e.ToString();
        }
        public static bool GetIsShow(Enum e)
        {
            var fi = e.GetType().GetField(e.ToString());
            var attributes = (IsShowAttribute[])fi.GetCustomAttributes(typeof(IsShowAttribute), false);
            return (attributes != null && attributes.Length > 0) ? attributes[0].IsShow : true;
        }
        public static bool IsString(Enum e)
        {
            var fi = e.GetType().GetField(e.ToString());
            var attributes = (IsStringAttribute[])fi.GetCustomAttributes(typeof(IsStringAttribute), false);
            return (attributes != null && attributes.Length > 0) ? attributes[0].IsString : false;
        }
    }
}
