using System.IO;
using System.Text;
using System.Web.Mvc;
using System.Xml.Serialization;

namespace ICStars2_0.Mvc
{
    public static class ResultHelper
    {
        /// <summary>
        /// 生成xml ContentResult
        /// </summary>
        /// <param name="result"></param>
        /// <returns></returns>
        public static ContentResult BuildXmlContent(object result)
        {
            var serializer = new XmlSerializer(result.GetType());
            using (var ms = new MemoryStream())
            {
                serializer.Serialize(ms, result);
                return new ContentResult { Content = Encoding.UTF8.GetString(ms.ToArray()), ContentType = "text/xml", ContentEncoding = Encoding.UTF8 };
            }
        }
    }
}
