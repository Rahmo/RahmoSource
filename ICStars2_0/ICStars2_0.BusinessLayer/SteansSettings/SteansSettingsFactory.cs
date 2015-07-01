using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Xml;
using System.Xml.Serialization;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.BusinessLayer.TimerEvent;
using ICStars2_0.Common.XML;
using ICStars2_0.Framework;

namespace ICStars2_0.BusinessLayer.SteansSettings
{
    class SteansSettingsFactory : ISteansSettingsFactory, IWeakReferenceRegister
    {
        private static object XmlLocker=new object();
        public T CreateBaseSetings<T>()
        {
            XmlDocument doc = new XmlDocument();
            T settings = Activator.CreateInstance<T>();
            var filePath = ((ISettings) settings).FilePath;
            if (!File.Exists(filePath)) return settings;
            lock (XmlLocker)
            {
                doc.Load(filePath);
            }
            ClassBuilder<T> builder = new ClassBuilder<T>(doc);
            return builder.Build();
        }

        public void SaveSettings<T>(T settings)
        {
            XmlBuilder builder=new XmlBuilder(settings);
            XmlDocument doc = builder.Build();
            lock (XmlLocker)
            {
                doc.Save(((ISettings)settings).FilePath);
            }
        }
        public T CreateStandardSetings<T>()
        {
            T settings = Activator.CreateInstance<T>();
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

        public void SaveStandardSettings<T>(T settings)
        {
            XmlBuilder builder = new XmlBuilder(settings);
            XmlDocument doc = builder.Build();
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
