using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Xml.Serialization;
using ICStars2_0.Common;

namespace ICStars2_0.BusinessLayer.TimerEvent
{

    internal abstract class NotificationEvent
    {
        public IEnumerable<EventTriggerDateTime> EventTriggerDateTimes { get; set; }
        /// <summary>
        /// The path of a xml file with all EventTriggerDateTime information
        /// </summary>
        protected abstract string FilePath { get; }
        private static readonly object locker = new object();
        protected NotificationEvent()
        {
            EventTriggerDateTimes = ReadFromFile();
        }
        public void Call()
        {
            foreach (var eventTriggerDateTime in EventTriggerDateTimes)
            {
                if (eventTriggerDateTime.StartDate != null)
                {
                    var startdate = (DateTime) eventTriggerDateTime.StartDate;
                    if (DateTime.Now.Year < startdate.Year
                        ||
                        (DateTime.Now.Year == startdate.Year && DateTime.Now.DayOfYear < startdate.DayOfYear)
                        )
                    {
                        continue;
                    }
                }
                if (eventTriggerDateTime.EndDate != null)
                {
                    var enddate = (DateTime) eventTriggerDateTime.EndDate;
                    if (DateTime.Now.Year > enddate.Year
                        ||
                        (DateTime.Now.Year == enddate.Year && DateTime.Now.DayOfYear > enddate.DayOfYear)
                        )
                    {
                        continue;
                    }
                }
                if (eventTriggerDateTime.SpecificDate != null)
                {
                    var date = (DateTime)eventTriggerDateTime.SpecificDate;
                    if (date.Year == DateTime.Now.Year
                        && date.Month == DateTime.Now.Month
                        && date.Day == DateTime.Now.Day
                        && eventTriggerDateTime.HourOfDay == DateTime.Now.Hour
                        && eventTriggerDateTime.MinuteOfHour == DateTime.Now.Minute)
                    {
                        Process();
                    }
                    continue;
                }
                if (eventTriggerDateTime.IsEveryDay)
                {
                    if (
                        DateTime.Now.Hour == eventTriggerDateTime.HourOfDay 
                        && DateTime.Now.Minute == eventTriggerDateTime.MinuteOfHour)
                    {
                        Process();
                    }
                    continue;
                }
                if (eventTriggerDateTime.DayOfWeek != WeekDay.Null)
                {
                    var weekday = new WeekDayAdapter(DateTime.Now.DayOfWeek).Build();
                    if ((eventTriggerDateTime.DayOfWeek | weekday) == eventTriggerDateTime.DayOfWeek
                        && DateTime.Now.Hour == eventTriggerDateTime.HourOfDay
                        && DateTime.Now.Minute == eventTriggerDateTime.MinuteOfHour)
                    {
                        Process();
                    }
                }
            }
            
        }
        private IEnumerable<EventTriggerDateTime> ReadFromFile()
        {
            if (!File.Exists(FilePath))
            {
                return new [] {new EventTriggerDateTime()};
            }
            var deserializer = new XmlSerializer(typeof(EventTriggerDateTime[]));
            lock (locker)
            {
                using (TextReader textReader = new StreamReader(FilePath))
                {
                    return (IEnumerable<EventTriggerDateTime>) deserializer.Deserialize(textReader);
                }
            }
        }
        public virtual void SaveToFile()
        {
            var xs = new XmlSerializer(EventTriggerDateTimes.GetType());
            lock (locker)
            {
                using (TextWriter textWriter = new StreamWriter(FilePath))
                {
                    xs.Serialize(textWriter, EventTriggerDateTimes);
                }
            }
        }
        protected abstract void Process();
    }
}
