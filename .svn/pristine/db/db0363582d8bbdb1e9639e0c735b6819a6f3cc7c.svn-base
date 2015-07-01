using System;
using System.Collections.Generic;
using System.Linq;
using System.Transactions;
using DocumentFormat.OpenXml.Bibliography;
using DocumentFormat.OpenXml.Drawing.Charts;
using DocumentFormat.OpenXml.Math;
using ICStars2_0.BusinessLayer.MemberServices;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.SteansSettings.Model;
using ICStars2_0.Common.Lambda;
using ICStars2_0.Common.Reflection;
using ICStars2_0.Db;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;
using ICStars2_0.Model.Enum;
using log4net;
using Microsoft.Practices.Unity;

namespace ICStars2_0.BusinessLayer.CalendarServices
{
    internal class CalendarFactory : ICalendarFactory, ISingletonRegister
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(CalendarFactory));
         [Dependency]
        public IUserData UserData { get; set; }
        [Dependency]
        public IDB_CalendarEvent DbCalendarEvent { get; set; }
        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }
        [Dependency]
        public IMemberFactory MemberFactory { get; set; }  
        public bool ResizeEvent(int eventId, int dayDelta, int minuteDelta)
        {
            if (dayDelta == 0 && minuteDelta == 0)
                return true;
            
                try
                {
                    return
                        DbCalendarEvent.ExtendStartAndEndDatetime(eventId, daysOfEnd: dayDelta, minutesOfEnd: minuteDelta) >
                        0;
                }
                catch (Exception exp)
                {
#if DEBUG
                    throw;
#endif
                    Log4NetHelper.WriteLog(exp, Logger);
                    return false;
                }
            
        }

        public bool DropEvent(CalendarDroppingEvent droppingEvent)
        {
            if (droppingEvent.dayDelta == 0 && droppingEvent.minuteDelta == 0 && droppingEvent.allDay == false)
                return true;
            var evtId = droppingEvent.id == null && droppingEvent.orginalID > 0 ? (int)droppingEvent.orginalID : (int)droppingEvent.id;
            try
            {
                var evt = GetEvent(evtId);
                //normal event
                if (evt.CalendarEventRepeatSettings == null)
                    return
                        DbCalendarEvent.ExtendStartAndEndDatetime(evtId, daysOfEnd: droppingEvent.dayDelta,
                            minutesOfEnd: droppingEvent.minuteDelta,
                            daysOfStart: droppingEvent.dayDelta, minutesOfStart: droppingEvent.minuteDelta,
                            allDay: droppingEvent.allDay) > 0;
                //for repeat events, we create a new event for dropping.
                
                var newEvent = ReflectionHelper.DeepClone(evt);
                newEvent.ID = 0;
                newEvent.Start = droppingEvent.start;
                newEvent.End = droppingEvent.end;
                newEvent.CalendarEventRepeatSettings = null;
                using (var db = new WebDbContext())
                {
                    using (var scope = new TransactionScope(TransactionScopeOption.Required,
                        new TransactionOptions {IsolationLevel = IsolationLevel.ReadCommitted}))
                    {


                        DbCalendarEvent.InsertWithTransaction(newEvent, db);
                        db.SaveChanges();
                        //remove the event we are dragging
                        DbCalendarEvent.InsertCalendarEventDeletedDateWithTransaction(
                            new CalendarEventDeletedDate()
                            {
                                CalendarEventID = evtId,
                                DeletedDate = droppingEvent.start.AddDays(droppingEvent.dayDelta*-1)
                            }, db);
                        db.SaveChanges();
                        scope.Complete();
                    }
                    return true;
                }
            }
            catch (Exception exp)
            {
#if DEBUG
                throw;
#endif
                Log4NetHelper.WriteLog(exp, Logger);
                return false;
            }

        }

        public bool DeleteEvent(CalendarDeletingEvent deletingEvent)
        {
            var evt = GetEvent(deletingEvent.id);
            //normal event
            if(evt.CalendarEventRepeatSettings==null)
                return DbCalendarEvent.Delete(deletingEvent.id) > 0;
                //for repeat events, we insert a deleting date into CalendarEventDeletedDates.

            return DbCalendarEvent.InsertCalendarEventDeletedDate(
                new CalendarEventDeletedDate()
                {
                    CalendarEventID = evt.ID,
                    DeletedDate = deletingEvent.start
                }) > 0;

        }

        public bool DeleteEventAndRecurringEvents(CalendarDeletingEvent deletingEvent)
        {
            DbCalendarEvent.DeleteCalendarEventDeletedDate(deletingEvent.id);
            DbCalendarEvent.DeleteRepeatSettings(deletingEvent.id);
            return DbCalendarEvent.Delete(deletingEvent.id) > 0;
        }

        public bool UpdateEvent(CalendarEventAdapter e, CalendarEventRepeatSettingsAdapter repeatSettingsAdapter = null,
            string linkForNotification = null)
        {
            var settings =
                SteansSettingsFactory.CreateBaseSetings<CalendarNotificationSettings>();
            var result = 0;
            if (e.ID == 0)
            {
                var ce = new CalendarEvent(e) {UserID = UserData.ID};
                if (DbCalendarEvent.Insert(ce) <= 0) return false;
                e.ID = ce.ID;
            }
            else
            {
                //Only admin can edit, so don't change the userid
                var ce = DbCalendarEvent.Create(e.ID);
                ce.Title = e.Title;
                ce.Start = Convert.ToDateTime(string.Format("{0} {1}", e.StartDate, e.StartTime));
                ce.End = Convert.ToDateTime(string.Format("{0} {1}", e.StartDate, e.EndTime));
                ce.DriverInfo = string.Join("|$#$|",
                    new[] {e.DriverName, e.DriverPhone, e.DriverDPUID, e.DriverNotes});
                ce.EventInfo = string.Join("|$#$|",
                    new[] { e.Sponsor, e.Location});
                ce.EventType = e.EventType;
                ce.Notes = e.Notes;
                if (DbCalendarEvent.Update(ce) <= 0) return false;
                //When admin is editting, no need to send notification
                settings.IsSendingEmail = false;
               
            }
            #region =Update RepeatSettings=

            var repeatMsg = string.Empty;
            if (repeatSettingsAdapter != null && repeatSettingsAdapter.IsRepeated)
            {
                var repeatSettings = new CalendarEventRepeatSettings(repeatSettingsAdapter) {CalendarEventID = e.ID};
                DbCalendarEvent.UpdateRepeatSettings(repeatSettings);
                repeatMsg = "(Repeats " + repeatSettingsAdapter.RepeatFrequencyTypeEnum + ")";
            }
            else
            {
                DbCalendarEvent.DeleteRepeatSettings(e.ID);
            }
            #endregion
            #region =Send Notification=

            if (settings.IsSendingEmail)
            {
                if (e.EventTypeEnum == CalendarEventType.SteansEvent)
                {
                     //update the file path to use the other path to have differnt  emails for notifications
                       var requestor = MemberFactory.Create(UserData.ID);
                EmailService.SendEmail("reminder@depaul.edu", settings.RecieverEmailEvents,
                    settings.EmailTitle,
                    settings.EmailBody.Replace("#link#", string.Format("<a href=\"{0}\">{0}</a>", linkForNotification))
                        .Replace("#title#", e.Title)
                        .Replace("#date#", e.StartDate+repeatMsg)
                        .Replace("#time#", string.Format("{0} to {1}", e.StartTime, e.EndTime))
                        .Replace("#resources#", ((CalendarEventType) e.EventType).ToString())
                        .Replace("#event#", string.Format("Sponsor: {0}, Location: {1}", e.Sponsor, e.Location))
                        .Replace("#notes#", e.Notes)
                        .Replace("#requestor#",
                            string.Format("{0} {1} ({2})", requestor.FirstName, requestor.LastName, requestor.Email)),
                    settings.IsHtmlEmail);
                }
                else
                {
                    var requestor = MemberFactory.Create(UserData.ID);
                    EmailService.SendEmail("reminder@depaul.edu", settings.ReceiverEmail,
                        settings.EmailTitle,
                        settings.EmailBody.Replace("#link#", string.Format("<a href=\"{0}\">{0}</a>", linkForNotification))
                            .Replace("#title#", e.Title)
                            .Replace("#date#", e.StartDate + repeatMsg)
                            .Replace("#time#", string.Format("{0} to {1}", e.StartTime, e.EndTime))
                            .Replace("#resources#", ((CalendarEventType)e.EventType).ToString())
                            .Replace("#driver#", string.Format("Driver's Name:  {0}, Driver's Notes: {1}", e.DriverName, e.DriverNotes))
                            .Replace("#notes#", e.Notes)
                            .Replace("#requestor#",
                                string.Format("{0} {1} ({2})", requestor.FirstName, requestor.LastName, requestor.Email)),
                        settings.IsHtmlEmail);  
                }
             
            }

            #endregion

            return true;



        }

        public bool DisapproveEvent(int eventId)
        {
            return DbCalendarEvent.Disapprove(eventId)>0;
        }

        public bool ApproveEvent(int eventId, string linkForNotification = null)
        {

            var e = DbCalendarEvent.Create(eventId);
            e.IsApproved = true;
            if (DbCalendarEvent.Update(e) <= 0) return false;
            var user = MemberFactory.Create(e.UserID);
            if (user == null) return true;
            #region =Send Notification=

            EmailService.SendEmail("reminder@depaul.edu", user.Email,
                string.Format("Your Reservation[{0}] has been approved!", e.Title),
                string.Format(
                    "Your Reservation[{0}] has been approved!<br /><br />To check it, please go to: <a href=\"{1}\">{1}</a>",
                    e.Title, linkForNotification),
                true);

            #endregion

            return true;

        }


        public CalendarEvent GetEvent(int eventId)
        {
            return DbCalendarEvent.Create(eventId);
        }
        public CalendarEventAdapter GetEventAdapter(int eventId)
        {
            var evt = GetEvent(eventId);
            return new CalendarEventAdapter(evt)
            {
                Requestor = !evt.IsApproved ? MemberFactory.Create(evt.UserID) : null,
                RepeatSettingsAdapter =
                    evt.CalendarEventRepeatSettings != null ? new CalendarEventRepeatSettingsAdapter(evt.CalendarEventRepeatSettings) : null
            };
        }
        public IEnumerable<CalendarEvent> BuildEvents(DateTime startDate, DateTime endDate, bool? isApproved, bool isMine = false)
        {
            var predicate = PredicateBuilder.True<CalendarEvent>();
            if (isApproved != null)
            {
                predicate = predicate.And(e => e.IsApproved == isApproved);
            }
            if (isMine)
            {
                predicate = predicate.And(e => e.UserID == UserData.ID);
            }

            #region =Load Repeat Events=

            var repeatEvents = new List<CalendarEvent>();
            var repeatEventsWithSettings = DbCalendarEvent.GetAllRepeatEvents(predicate);
            foreach (var calendarEvent in repeatEventsWithSettings)
            {
                repeatEvents.AddRange(BuildEventsForCurrentMonthByRepeatSettings(calendarEvent,startDate,endDate));
            }
            //remove deleted repeat events
            var deletedDates =
                DbCalendarEvent.GetCalendarEventDeletedDates(repeatEvents.Select(e => e.OriginalID).Distinct());
            //remove operation is below
            #endregion

            predicate = predicate.And(e => e.Start >= startDate && e.End < endDate);
            var defaultEvents = DbCalendarEvent.BuildEvents(predicate);
            return
                defaultEvents.Concat(
                    repeatEvents.Where(re => !defaultEvents.Any(de => re.OriginalID == de.ID && re.Start == de.Start)))
                    .Where(
                        e =>
                            !deletedDates.Any(
                                dd =>
                                    (dd.CalendarEventID == e.ID || dd.CalendarEventID == e.OriginalID) &&
                                    dd.DeletedDate.Equals(e.Start)));
        }


        private IEnumerable<CalendarEvent> BuildEventsForCurrentMonthByRepeatSettings(CalendarEvent evt,DateTime start,DateTime end)
        {
            if (evt == null || evt.CalendarEventRepeatSettings == null) return null;
            var events = new List<CalendarEvent>();
            //timespan between startdate of the event and the first day of the current calendar
            //because we only load the repeat events for current calendar
            var dayspan = start.Date - evt.Start.Date;
            var monthSpan = start.Month - evt.Start.Month;
            var yearSpan = start.Year - evt.Start.Year;
            if (dayspan.Days < 0) dayspan = TimeSpan.Zero;
            switch (evt.CalendarEventRepeatSettings.FrequencyEnumType)
            {
                case CalendarEventRepeatFrequencyType.Daily:
                    //one calendar page has about 50 days
                    for (int i = 0;
                        i < 50;
                        i += evt.CalendarEventRepeatSettings.FrequencyValue)
                    {
                        var dailyEvent = ReflectionHelper.Clone(evt);
                        dailyEvent.OriginalID = dailyEvent.ID;
                        dailyEvent.ID *= -1;
                        dailyEvent.Start = dailyEvent.Start.Add(dayspan).AddDays(i);
                        dailyEvent.End = dailyEvent.End.Add(dayspan).AddDays(i);
                        //match repeat startdate and enddate
                        if (
                            dailyEvent.Start < evt.CalendarEventRepeatSettings.StartDate
                            || dailyEvent.Start.Date > evt.CalendarEventRepeatSettings.EndDate
                            ) continue;
                        events.Add(dailyEvent);
                    }
                    break;
                case CalendarEventRepeatFrequencyType.Weekly:
                    var firstStartDayOfCalendarPage = evt.Start.Add(dayspan);
                    var firstEndDayOfCalendarPage = evt.End.Add(dayspan);
                    //building repeating events
                    //one calendar page has 6 weeks
                    if (evt.CalendarEventRepeatSettings.FrequencyValue < 1)
                    {
                        evt.CalendarEventRepeatSettings.FrequencyValue = 1;
                    }
                    for (int i = 0;
                        i < 6;
                        i += evt.CalendarEventRepeatSettings.FrequencyValue)
                    {

                     

                        foreach (var dayofweek in Enum.GetValues(typeof (DayOfWeek)).Cast<DayOfWeek>())
                        {
                            var weeklyEvent = ReflectionHelper.Clone(evt);
                            weeklyEvent.OriginalID = weeklyEvent.ID;
                            weeklyEvent.ID *= -1;
                            var weekday = new WeekDayAdapter(dayofweek).Build();
                            if ((evt.CalendarEventRepeatSettings.EnumWeekdaysIfWeekly | weekday) ==
                                evt.CalendarEventRepeatSettings.EnumWeekdaysIfWeekly)
                            {

                                weeklyEvent.Start =
                                    firstStartDayOfCalendarPage.AddDays(i * 7 +
                                                                        (dayofweek - firstStartDayOfCalendarPage.DayOfWeek));
                                weeklyEvent.End = firstEndDayOfCalendarPage.AddDays(i * 7 +
                                                                                 (dayofweek - firstEndDayOfCalendarPage.DayOfWeek));
                                //match repeat startdate and enddate
                                if (
                                    weeklyEvent.Start < evt.CalendarEventRepeatSettings.StartDate
                                    || weeklyEvent.Start.Date > evt.CalendarEventRepeatSettings.EndDate
                                    ) continue;
                                events.Add(weeklyEvent);
                            }
                        }

                    }
                    break;
                case CalendarEventRepeatFrequencyType.Monthly:
                    monthSpan += yearSpan*12;
                    //one calendar page is involved with 3 months
                    for (int i = 0;
                        i < 3;
                        i += evt.CalendarEventRepeatSettings.FrequencyValue)
                    {
                        var monthlyEvent = ReflectionHelper.Clone(evt);
                        monthlyEvent.OriginalID = monthlyEvent.ID;
                        monthlyEvent.ID *= -1;
                        monthlyEvent.Start = monthlyEvent.Start.AddMonths(i + monthSpan);
                        monthlyEvent.End = monthlyEvent.End.AddMonths(i + monthSpan);
                        //match repeat startdate and enddate
                        if (
                            monthlyEvent.Start < evt.CalendarEventRepeatSettings.StartDate
                            || monthlyEvent.Start.Date > evt.CalendarEventRepeatSettings.EndDate
                            ) continue;
                        events.Add(monthlyEvent);
                    }
                    break;
                case CalendarEventRepeatFrequencyType.Yearly:
                    //one calendar page is involved only 1 year
                    var yearlyEvent = ReflectionHelper.Clone(evt);
                    yearlyEvent.OriginalID = yearlyEvent.ID;
                    yearlyEvent.ID *= -1;
                    yearlyEvent.Start = yearlyEvent.Start.AddYears(yearSpan);
                    yearlyEvent.End = yearlyEvent.End.AddMonths(yearSpan);
                    //match repeat startdate and enddate
                    if (
                        yearlyEvent.Start < evt.CalendarEventRepeatSettings.StartDate
                        || yearlyEvent.Start.Date > evt.CalendarEventRepeatSettings.EndDate
                        ) break;
                    events.Add(yearlyEvent);
                    break;
            }
            return events;
        }
    }
}
