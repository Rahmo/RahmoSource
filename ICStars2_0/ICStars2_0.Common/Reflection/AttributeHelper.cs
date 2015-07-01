using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace ICStars2_0.Common.Reflection
{
    public static class AttributeHelper
    {
        public static object[] GetAttributes(Type classType,Type attributeType)
        {
            return classType.GetCustomAttributes(attributeType, false);
        }
        public static object GetValueOfAttribute(Type classType, Type attributeType, string propertyName)
        {
            var columnAttributes = GetAttributes(classType, attributeType);
            if (columnAttributes != null && columnAttributes.Length > 0)
            {
                var attri = columnAttributes[0];
                var tAttri = attri.GetType();
                var tAttriProperty = tAttri.GetProperties().First(p => p.Name.Equals(propertyName));
                return tAttriProperty.GetValue(attri, null);
            }
            return null;
        }
    }
}
