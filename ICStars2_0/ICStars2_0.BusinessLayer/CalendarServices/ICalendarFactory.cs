using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ICStars2_0.Model;

namespace ICStars2_0.BusinessLayer.CalendarServices
{
    public interface ICalendarFactory
    {
        /// <summary>
        /// Resize an event.
        /// Parameters are same as Javascript parameters.
        /// Return true:Success; false:Failed
        /// </summary>
        /// <param name="eventId"></param>
        /// <param name="dayDelta"></param>
        /// <param name="minuteDelta"></param>
        /// <returns></returns>
        bool ResizeEvent(int eventId, int dayDelta, int minuteDelta);
        /// <summary>
        /// Drop an event.
        /// Parameters are same as Javascript parameters.
        /// Return true:Success; false:Failed
        /// </summary>
        bool DropEvent(CalendarDroppingEvent droppingEvent);
        /// <summary>
        /// Delete an event.
        /// Return true:Success; false:Failed
        /// </summary>
        bool DeleteEvent(CalendarDeletingEvent deletingEvent);
        bool DeleteEventAndRecurringEvents(CalendarDeletingEvent deletingEvent);
        /// <summary>
        /// Update an event.
        /// Return true:Success; false:Failed
        /// </summary>
        /// <param name="e"></param>
        /// <param name="linkForNotification"></param>
        /// <returns></returns>
        bool UpdateEvent(CalendarEventAdapter e,CalendarEventRepeatSettingsAdapter repeatSettingsAdapter=null, string linkForNotification = null);


        /// <summary>
        /// Disapprove an event.
        /// Return true:Success; false:Failed
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns>true:Success; false:Failed</returns>
        bool DisapproveEvent(int eventId);

        /// <summary>
        /// Approve an event.
        /// Return true:Success; false:Failed
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns>true:Success; false:Failed</returns>
        bool ApproveEvent(int eventId, string linkForNotification = null);
        CalendarEvent GetEvent(int eventId);
        CalendarEventAdapter GetEventAdapter(int eventId);
        IEnumerable<CalendarEvent> BuildEvents(DateTime startDate, DateTime endDate, bool? isApproved = true,bool isMine=false);
    }
}
