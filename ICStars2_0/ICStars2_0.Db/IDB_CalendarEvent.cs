using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;

namespace ICStars2_0.Db
{
    public interface IDB_CalendarEvent
    {
        /// <summary>
        /// Extend the datetime of an event.
        /// Return the number of affected rows in the database.
        /// </summary>
        /// <param name="eventId"></param>
        /// <param name="daysOfEnd"></param>
        /// <param name="minutesOfEnd"></param>
        /// <param name="daysOfStart"></param>
        /// <param name="minutesOfStart"></param>
        /// <param name="allDay"></param>
        /// <returns></returns>
        int ExtendStartAndEndDatetime(int eventId,int daysOfEnd=0, int minutesOfEnd=0,int daysOfStart=0,int minutesOfStart=0,bool allDay=false);

        void ExtendStartAndEndDatetimeWithTransaction(WebDbContext db, int eventId, int daysOfEnd = 0,
            int minutesOfEnd = 0, int daysOfStart = 0, int minutesOfStart = 0, bool allDay = false);
        /// <summary>
        /// Delete an event.
        /// Return the number of affected rows in the database.
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns></returns>
        int Delete(int eventId);
        /// <summary>
        /// Insert an event.
        /// Return the number of affected rows in the database.
        /// </summary>
        /// <param name="e"></param>
        /// <returns></returns>
        int Insert(CalendarEvent e);

        void InsertWithTransaction(CalendarEvent e, WebDbContext db);
        /// <summary>
        /// Update an event.
        /// Return the number of affected rows in the database.
        /// </summary>
        /// <param name="e"></param>
        /// <returns></returns>
        int Update(CalendarEvent e);

        void UpdateWithTransaction(CalendarEvent e, WebDbContext db);
        /// <summary>
        /// Initiate an event from the database.
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns></returns>
        CalendarEvent Create(int eventId);
        CalendarEventRepeatSettings CreateEventRepeatSettings(int eventId);
        /// <summary>
        /// Disapprove an event.
        /// Return the number of affected rows in the database.
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns></returns>
        int Disapprove(int eventId);
        /// <summary>
        /// Approve an event.
        /// Return the number of affected rows in the database.
        /// </summary>
        /// <param name="eventId"></param>
        /// <returns></returns>
        int Approve(int eventId);
        /// <summary>
        /// 
        /// </summary>
        /// <param name="predicate">Lambda Expression as the condition. See ICStars2_0.Common.Lambda.PredicateBuilder.</param>
        /// <returns></returns>
        IEnumerable<CalendarEvent> BuildEvents(Expression<Func<CalendarEvent, bool>> predicate);

        void UpdateRepeatSettings(CalendarEventRepeatSettings settings);
        void DeleteRepeatSettings(int calendarEventId);
        void InsertCalendarEventDeletedDateWithTransaction(CalendarEventDeletedDate deletedDate, WebDbContext db);
        int InsertCalendarEventDeletedDate(CalendarEventDeletedDate deletedDate);
        void DeleteCalendarEventDeletedDate(int eventId);
        IEnumerable<CalendarEventDeletedDate> GetCalendarEventDeletedDates(IEnumerable<int> eventIds);
        IEnumerable<CalendarEvent> GetAllRepeatEvents(Expression<Func<CalendarEvent, bool>> predicate);
    }
}
