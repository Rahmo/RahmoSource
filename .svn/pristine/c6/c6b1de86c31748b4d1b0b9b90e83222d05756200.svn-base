using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Linq.Expressions;
using ICStars2_0.Framework;
using ICStars2_0.Model;
using ICStars2_0.Model.DbContexts;

namespace ICStars2_0.Db
{
    internal class DB_CalendarEvent:IDB_CalendarEvent,ISingletonRegister
    {
        public int ExtendStartAndEndDatetime(int eventId, int daysOfEnd=0, int minutesOfEnd=0, int daysOfStart = 0, int minutesOfStart = 0, bool allDay = false)
        {
            using (var db = new WebDbContext())
            {
                var e = db.CalendarEvents.Find(eventId);
                e.End = e.End.AddDays(daysOfEnd).AddMinutes(minutesOfEnd);
                e.Allday = allDay;
                e.Start = e.Start.AddDays(daysOfStart).AddMinutes(minutesOfStart);
                return db.SaveChanges();
            }
        }

        public void ExtendStartAndEndDatetimeWithTransaction(WebDbContext db, int eventId, int daysOfEnd = 0,
            int minutesOfEnd = 0, int daysOfStart = 0, int minutesOfStart = 0, bool allDay = false)
        {
            var e = db.CalendarEvents.Find(eventId);
            e.End = e.End.AddDays(daysOfEnd).AddMinutes(minutesOfEnd);
            e.Allday = allDay;
            e.Start = e.Start.AddDays(daysOfStart).AddMinutes(minutesOfStart);

        }

        public int Delete(int eventId)
        {
            using (var db = new WebDbContext())
            {
                var e = new CalendarEvent {ID = eventId};

                db.Entry(e).State = EntityState.Deleted;
                return db.SaveChanges();
            }
        }

        public int Insert(CalendarEvent e)
        {
            using (var db = new WebDbContext())
            {
                db.CalendarEvents.Add(e);
                return db.SaveChanges();
            }
        }

        public void InsertWithTransaction(CalendarEvent e,WebDbContext db)
        {
            db.CalendarEvents.Add(e);
        }

        public int Update(CalendarEvent e)
        {
            using (var db = new WebDbContext())
            {
                db.Entry(e).State = EntityState.Modified;
                return db.SaveChanges();
            }
        }

        public void UpdateWithTransaction(CalendarEvent e, WebDbContext db)
        {
            db.Entry(e).State = EntityState.Modified;

        }

        public CalendarEvent Create(int eventId)
        {
            using (var db = new WebDbContext())
            {

                CalendarEvent s = new CalendarEvent();
               s = db.CalendarEvents.Include(ce => ce.CalendarEventRepeatSettings)
                        .FirstOrDefault(ce => ce.ID == eventId);
                return s; 

            }
        }

        public CalendarEventRepeatSettings CreateEventRepeatSettings(int eventId)
        {
            using (var db = new WebDbContext())
            {
                return db.CalendarEventRepeatSettingses.Find(eventId);
            }
        }

        public int Disapprove(int eventId)
        {
            using (var db = new WebDbContext())
            {
                var e = db.CalendarEvents.Find(eventId);
                e.IsApproved = false;
                return db.SaveChanges();
            }
        }

        public int Approve(int eventId)
        {
            using (var db = new WebDbContext())
            {
                var e = db.CalendarEvents.Find(eventId);
                e.IsApproved = true;
                return db.SaveChanges();
            }
        }

