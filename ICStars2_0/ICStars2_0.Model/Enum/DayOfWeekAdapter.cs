using System;
using DocumentFormat.OpenXml.Bibliography;

namespace ICStars2_0.Model.Enum
{
    public class DayOfWeekAdapter
    {
        private DayOfWeek dayOfWeek;
        public DayOfWeekAdapter(WeekDay weekday)
        {
            switch (weekday)
            {
                case WeekDay.Monday:
                    dayOfWeek = DayOfWeek.Monday;
                    break;
                case WeekDay.Tuesday:
                    dayOfWeek = DayOfWeek.Tuesday;
                    break;
                case WeekDay.Wednesday:
                    dayOfWeek = DayOfWeek.Wednesday;
                    break;
                case WeekDay.Thursday:
                    dayOfWeek = DayOfWeek.Thursday;
                    break;
                case WeekDay.Friday:
                    dayOfWeek = DayOfWeek.Friday;
                    break;
                case WeekDay.Saturday:
                    dayOfWeek = DayOfWeek.Saturday;
                    break;
                case WeekDay.Sunday:
                    dayOfWeek = DayOfWeek.Sunday;
                    break;
            }
        }
        public DayOfWeek Build()
        {
            return dayOfWeek;
        }
    }
}
