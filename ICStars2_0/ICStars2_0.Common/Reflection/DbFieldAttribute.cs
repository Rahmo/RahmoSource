using System;

namespace ICStars2_0.Common.Reflection
{
    /// <summary>
    /// 反射属性时可用此标签名称代替属性名称映射数据库字段
    /// 并且可设置字段长度
    /// created by lihui 20100716
    /// </summary>
    [AttributeUsage(AttributeTargets.Property, Inherited = false, AllowMultiple = false)]
    public class DbFieldAttribute : Attribute
    {
        /// <summary>
        /// Name of db field
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// Length of varchar
        /// </summary>
        public int Size { get; set; }
    }
}