        public IEnumerable<CalendarEvent> BuildEvents(Expression<Func<CalendarEvent, bool>> predicate)
        {
            using (var db = new WebDbContext())
            {
                
                return

                    db.CalendarEvents.Where(predicate)
                        .Join(db.Members, c => c.UserID, m => m.ID,
                            (c, m) =>
                                new
                                {
                                    c.ID,
                                    c.Title,
                                    c.Allday,
                                    c.Start,
                                    c.End,
                                    c.Url,
                                    m.FirstName,
                                    m.LastName,
                                    m.CampusConnectID,
                                    c.IsApproved,
                                    c.EventType,
                                    RepeatSettings=db.CalendarEventRepeatSettingses.FirstOrDefault(s=>s.CalendarEventID==c.ID)
                                })
                        .ToList().Select(e => new CalendarEvent()
                        {
                            ID = e.ID,
                            Title = e.Title,
                            Allday = e.Allday,
                            Start = e.Start,
                            End = e.End,
                            Url = e.Url,
                            OwnerFirstName = e.FirstName,
                            OwnerLastName = e.LastName,
                            OwnerCampusConnectID = e.CampusConnectID,
                            IsApproved = e.IsApproved,
                            EventType = e.EventType,
                            CalendarEventRepeatSettings=e.RepeatSettings
                        });

            }
        }

        public void UpdateRepeatSettings(CalendarEventRepeatSettings settings)
        {
            if (settings.CalendarEventID <= 0) return;

            using (var db = new WebDbContext())
            {
                if (db.CalendarEventRepeatSettingses.Any(r => r.CalendarEventID == settings.CalendarEventID))
                {
                    db.Entry(settings).State = EntityState.Modified;
                }
                else
                {
                    db.CalendarEventRepeatSettingses.Add(settings);
                }
                db.SaveChanges();
            }

        }

        public void DeleteRepeatSettings(int calendarEventId)
        {
            if (calendarEventId <= 0) return;

            using (var db = new WebDbContext())
            {
                if (db.CalendarEventRepeatSettingses.Any(r => r.CalendarEventID == calendarEventId))
                {
                    var e = new CalendarEventRepeatSettings { CalendarEventID = calendarEventId };

                    db.Entry(e).State = EntityState.Deleted;
                }
                db.SaveChanges();
            }
        }

        public void InsertCalendarEventDeletedDateWithTransaction(CalendarEventDeletedDate deletedDate, WebDbContext db)
        {
            db.CalendarEventDeletedDates.Add(deletedDate);
        }
        public int InsertCalendarEventDeletedDate(CalendarEventDeletedDate deletedDate)
        {
            using (var db = new WebDbContext())
            {
                db.CalendarEventDeletedDates.Add(deletedDate);
                return db.SaveChanges();
            }
        }

        public void DeleteCalendarEventDeletedDate(int eventId)
        {
            using (var db = new WebDbContext())
            {
                db.CalendarEventDeletedDates.Where(e => e.CalendarEventID == eventId).ToList().ForEach(
                    e => db.CalendarEventDeletedDates.Remove(e));
                db.SaveChanges();
            }

        }

        public IEnumerable<CalendarEventDeletedDate> GetCalendarEventDeletedDates(IEnumerable<int> eventIds)
        {
            using (var db = new WebDbContext())
            {
                return db.CalendarEventDeletedDates.Where(dd => eventIds.Any(id => id == dd.CalendarEventID)).ToList();
            }
        }

        public IEnumerable<CalendarEventRepeatSettings> GetAllAvailableRepeatSettingses()
        {
            using (var db = new WebDbContext())
            {
                return
                    db.CalendarEventRepeatSettingses.Where(settings => settings.EndDate < DateTime.Now.AddDays(1))
                        .ToList();
            }
        }
        public IEnumerable<CalendarEvent> GetAllRepeatEvents(Expression<Func<CalendarEvent, bool>> predicate)
        {
            using (var db = new WebDbContext())
            {
                var today = DateTime.Now.Date;
                return
                    db.CalendarEvents.Include(ce => ce.CalendarEventRepeatSettings).Where(predicate)
                        .Where(
                            e =>
                                db.CalendarEventRepeatSettingses.Any(
                                    settings =>
                                        settings.CalendarEventID == e.ID
                                        && (settings.EndDate == null || settings.EndDate >= today)
                                        //&& settings.StartDate >= today
                                        )
                                        ).ToList();
            }
        }
    }
}
