using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Timers;
using ICStars2_0.Framework;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.TimerEvent
{
    public class DetailedTimer:IDisposable
    {
        private Timer Timer { get; set; }
        public DateTime StartedTime { get; set; }
        public DateTime StoppedTime { get; set; }
        public DateTime NextExecTime { get; set; }
        public bool Enabled {
            get { return Timer.Enabled; }
        }
        public List<INotification> Notifications { get; set; }
        public DetailedTimer()
        {
            Timer = new Timer(60000);
            Notifications = new List<INotification>();

            Timer.Elapsed += mytimer_Elapsed;
        }
        public DetailedTimer(Timer timer)
        {
            Timer = timer ?? new Timer(60000);
            Notifications = new List<INotification>();

            Timer.Elapsed += mytimer_Elapsed;
        }
        void mytimer_Elapsed(object sender, ElapsedEventArgs e)
        {
            NextExecTime = NextExecTime.AddMilliseconds(Timer.Interval);
            foreach (var notification in Notifications)
            {
                notification.Call();
            }
            
        }
        /// <summary>
        /// Before start the timer, please make sure initialize notifications using SetNotification(INotification notification)
        /// </summary>
        public void Start()
        {
            if (Notifications.Count == 0)
            {
                throw new Exception("Before start the timer, please make sure initialize notifications using SetNotification(INotification notification)");
            }
            StartedTime = DateTime.Now;
            Timer.Start();
            NextExecTime = DateTime.Now.AddMilliseconds(Timer.Interval);
        }
        public void Stop()
        {
            StoppedTime = DateTime.Now;
            NextExecTime = DateTime.MinValue;
            Timer.Stop();
        }
        #region =Set Notification=
        public void SetNotification(INotification notification)
        {


            //for better performance
            if (Notifications.Count == 0)
            {
                Notifications.Add(notification);
                return;
            }

            var t = notification.GetType();
            if (Notifications.All(n => n.GetType() != t))
            {
                Notifications.Add(notification);
                return;
            }
            //make sure that there is only one instance for each type of notification
            for (var i = 0; i < Notifications.Count; i++)
            {
                if (Notifications[i].GetType() == t)
                {
                    Notifications[i] = notification;
                }
            }

        }

        #endregion

        public void Dispose()
        {
            Timer.Dispose();
            Notifications = null;
        }
    }
}
