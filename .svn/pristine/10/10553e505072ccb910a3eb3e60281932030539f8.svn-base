using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICStars2_0.Model.Enum;

namespace ICStars2_0.BusinessLayer.CalendarServices
{
    public static class CalendarUtility
    {
        public static string GetFrequencyUnit(CalendarEventRepeatFrequencyType frequencyType, int frequencyValue)
        {
            var unitName = string.Empty;
            switch (frequencyType)
            {
                case CalendarEventRepeatFrequencyType.Daily:
                    unitName = "day";
                    break;
                case CalendarEventRepeatFrequencyType.Weekly:
                    unitName = "week";
                    break;
                case CalendarEventRepeatFrequencyType.Monthly:
                    unitName = "month";
                    break;
                case CalendarEventRepeatFrequencyType.Yearly:
                    unitName = "year";
                    break;
                default:
                    throw new ArgumentOutOfRangeException("frequencyType");
            }
            return unitName + (frequencyValue > 1 ? "s" : "");
        }
    }
}
