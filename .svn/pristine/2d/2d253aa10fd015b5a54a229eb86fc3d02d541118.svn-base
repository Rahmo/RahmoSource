using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Web;
using ICStars2_0.BusinessLayer.TimerEvent.Events;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.TimerEvent
{
    internal class NotificationEventFactory : INotificationEventFactory,ISingletonRegister
    {
        public INotification BuildStudentNotificationEvent()
        {
            return ICStarsUnityContainer.Current.Resolve<StudentNotificationEvent>();   
        }
        public INotification BuildDatabasebackupEvent()
        {
            return ICStarsUnityContainer.Current.Resolve<DatabaseBackupEvent>();
        }
        /// <summary>
        /// Build all notification instances that implemented interface INotification
        /// </summary>
        /// <returns></returns>
        public IEnumerable<INotification> BuildNotifications()
        {
            var asse = Assembly.GetExecutingAssembly();
            var types = asse.GetTypes();
            var typeNotifications = types.Where(t => !t.IsInterface && t.FindInterfaces((tt, o) => o.Equals(tt), typeof(INotification)).Length > 0);
            return typeNotifications.Select(t => (INotification)ICStarsUnityContainer.Current.Resolve (t));

        }
    }
}
