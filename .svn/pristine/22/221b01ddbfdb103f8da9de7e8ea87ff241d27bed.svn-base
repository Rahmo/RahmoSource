using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ICStars2_0.BusinessLayer.TimerEvent
{
    public class WeekDayAdapter
    {
        private WeekDay weekday;
        public WeekDayAdapter(DayOfWeek dayOfWeek)
        {
            switch (dayOfWeek)
            {
                    case DayOfWeek.Monday:
                    weekday = WeekDay.Monday;
                    break;
                    case DayOfWeek.Tuesday:
                    weekday = WeekDay.Tuesday;
                    break;
                    case DayOfWeek.Wednesday:
                    weekday = WeekDay.Wednesday;
                    break;
                    case DayOfWeek.Thursday:
                    weekday = WeekDay.Thursday;
                    break;
                    case DayOfWeek.Friday:
                    weekday = WeekDay.Friday;
                    break;
                    case DayOfWeek.Saturday:
                    weekday = WeekDay.Saturday;
                    break;
                    case DayOfWeek.Sunday:
                    weekday = WeekDay.Sunday;
                    break;
            }
        }
        public WeekDay Build()
        {
            return weekday;
        }
    }
}
