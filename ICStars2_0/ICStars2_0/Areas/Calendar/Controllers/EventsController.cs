using System;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using System.Windows.Forms;
using ICStars2_0.BusinessLayer;
using ICStars2_0.BusinessLayer.CalendarServices;
using ICStars2_0.BusinessLayer.Provider;
using ICStars2_0.BusinessLayer.SteansSettings;
using ICStars2_0.BusinessLayer.TimerEvent;
using ICStars2_0.Common;
using ICStars2_0.Model;
using ICStars2_0.Mvc.Filter;
using log4net;
using Microsoft.Practices.Unity;

namespace ICStars2_0.Areas.Calendar.Controllers
{
    //For more info about the calneder check out the link https://fullcalendar.io 
    [CalendarAuthorize(Roles = "SteansWeb,admin,admin_calendar,Steans,Staff")]
    public class EventsController : Controller
    {
        private static readonly ILog Logger = LogManager.GetLogger(typeof(EventsController));
        //
        // GET: /Calendar/Events/
        [Dependency]
        public IUserData UserData { get; set; }

        [Dependency]
        public ISteansSettingsFactory SteansSettingsFactory { get; set; }

        [Dependency]
        public ICalendarFactory CalendarFactory { get; set; }

        private JsonResult BuildJsonDisaaproved(DateTime startDate, DateTime endDate, bool? isApproved= true,bool isMine = false )
        {
            JsonResult r = Json(
                   CalendarFactory.BuildEvents(startDate, endDate, isApproved, isMine)
                       .Select(
                           e =>
                               new
                               {
                                   id = e.OriginalID > 0 ? Guid.NewGuid().ToString() : e.ID.ToString(),
                                   originalID = e.OriginalID,
                                   title = e.Title,
                                   allDay = e.Allday,
                                   url = e.Url,
                                   start = e.Start.ToString("MM/dd/yyyy HH:mm"),
                                   end = e.End.ToString("MM/dd/yyyy HH:mm"),
                                   eventype = e.EventTypeEnum,
                                   color =
                                       e.EventType == (int)CalendarEventType.Van
                                           ? "#996633"
                                           : (e.EventType == (int)CalendarEventType.Room101 ? "#007F9C" : "#CC3300")

,


                                   editable = User.IsInRole("admin_calendar")
                               }), //This to load only the calendar events not the social events 
                   JsonRequestBehavior.AllowGet);
            return r;
              

        }

        private JsonResult BuildJson(DateTime startDate, DateTime endDate, bool? isApproved = true, bool isMine = false)
        {
            JsonResult r =   Json(
                    CalendarFactory.BuildEvents(startDate, endDate, isApproved, isMine)
                        .Select(
                            e =>
                                new
                                {
                                    id = e.OriginalID>0?Guid.NewGuid().ToString():e.ID.ToString(),
                                    originalID=e.OriginalID,
                                    title = e.Title,
                                    allDay = e.Allday,
                                    url = e.Url,
                                    start = e.Start.ToString("MM/dd/yyyy HH:mm"),
                                    end = e.End.ToString("MM/dd/yyyy HH:mm"),
                                   eventype = e.EventTypeEnum ,
                                    color =
                                        e.EventType == (int) CalendarEventType.Van
                                            ? "#996633"
                                            : (e.EventType == (int) CalendarEventType.Room101 ? "#007F9C" : "#CC3300")
                                            
,
                                            

                                    editable = User.IsInRole("admin_calendar")
                                }).Where(e => e.eventype != CalendarEventType.SteansEvent), //This to load only the calendar events not the social events 
                    JsonRequestBehavior.AllowGet);
            return r;
              


        }


        private JsonResult BuildJsonSocialEvents(DateTime startDate, DateTime endDate, bool? isApproved = true, bool isMine = false)
        {

            //var s = CalendarFactory.BuildEvents(startDate, endDate, isApproved, isMine).Select(e => new { id = e.ID, eventype = e.EventTypeEnum }).Where(e => e.eventype == CalendarEventType.SteansEvent);
            JsonResult r = Json(
                    CalendarFactory.BuildEvents(startDate, endDate, isApproved, isMine)
                        .Select(
                            e =>
                                new
                                {
                                    id = e.OriginalID > 0 ? Guid.NewGuid().ToString() : e.ID.ToString(),
                                    originalID = e.OriginalID,
                                    title = e.Title,
                                    allDay = e.Allday,
                                    url = e.Url,
                                    start = e.Start.ToString("MM/dd/yyyy HH:mm"),
                                    end = e.End.ToString("MM/dd/yyyy HH:mm"),
                                    color = "#594BD7",
                                    eventype = e.EventTypeEnum ,
                                    EventType = e.EventType,
                                    editable = User.IsInRole("admin_calendar")
                                }).Where(e => e.eventype == CalendarEventType.SteansEvent),
                    JsonRequestBehavior.AllowGet);
            return r;


        }

