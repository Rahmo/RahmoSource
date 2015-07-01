using System;
using System.Text;
using System.Xml;
using System.Reflection;

namespace ICStars2_0.Common.XML
{
    /// <summary>
    /// 从一个类生成XML文件,只生成类的属性
    /// created by lihui_830501@163.com 20090519
    /// </summary>
    public class XmlBuilder
    {

        private XmlDocument _document;
        private XmlNode _root;
        private Type tClass;
        private object oClass;
        public XmlBuilder(object oClass):this(oClass,"UTF-8"){}
        public XmlBuilder(object oClass,string encoding)
        {
            _document = new XmlDocument();
            XmlDeclaration dec = _document.CreateXmlDeclaration("1.0", encoding, null);
            _document.InsertBefore(dec, _document.DocumentElement);
            this.oClass = oClass;
            tClass = oClass.GetType();
            _root = _document.CreateElement(tClass.Name);
        }
        /// <summary>
        /// 生成XML文件
        /// </summary>
        /// <returns>返回XmlDocument文档</returns>
        public XmlDocument Build()
        {
            foreach (PropertyInfo pi in tClass.GetProperties())
            {
                BuildNode(pi.Name, Convert.ToString(pi.GetValue(oClass, null)));
            }

            _document.AppendChild(_root);
            return _document;
        }

        void BuildNode(string nodeName, string nodeText)
        {
            XmlElement xe = _document.CreateElement(nodeName);
            xe.InnerText = nodeText;
            _root.AppendChild(xe);
        }
    }
}
