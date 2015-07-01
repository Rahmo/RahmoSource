using System;

namespace ICStars2_0.Common.Attributes
{
    [AttributeUsage(AttributeTargets.All)]
    public class IsStringAttribute:Attribute
    {
        public bool IsString { get; set; }      
        public IsStringAttribute(bool isString)
        {
            IsString = isString;
        }
    }
}
