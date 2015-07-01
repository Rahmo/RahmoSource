using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ICStars2_0.BusinessLayer.TimerEvent
{

    public interface INotification
    {
        IEnumerable<EventTriggerDateTime> EventTriggerDateTimes { get; set; }
        void Call();
        void SaveToFile();
    }
}