        public JsonResult Approved()
        {
            var startS = Request.QueryString["sd"];
            var endS = Request.QueryString["ed"];
            var sd = Convert.ToDateTime(startS);
            var ed = Convert.ToDateTime(endS);
            return BuildJson(sd, ed);
        }

        public JsonResult My()
        {
            var startS = Request.QueryString["sd"];
            var endS = Request.QueryString["ed"];
            var sd = Convert.ToDateTime(startS);
            var ed = Convert.ToDateTime(endS);
            return BuildJson(sd, ed, null,true);
        }
        public JsonResult All()
        {
            var startS = Request.QueryString["sd"];
            var endS = Request.QueryString["ed"];
            var sd = Convert.ToDateTime(startS);
            var ed = Convert.ToDateTime(endS);
            return BuildJson(sd, ed,null);
        }

        public JsonResult SocialEvents()
        {
            var startS = Request.QueryString["sd"];
            var endS = Request.QueryString["ed"];
            var sd = Convert.ToDateTime(startS);
            var ed = Convert.ToDateTime(endS);
            return BuildJsonSocialEvents(sd, ed);

        }
        public ActionResult EventDetails(int id)
        {
            return View(CalendarFactory.GetEventAdapter(id));

        }
        public ActionResult RepeatEventDetails(int id,DateTime start)
        {
            var evt = CalendarFactory.GetEventAdapter(id);
            evt.StartDate = start.ToString("MM/dd/yyyy");
            return View("EventDetails", evt);

        }
        public ActionResult CreateEvent()
        {
            return View();
        }

        [HttpPost]
        public ActionResult CreateEvent(CalendarEventAdapter e, CalendarEventRepeatSettingsAdapter adapter)
        {
            ModelState.Remove("DriverName");
            ModelState.Remove("DriverDPUID");
            ModelState.Remove("DriverPhone");
            ModelState.Remove("DriverNotes");
            ModelState.Remove("Sponsor");
            ModelState.Remove("Location");

            if (!ModelState.IsValid) return View(e);

            try
            {

                var link = new Uri(Request.Url, Url.Action("NeedApprovals", "Reservation")).ToString();
                return Json(new {msg = CalendarFactory.UpdateEvent(e,adapter, link) ? "success" : "failed"},
                    JsonRequestBehavior.AllowGet);

            }
            catch (Exception exp)
            {
                if (exp is FormatException)
                {
                    return Json(new {msg = "format error"}, JsonRequestBehavior.AllowGet);
                }
#if DEBUG
                throw;
#endif
                Log4NetHelper.WriteLog(exp, Logger);
            }
            ModelState.AddModelError("Title", "System Error! Please Try it again.");

            return View(e);
        }

        #region =Admin=


        [CalendarOverrideAuthorize(Roles = "admin,admin_calendar")]
        public ActionResult EditEvent(int id)
        {
            return View("CreateEvent", CalendarFactory.GetEventAdapter(id));

        }
        [CalendarOverrideAuthorize(Roles = "admin,admin_calendar")]
        public JsonResult NeedApprovals()
        {
            var startS = Request.QueryString["sd"];
            var endS = Request.QueryString["ed"];
            var sd = Convert.ToDateTime(startS);
            var ed = Convert.ToDateTime(endS);
            return BuildJsonDisaaproved(sd, ed, false);
        }
        [CalendarOverrideAuthorize(Roles = "admin,admin_calendar")]
        public ActionResult Approve(int id)
        {

            var link = new Uri(Request.Url, Url.Action("Index", "Reservation")).ToString();
            return Json(new { msg = CalendarFactory.ApproveEvent(id, link) ? "Success" : "Failed" },
                JsonRequestBehavior.AllowGet);
        }

        [CalendarOverrideAuthorize(Roles = "admin,admin_calendar")]
        public ActionResult Disapprove(int id)
        {
            return Json(new { msg = CalendarFactory.DisapproveEvent(id) ? "Success" : "Failed" }, JsonRequestBehavior.AllowGet);

        }
        [CalendarOverrideAuthorize(Roles = "admin,admin_calendar")]
        public ActionResult Delete(CalendarDeletingEvent deletingEvent)
        {
            
                return Json(new { msg = CalendarFactory.DeleteEventAndRecurringEvents(deletingEvent)? "Success":"Failed" }, JsonRequestBehavior.AllowGet);
            
        }
        [CalendarOverrideAuthorize(Roles = "admin,admin_calendar")]
        [HttpPost]
        public ActionResult Drop(CalendarDroppingEvent droppingEventCommand)
        {
            return Json(CalendarFactory.DropEvent(droppingEventCommand));
        }
        [CalendarOverrideAuthorize(Roles = "admin,admin_calendar")]
        [HttpPost]
        public ActionResult Resize(int id, int dayDelta, int minuteDelta)
        {
            return Json(CalendarFactory.ResizeEvent(id, dayDelta, minuteDelta));

        }
        #endregion
    }
}
