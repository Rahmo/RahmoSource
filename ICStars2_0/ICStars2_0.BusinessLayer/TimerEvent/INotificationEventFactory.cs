using System.Collections.Generic;

namespace ICStars2_0.BusinessLayer.TimerEvent
{
    public interface INotificationEventFactory
    {
        INotification BuildStudentNotificationEvent();
        INotification BuildDatabasebackupEvent();
        IEnumerable<INotification> BuildNotifications();
    }
}