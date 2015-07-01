using System;

namespace ICStars2_0.Common.Attributes
{
    [AttributeUsage(AttributeTargets.All)]
    public class IsShowAttribute:Attribute
    {
        public bool IsShow { get; set; }      
        public IsShowAttribute(bool isShow)
        {
            IsShow = isShow;
        }
    }
}
