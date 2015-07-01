using System;
using System.Xml;
using System.Reflection;

namespace ICStars2_0.Common.XML
{
    /// <summary>
    /// 从XML文件生成类
    /// created by lihui_830501@163.com 20090519
    /// </summary>
    public class ClassBuilder
    {
        private XmlDocument _document = null;
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="xml">XML文档 XmlDocument类型</param>
        public ClassBuilder(XmlDocument xml)
        {
            _document = xml;
        }
        /// <summary>
        /// 生成类
        /// </summary>
        /// <param name="oClass">目标类</param>
        /// <returns>由XML文件初化后的类</returns>
        public object Build(object oClass)
        {
            Type tClass = oClass.GetType();
            string rootName = tClass.Name;
            XmlNode root = _document.SelectSingleNode(rootName);
            foreach (PropertyInfo pi in tClass.GetProperties())
            {
                if (pi.PropertyType.BaseType == typeof(Enum))
                {
                    pi.SetValue(oClass, Enum.Parse(pi.PropertyType, root.SelectSingleNode(pi.Name).InnerText), null);
                    continue;
                }
                pi.SetValue(oClass, Convert.ChangeType( root.SelectSingleNode(pi.Name).InnerText,pi.PropertyType), null);
            }
            return oClass;
        }
    }
    /// <summary>
    /// 从XML文件生成类
    /// created by lihui_830501@163.com 20090519
    /// </summary>
    public class ClassBuilder<TClass>
    {
        private XmlDocument _document = null;
        /// <summary>
        /// 构造
        /// </summary>
        /// <param name="xml">XML文档 XmlDocument类型</param>
        public ClassBuilder(XmlDocument xml)
        {
            _document = xml;
        }
        /// <summary>
        /// 生成类
        /// </summary>
        /// <returns>由XML文件初化后的TClass</returns>
        public TClass Build()
        {
            Type tClass = typeof(TClass);
            object oClass = Activator.CreateInstance(tClass);
            string rootName = tClass.Name;
            XmlNode root = _document.SelectSingleNode(rootName);
            foreach (PropertyInfo pi in tClass.GetProperties())
            {
                if(!pi.CanWrite) continue;
                var node = root.SelectSingleNode(pi.Name);
                if(node == null) continue;
                pi.SetValue(oClass, Convert.ChangeType(node.InnerText, pi.PropertyType), null);
            }
            return (TClass)oClass;
        }
    }
}
