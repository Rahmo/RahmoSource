using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;

namespace ICStars2_0.BusinessLayer.TimerEvent
{
    /// <summary>
    /// We keep instances of this class in xml files
    /// </summary>
    public class EventTriggerDateTime
    {
        public WeekDay DayOfWeek { get; set; }
        /// <summary>
        /// Specific to date, not time
        /// e.g. 03/30/2012
        /// </summary>
        public DateTime? SpecificDate { get; set; }
        public bool IsEveryDay { get; set; }
        public int HourOfDay { get; set; }
        public int MinuteOfHour { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public EventTriggerDateTime()
        {
            DayOfWeek = WeekDay.Null;
        }
    }
}
