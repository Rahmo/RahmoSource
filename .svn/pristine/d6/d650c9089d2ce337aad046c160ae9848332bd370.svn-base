using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Xml;
using System.Xml.Serialization;
using Commengdpu.BusinessLayer.Settings.Models;
using ICStars2_0.Common.XML;

namespace Commengdpu.BusinessLayer.Settings
{
    public static class SettingsFactory
    {
        private static readonly object XmlLocker = new object();
        public static T BuildSetings<T>()
        {
            var settings = Activator.CreateInstance<T>();
            var filePath = ((ISettings)settings).FilePath;
            if (!File.Exists(filePath)) return settings;
            var deserializer = new XmlSerializer(typeof(T));
            lock (XmlLocker)
            {
                using (TextReader textReader = new StreamReader(filePath))
                {
                    return (T)deserializer.Deserialize(textReader);
                }
            }
        }

        public static void SaveSettings<T>(T settings)
        {
            var builder = new XmlBuilder(settings);
            var doc = builder.Build();
            lock (XmlLocker)
            {
                doc.Save(((ISettings)settings).FilePath);
            }
            var xs = new XmlSerializer(typeof(T));
            lock (XmlLocker)
            {
                using (TextWriter textWriter = new StreamWriter(((ISettings)settings).FilePath))
                {
                    xs.Serialize(textWriter, settings);
                }
            }
        }
    }
}
